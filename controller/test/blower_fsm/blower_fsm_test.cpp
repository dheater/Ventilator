/* Copyright 2020, RespiraWorks

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

#include "blower_fsm.h"

#include "hal.h"
#include "gmock/gmock-matchers.h"
#include "gtest/gtest.h"
#include <string>

namespace {

static constexpr SensorReadings readings_zero = {.patient_pressure = kPa(0),
                                                 .inflow_pressure_diff = kPa(0),
                                                 .outflow_pressure_diff =
                                                     kPa(0),
                                                 .inflow = ml_per_min(0),
                                                 .outflow = ml_per_min(0),
                                                 .volume = ml(0),
                                                 .net_flow = ml_per_min(0)};

TEST(BlowerFsmTest, InitiallyOff) {
  BlowerFsm fsm;
  VentParams p = VentParams_init_zero;
  BlowerSystemState s = fsm.DesiredState(Hal.now(), p, readings_zero);
  EXPECT_FLOAT_EQ(s.setpoint_pressure.cmH2O(), 0);
  EXPECT_EQ(s.expire_valve_state, ValveState::OPEN);
}

TEST(BlowerFsmTest, StaysOff) {
  BlowerFsm fsm;
  VentParams p = VentParams_init_zero;
  Hal.delay(milliseconds(1000));
  BlowerSystemState s = fsm.DesiredState(Hal.now(), p, readings_zero);
  EXPECT_FLOAT_EQ(s.setpoint_pressure.cmH2O(), 0);
  EXPECT_EQ(s.expire_valve_state, ValveState::OPEN);
}

// Checks that a sequence of calls to blower_fsm_desired_state() yield the
// expected results.
void testSequence(
    const std::vector<
        std::tuple<VentParams,
                   /*sensor_readings*/ SensorReadings,
                   /*blower_enabled*/ bool,
                   /*time_millis*/ uint64_t,
                   /*expected_setpoint_pressure*/ Pressure,
                   /*expected_expiratory_valve_state*/ ValveState>> &seq) {
  BlowerFsm fsm;
  for (const auto &[params, readings, blower_enabled, time_millis,
                    expected_pressure, expected_valve_state] : seq) {
    Hal.delay(microsSinceStartup(time_millis * 1000) - Hal.now());
    SCOPED_TRACE("time = " + std::to_string(time_millis));
    EXPECT_EQ(time_millis * 1000, Hal.now().microsSinceStartup());

    BlowerSystemState s = fsm.DesiredState(Hal.now(), params, readings);
    EXPECT_EQ(s.blower_enabled, blower_enabled);
    EXPECT_EQ(s.setpoint_pressure.cmH2O(), expected_pressure.cmH2O());
    EXPECT_EQ(s.expire_valve_state, expected_valve_state);
  }
}

TEST(BlowerFsmTest, PressureControl) {
  VentParams p = VentParams_init_zero;
  p.mode = VentMode_PRESSURE_CONTROL;
  // 20 breaths/min = 3s/breath.  I:E = 2 means 2s for inspire, 1s for expire.
  p.breaths_per_min = 20;
  p.inspiratory_expiratory_ratio = 2;
  p.peep_cm_h2o = 10;
  p.pip_cm_h2o = 20;

  constexpr int64_t rise_time_us = PressureControlFsm::RISE_TIME.microseconds();
  static_assert(rise_time_us % 1000 == 0,
                "test assumes rise time is a whole number of ms.");
  constexpr int64_t rise_time_ms = rise_time_us / 1000;
  static_assert(rise_time_ms % 4 == 0,
                "test assumes we can divide rise time ms by 4.");
  testSequence({
      // Pressure starts out at PEEP and rises to PIP over period
      // PressureControlFsm::RISE_TIME.
      {p, readings_zero, /*blower_enabled=*/true, 0, cmH2O(10),
       ValveState::CLOSED},
      {p, readings_zero, /*blower_enabled=*/true, rise_time_ms / 4, cmH2O(12.5),
       ValveState::CLOSED},
      {p, readings_zero, /*blower_enabled=*/true, rise_time_ms / 2, cmH2O(15),
       ValveState::CLOSED},
      {p, readings_zero, /*blower_enabled=*/true, 3 * rise_time_ms / 4,
       cmH2O(17.5), ValveState::CLOSED},
      {p, readings_zero, /*blower_enabled=*/true, 1000, cmH2O(20),
       ValveState::CLOSED},
      {p, readings_zero, /*blower_enabled=*/true, 1999, cmH2O(20),
       ValveState::CLOSED},
      {p, readings_zero, /*blower_enabled=*/true, 2001, cmH2O(10),
       ValveState::OPEN},
      {p, readings_zero, /*blower_enabled=*/true, 2999, cmH2O(10),
       ValveState::OPEN},
      {p, readings_zero, /*blower_enabled=*/true, 3001, cmH2O(10),
       ValveState::CLOSED},
      {p, readings_zero, /*blower_enabled=*/true, 3001 + rise_time_ms / 2,
       cmH2O(15), ValveState::CLOSED},
      {p, readings_zero, /*blower_enabled=*/true, 3001 + rise_time_ms,
       cmH2O(20), ValveState::CLOSED},
  });
}

