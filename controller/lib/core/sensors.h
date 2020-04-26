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

module contributors: verityRF, jlebar, lee-matthews, Edwin Chiu

The purpose of this module is to allow calibrated readings from the different
pressure sensors in the ventilator design. It is designed to be used with the
Arduino Nano and the MPXV5004GP and MPXV7002DP pressure sensors.
*/

#ifndef SENSORS_H
#define SENSORS_H

#include "hal.h"

// A namespace class for constants related to pressure sensors.
class PressureSensors {
public:
  PressureSensors() = delete;

  // Patient pressure sensor pin
  inline constexpr static AnalogPinId PATIENT_PIN = AnalogPinId::HAL_A0;
  // Inhalation diff pressure sensor pin
  inline constexpr static AnalogPinId INHALATION_PIN = AnalogPinId::HAL_A1;
  // Exhalation diff pressure sensor pin
  inline constexpr static AnalogPinId EXHALATION_PIN = AnalogPinId::HAL_A2;

  // min/max possible reading from MPXV5004GP [kPa]
  inline constexpr static float P_VAL_MIN = 0.0f;
  inline constexpr static float P_VAL_MAX = 3.92f;

  // min/max possible reading from MPXV7002DP [kPa]
  inline constexpr static float DP_VAL_MIN = -2.0f;
  inline constexpr static float DP_VAL_MAX = 2.0f;

  // Default diameters relating to Ethan's Alpha Venturi - II
  // (https://docs.google.com/spreadsheets/d/1G9Kb-ImlluK8MOx-ce2rlHUBnTOtAFQvKjjs1bEhlpM/edit#gid=963553579)
  // Port diameter must be larger than choke diameter [meters]
  inline constexpr static const float DEFAULT_VENTURI_PORT_DIAM = 14e-3f;
  inline constexpr static const float DEFAULT_VENTURI_CHOKE_DIAM = 5.5e-3f;

  static_assert(DEFAULT_VENTURI_PORT_DIAM > DEFAULT_VENTURI_CHOKE_DIAM);
  static_assert(DEFAULT_VENTURI_CHOKE_DIAM > 0.0f);
};

void sensors_init();

/*
 * @brief This method gets the specified calibrated sensor reading and performs
 * simple averaging if configured to do so.
 *
 * @param pinId the pressure sensor pin that a reading is desired from
 *
 * @return The specified pressure sensor calibrated reading in [kPa]
 */
float get_pressure_reading(AnalogPinId pinId);

/*
 * @brief Method for setting the number of samples to use for average during
 * sensor zeroization.
 *
 * @param numAvgSamples the number of samples to use for averaging, between 1
 * and 32 inclusive
 */
void set_zero_avg_samples(int numAvgSamples);

/*
 * @brief Method for getting the number of samples in use for averaging during
 * sensor zeroization.
 *
 * @return A number between 1 and 32 inclusive.
 */
int get_zero_avg_samples();

/*
 * @brief Method for setting the number of samples to use for average during
 * sensor zeroization.
 *
 * @param numAvgSamples the number of samples to use for averaging, between 1
 * and 32 inclusive
 */
void set_sensor_avg_samples(int numAvgSamples);

/*
 * @brief Method for getting the number of samples in use for averaging during
 * calibrated sensor reads.
 *
 * @return A number between 1 and 32 inclusive.
 */
int get_sensor_avg_samples();

/*
 * @brief Method implements Bernoulli's equation assuming the Venturi Effect.
 * https://en.wikipedia.org/wiki/Venturi_effect
 * Solves for the volumetric flow rate since A1/A2, rho, and differential
 * pressure are known. Q = sqrt(2/rho) * (A1*A2) * 1/sqrt(A1^2-A2^2) *
 * sqrt(p1-p2); based on (p1 - p2) = (rho/2) * (v2^2 - v1^2); where A1 > A2
 * @param diffPressureInKiloPascals the differential pressure from a sensor in
 * [kPa]
 * @return the volumetric flow in [meters^3/s]. Can be negative, indicating
 * direction of flow, depending on how the differential sensor is attached to
 * the venturi.
 */
float pressure_delta_to_volumetric_flow(float diffPressureInKiloPascals);

#endif // SENSORS_H
