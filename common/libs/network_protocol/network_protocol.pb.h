/* Automatically generated nanopb header */
/* Generated by nanopb-0.4.1 */

#ifndef PB_NETWORK_PROTOCOL_PB_H_INCLUDED
#define PB_NETWORK_PROTOCOL_PB_H_INCLUDED
#include <pb.h>

#if PB_PROTO_HEADER_VERSION != 40
#error Regenerate this file with the current version of nanopb generator.
#endif

#ifdef __cplusplus
extern "C" {
#endif

/* Enum definitions */
typedef enum _VentMode {
    VentMode_OFF = 0,
    VentMode_PRESSURE_CONTROL = 1,
    VentMode_PRESSURE_ASSIST = 2,
    VentMode_PRESSURE_SUPPORT = 3
} VentMode;

typedef enum _AlarmKind {
    AlarmKind_RESPIRATORY_RATE_TOO_LOW = 1,
    AlarmKind_RESPIRATORY_RATE_TOO_HIGH = 2,
    AlarmKind_TIDAL_VOLUME_TOO_LOW = 3,
    AlarmKind_TIDAL_VOLUME_TOO_HIGH = 4
} AlarmKind;

/* Struct definitions */
typedef struct _Alarm {
    uint64_t start_time;
    AlarmKind kind;
} Alarm;

typedef struct _SensorReadings {
    float pressure_cm_h2o;
    float volume_ml;
    float flow_ml_per_min;
} SensorReadings;

typedef struct _VentParams {
    VentMode mode;
    uint32_t percent_inspiratory_o2;
    uint32_t peep_cm_h2o;
    uint32_t breaths_per_min;
    uint32_t pip_cm_h2o;
    float inspiratory_expiratory_ratio;
    uint32_t rise_time_ms;
    uint32_t inspiratory_trigger_cm_h2o;
    uint32_t expiratory_trigger_ml_per_min;
    uint32_t alarm_lo_tidal_volume_ml;
    uint32_t alarm_hi_tidal_volume_ml;
    uint32_t alarm_lo_breaths_per_min;
    uint32_t alarm_hi_breaths_per_min;
} VentParams;

typedef struct _ControllerStatus {
    uint64_t uptime_ms;
    VentParams active_params;
    SensorReadings sensor_readings;
    pb_size_t controller_alarms_count;
    Alarm controller_alarms[4];
} ControllerStatus;

typedef struct _GuiStatus {
    uint64_t uptime_ms;
    VentParams desired_params;
    pb_size_t acked_alarms_count;
    Alarm acked_alarms[4];
} GuiStatus;


/* Helper constants for enums */
#define _VentMode_MIN VentMode_OFF
#define _VentMode_MAX VentMode_PRESSURE_SUPPORT
#define _VentMode_ARRAYSIZE ((VentMode)(VentMode_PRESSURE_SUPPORT+1))

#define _AlarmKind_MIN AlarmKind_RESPIRATORY_RATE_TOO_LOW
#define _AlarmKind_MAX AlarmKind_TIDAL_VOLUME_TOO_HIGH
#define _AlarmKind_ARRAYSIZE ((AlarmKind)(AlarmKind_TIDAL_VOLUME_TOO_HIGH+1))


/* Initializer values for message structs */
#define GuiStatus_init_default                   {0, VentParams_init_default, 0, {Alarm_init_default, Alarm_init_default, Alarm_init_default, Alarm_init_default}}
#define ControllerStatus_init_default            {0, VentParams_init_default, SensorReadings_init_default, 0, {Alarm_init_default, Alarm_init_default, Alarm_init_default, Alarm_init_default}}
#define VentParams_init_default                  {_VentMode_MIN, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
#define SensorReadings_init_default              {0, 0, 0}
#define Alarm_init_default                       {0, _AlarmKind_MIN}
#define GuiStatus_init_zero                      {0, VentParams_init_zero, 0, {Alarm_init_zero, Alarm_init_zero, Alarm_init_zero, Alarm_init_zero}}
#define ControllerStatus_init_zero               {0, VentParams_init_zero, SensorReadings_init_zero, 0, {Alarm_init_zero, Alarm_init_zero, Alarm_init_zero, Alarm_init_zero}}
#define VentParams_init_zero                     {_VentMode_MIN, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
#define SensorReadings_init_zero                 {0, 0, 0}
#define Alarm_init_zero                          {0, _AlarmKind_MIN}

/* Field tags (for use in manual encoding/decoding) */
#define Alarm_start_time_tag                     1
#define Alarm_kind_tag                           2
#define SensorReadings_pressure_cm_h2o_tag       1
#define SensorReadings_volume_ml_tag             2
#define SensorReadings_flow_ml_per_min_tag       3
#define VentParams_mode_tag                      1
#define VentParams_percent_inspiratory_o2_tag    2
#define VentParams_peep_cm_h2o_tag               3
#define VentParams_breaths_per_min_tag           4
#define VentParams_pip_cm_h2o_tag                5
#define VentParams_inspiratory_expiratory_ratio_tag 6
#define VentParams_rise_time_ms_tag              7
#define VentParams_inspiratory_trigger_cm_h2o_tag 8
#define VentParams_expiratory_trigger_ml_per_min_tag 9
#define VentParams_alarm_lo_tidal_volume_ml_tag  10
#define VentParams_alarm_hi_tidal_volume_ml_tag  11
#define VentParams_alarm_lo_breaths_per_min_tag  12
#define VentParams_alarm_hi_breaths_per_min_tag  13
#define ControllerStatus_uptime_ms_tag           1
#define ControllerStatus_active_params_tag       2
#define ControllerStatus_sensor_readings_tag     3
#define ControllerStatus_controller_alarms_tag   4
#define GuiStatus_uptime_ms_tag                  1
#define GuiStatus_desired_params_tag             2
#define GuiStatus_acked_alarms_tag               3

/* Struct field encoding specification for nanopb */
#define GuiStatus_FIELDLIST(X, a) \
X(a, STATIC,   REQUIRED, UINT64,   uptime_ms,         1) \
X(a, STATIC,   REQUIRED, MESSAGE,  desired_params,    2) \
X(a, STATIC,   REPEATED, MESSAGE,  acked_alarms,      3)
#define GuiStatus_CALLBACK NULL
#define GuiStatus_DEFAULT NULL
#define GuiStatus_desired_params_MSGTYPE VentParams
#define GuiStatus_acked_alarms_MSGTYPE Alarm

#define ControllerStatus_FIELDLIST(X, a) \
X(a, STATIC,   REQUIRED, UINT64,   uptime_ms,         1) \
X(a, STATIC,   REQUIRED, MESSAGE,  active_params,     2) \
X(a, STATIC,   REQUIRED, MESSAGE,  sensor_readings,   3) \
X(a, STATIC,   REPEATED, MESSAGE,  controller_alarms,   4)
#define ControllerStatus_CALLBACK NULL
#define ControllerStatus_DEFAULT NULL
#define ControllerStatus_active_params_MSGTYPE VentParams
#define ControllerStatus_sensor_readings_MSGTYPE SensorReadings
#define ControllerStatus_controller_alarms_MSGTYPE Alarm

#define VentParams_FIELDLIST(X, a) \
X(a, STATIC,   REQUIRED, UENUM,    mode,              1) \
X(a, STATIC,   REQUIRED, UINT32,   percent_inspiratory_o2,   2) \
X(a, STATIC,   REQUIRED, UINT32,   peep_cm_h2o,       3) \
X(a, STATIC,   REQUIRED, UINT32,   breaths_per_min,   4) \
X(a, STATIC,   REQUIRED, UINT32,   pip_cm_h2o,        5) \
X(a, STATIC,   REQUIRED, FLOAT,    inspiratory_expiratory_ratio,   6) \
X(a, STATIC,   REQUIRED, UINT32,   rise_time_ms,      7) \
X(a, STATIC,   REQUIRED, UINT32,   inspiratory_trigger_cm_h2o,   8) \
X(a, STATIC,   REQUIRED, UINT32,   expiratory_trigger_ml_per_min,   9) \
X(a, STATIC,   REQUIRED, UINT32,   alarm_lo_tidal_volume_ml,  10) \
X(a, STATIC,   REQUIRED, UINT32,   alarm_hi_tidal_volume_ml,  11) \
X(a, STATIC,   REQUIRED, UINT32,   alarm_lo_breaths_per_min,  12) \
X(a, STATIC,   REQUIRED, UINT32,   alarm_hi_breaths_per_min,  13)
#define VentParams_CALLBACK NULL
#define VentParams_DEFAULT NULL

#define SensorReadings_FIELDLIST(X, a) \
X(a, STATIC,   REQUIRED, FLOAT,    pressure_cm_h2o,   1) \
X(a, STATIC,   REQUIRED, FLOAT,    volume_ml,         2) \
X(a, STATIC,   REQUIRED, FLOAT,    flow_ml_per_min,   3)
#define SensorReadings_CALLBACK NULL
#define SensorReadings_DEFAULT NULL

#define Alarm_FIELDLIST(X, a) \
X(a, STATIC,   REQUIRED, UINT64,   start_time,        1) \
X(a, STATIC,   REQUIRED, UENUM,    kind,              2)
#define Alarm_CALLBACK NULL
#define Alarm_DEFAULT NULL

extern const pb_msgdesc_t GuiStatus_msg;
extern const pb_msgdesc_t ControllerStatus_msg;
extern const pb_msgdesc_t VentParams_msg;
extern const pb_msgdesc_t SensorReadings_msg;
extern const pb_msgdesc_t Alarm_msg;

/* Defines for backwards compatibility with code written before nanopb-0.4.0 */
#define GuiStatus_fields &GuiStatus_msg
#define ControllerStatus_fields &ControllerStatus_msg
#define VentParams_fields &VentParams_msg
#define SensorReadings_fields &SensorReadings_msg
#define Alarm_fields &Alarm_msg

/* Maximum encoded size of messages (where known) */
#define GuiStatus_size                           146
#define ControllerStatus_size                    163
#define VentParams_size                          73
#define SensorReadings_size                      15
#define Alarm_size                               13

#ifdef __cplusplus
} /* extern "C" */
#endif

#endif