TEST(BlowerFsmTest, PressureAssist) {
  VentParams p = VentParams_init_zero;
  p.mode = VentMode_PRESSURE_ASSIST;
  // 20 breaths/min = 3s/breath.  I:E = 2 means 2s for inspire, 1s for expire.
  p.breaths_per_min = 20;
  p.inspiratory_expiratory_ratio = 2;
  p.peep_cm_h2o = 10;
  p.pip_cm_h2o = 20;

  SensorReadings readings_breath = {.patient_pressure = kPa(0),
                                    .inflow_pressure_diff = kPa(0),
                                    .outflow_pressure_diff = kPa(0),
                                    .inflow = ml_per_min(20000.0f),
                                    .outflow = ml_per_min(0),
                                    .volume = ml(0),
                                    .net_flow = ml_per_min(20000.0f)};

  // - when flow is zero: breath is triggered on expire_deadline_ rather than
  // patient triggered, to enforce minimum respiratory rate
  // - when flow is breath: trigger breath if in expire mode
  testSequence({
      // first breath is mandatory
      {p, readings_zero, /*blower_enabled=*/true, 0, cmH2O(20),
       ValveState::CLOSED},
      // breath has no effect during inspire phase
      {p, readings_breath, /*blower_enabled=*/true, 1000, cmH2O(20),
       ValveState::CLOSED},
      {p, readings_zero, /*blower_enabled=*/true, 1999, cmH2O(20),
       ValveState::CLOSED},
      {p, readings_zero, /*blower_enabled=*/true, 2001, cmH2O(10),
       ValveState::OPEN},
      // need to run with non-breath flow while already in exhale leg to
      // initialize detection threshold
      {p, readings_zero, /*blower_enabled=*/true, 2002, cmH2O(10),
       ValveState::OPEN},
      // check that calling with zero flow before the end of the breath does not
      // tigger the next breath
      {p, readings_zero, /*blower_enabled=*/true, 2500, cmH2O(10),
       ValveState::OPEN},
      {p, readings_zero, /*blower_enabled=*/true, 2999, cmH2O(10),
       ValveState::OPEN},
      // trigger breath on expire_deadline_
      {p, readings_zero, /*blower_enabled=*/true, 3001, cmH2O(20),
       ValveState::CLOSED},
      {p, readings_zero, /*blower_enabled=*/true, 4999, cmH2O(20),
       ValveState::CLOSED},
      {p, readings_zero, /*blower_enabled=*/true, 5001, cmH2O(10),
       ValveState::OPEN},
      // need to run with non-breath flow while already in exhale leg to
      // initialize detection threshold
      {p, readings_zero, /*blower_enabled=*/true, 5002, cmH2O(10),
       ValveState::OPEN},
      {p, readings_breath, /*blower_enabled=*/true, 5200, cmH2O(20),
       ValveState::CLOSED},
      {p, readings_zero, /*blower_enabled=*/true, 7199, cmH2O(20),
       ValveState::CLOSED},
      {p, readings_zero, /*blower_enabled=*/true, 7201, cmH2O(10),
       ValveState::OPEN},

  });
}

TEST(BlowerFsmTest, TurnOff) {
  VentParams p_on = VentParams_init_zero;
  p_on.mode = VentMode_PRESSURE_CONTROL;
  // 20 breaths/min = 3s/breath.  I:E = 2 means 2s for inspire, 1s for expire.
  p_on.breaths_per_min = 20;
  p_on.inspiratory_expiratory_ratio = 2;
  p_on.peep_cm_h2o = 10;
  p_on.pip_cm_h2o = 20;

  VentParams p_off = VentParams_init_zero;

  testSequence({
      {p_off, readings_zero, /*blower_enabled=*/false, 0, cmH2O(0),
       ValveState::OPEN},
      // This is PEEP pressure even though it's inspiration, because ramp it up
      // to PIP over a duration of PressureControlFsm::RISE_TIME.
      {p_on, readings_zero, /*blower_enabled=*/true, 1000, cmH2O(10),
       ValveState::CLOSED},
      {p_off, readings_zero, /*blower_enabled=*/false, 1001, cmH2O(0),
       ValveState::OPEN},
  });
}

TEST(BlowerFsmTest, ChangeOfParamsStartAtTheNextBreath) {
  VentParams p_init = VentParams_init_zero;
  p_init.mode = VentMode_PRESSURE_CONTROL;
  p_init.breaths_per_min = 20;
  p_init.inspiratory_expiratory_ratio = 2; // I: 2s, E: 1s
  p_init.pip_cm_h2o = 20;
  p_init.peep_cm_h2o = 10;

  VentParams p_change = p_init;
  p_change.breaths_per_min = 30;
  p_change.inspiratory_expiratory_ratio = 1; // I: 1s, E: 1s
  p_change.pip_cm_h2o = 30;
  p_change.peep_cm_h2o = 15;

  VentParams p_off = VentParams_init_default;
  //|---------------------|----------|----------|----------|
  // 0                   1999        2999       3999       4999
  //         I                 E           I          E
  testSequence({
      // Switching ON mode takes effect immidiately.  Because of pressure
      // control mode's ramp time, the initial pressure is PEEP, not PIP.
      {p_init, readings_zero, /*blower_enabled=*/true, 0, cmH2O(10),
       ValveState::CLOSED},
      // 2sec of inhalation 1sec of exhalation. Ignores param change, stays on
      // p_init pip.
      {p_change, readings_zero, /*blower_enabled=*/true, 1999, cmH2O(20),
       ValveState::CLOSED},
      {p_change, readings_zero, /*blower_enabled=*/true, 2000, cmH2O(10),
       ValveState::OPEN},
      {p_change, readings_zero, /*blower_enabled=*/true, 3000, cmH2O(10),
       ValveState::OPEN},
      // Previous state finished, switch to p_change settings, 1sec In 1sec Ex.
      {p_change, readings_zero, /*blower_enabled=*/true, 3001, cmH2O(15),
       ValveState::CLOSED},
      {p_init, readings_zero, /*blower_enabled=*/true, 4000, cmH2O(30),
       ValveState::CLOSED},
      // Ignore p_init setting in the middle of a breath.
      {p_init, readings_zero, /*blower_enabled=*/true, 4001, cmH2O(15),
       ValveState::OPEN},
      {p_init, readings_zero, /*blower_enabled=*/true, 5000, cmH2O(15),
       ValveState::OPEN},
      // Switching OFF device, takes effect immidiately.
      {p_off, readings_zero, /*blower_enabled*/ false, 5005, cmH2O(0),
       ValveState::OPEN},
      // Switching ON device, takes effect immidiately.
      {p_init, readings_zero, /*blower_enabled*/ true, 5010, cmH2O(10),
       ValveState::CLOSED},
  });
}

} // anonymous namespace
