## Cycle Controller

Our cycle controller runs on an STM32 ARM chip and is written in C++17.

For more details on the inner workings of the controller, see
[Controller description](https://docs.google.com/document/d/1hztIBu9DR52r0LQuIpt6DZByBLfXfJy21BGqk2F34g8).

**TODO:** Migrate contents of the above document to github.

There is a
[Circuit board ICD](https://docs.google.com/spreadsheets/d/1JOSQKxkQxXJ6MCMDI9PwUQ6kiuGdujR4D6EJN9u2LWg/edit#gid=0)
which is a good reference on controller peripherals.


### Why C++?

C is a much more common programming language in the embedded space, so
our choice of C++ deserves some discussion.

Simply put, we chose C++ over C because we believe it is a more
productive programming language.  Here are some advantages we’ve found
to using C++.

-   In C we’d have to represent a pressure measurement as a number, e.g.
    a float.  This is
    [error-prone](https://www.google.com/url?q=https://mars.nasa.gov/msp98/news/mco990930.html&sa=D&ust=1598802820324000&usg=AOvVaw1JJGniE2Ej0cV9kzlLRVHm) in
    part because the compiler can’t help you keep your units consistent.
    In contrast, our C++ code represents a pressure measurement using an
    explicit
    [Pressure](https://www.google.com/url?q=https://github.com/RespiraWorks/Ventilator/blob/master/software/common/libs/units/units.h&sa=D&ust=1598802820325000&usg=AOvVaw1lzJ287EMVabEsr3ukSM0a) type.
    You can create a Pressure from a measurement in kPa or cmH2O and the
    software will do the unit conversions automatically. We also support
    operators between types.  For instance, dividing a Volume by a
    Duration yields an object of type VolumetricFlow, again with the
    units automatically correct. This is a zero-cost abstraction -- it
    runs just as fast as the equivalent C code -- and it eliminates
    whole classes of bugs.\
-   We use pieces of the C++17 standard library to add safety to our
    code.  For instance, we use C++’s std::variant class for
    discriminated unions instead of C’s union construct.  We also use
    std::optional throughout the code to represent a value that may not
    be present.  This is much safer than most C solutions (e.g. using a
    sentinel value like -1 or NaN to mean “not present”).
-   Some language features of C++ are inherently safer than the
    respective features of plain C. For example, C++ requires the
    programmer to be explicit about type conversion in cases where the
    conversion may be lossy (e.g. from a floating-point to an integer
    type, or from an integer type to a more narrow integer type). In
    contrast, C allows such conversions implicitly, failing to protect
    against a common source of errors in safety-critical software.

We have configured our environment to disallow dynamic memory
allocation, and we do not use C++ exceptions.

### Software Provenance

We wrote all of the cycle controller software from scratch, with two
exceptions:

-   We use
    [nanopb](https://www.google.com/url?q=https://github.com/nanopb/nanopb&sa=D&ust=1598802820326000&usg=AOvVaw32h1Wx44EbdQLQ1Rf3RZ_P) for
    protocol buffer encoding/decoding. Nanopb is an extensively tested
    library used in many projects, and protocol buffers are an industry
    standard for data exchange.
-   Our PID controller is based on an [Arduino
    library](https://www.google.com/url?q=https://github.com/br3ttb/Arduino-PID-Library/&sa=D&ust=1598802820327000&usg=AOvVaw1t1c78Ws5W1u3T7RY1ghsN),
    although our version has evolved beyond the point of recognition --
    every line of code has been rewritten and our version is several
    times smaller by line count.  It has fewer features, and we have
    added extensive unit tests.

Notably, all of our code for interacting with the STM32 hardware is
bespoke; we are not using the Arduino STM32 hardware abstraction layer
or any other third-party HAL. This ensures auditability over every line
of code in this critical part of the system.

### Software Design

The cycle controller follows a modular design, described below.

<!-- See https://github.com/TLmaK0/gravizo -->
![Graph of components in cycle controller](https://g.gravizo.com/source/cc_graph_mark?https%3A%2F%2Fraw.githubusercontent.com%2FRespiraWorks%2FVentilator%2Fmaster%2Fsoftware%2Fdesign%2Fcontroller_architecture.md)
<!--
cc_graph_mark
digraph G {
  subgraph cluster_RPI {
    label="GUI (Raspberry Pi)"
    labelloc=b;
    GUI [label="Qt app"]
  }

  subgraph cluster_CC {
    label = "Cycle Controller (STM32)";
    labelloc = b;
    "Main loop" -> "Controller"
    "Main loop" -> "Comms"

    "Controller" -> "Sensors"
    "Controller" -> "Actuators"
    "Controller" -> "Breath FSM"

    "Actuators" -> HAL
    "Sensors" -> HAL
  }

  "Comms" -> GUI
  GUI -> "Comms"
}
cc_graph_mark
-->

The main loop runs every 10ms and has the following responsibilities:

-   Reset the watchdog timer. If the watchdog timer is not reset within
    250ms, the microcontroller assumes it is stuck and restarts.
-   Instruct comms to send a packet to GUI if necessary, and check
    whether comms has received a packet from the GUI.
-   Instruct controller to recalculate desired actuator positions, based
    on the commands in the latest packet received from the GUI.

Comms communicates with the GUI app running on the Raspberry Pi. Recall
that the communication protocol is simply that the controller
periodically sends all its state to the GUI, and the GUI periodically
sends all of its state to the controller, overwriting any previous
state. The protocol is defined
[here](https://www.google.com/url?q=https://github.com/RespiraWorks/Ventilator/blob/master/software/common/generated_libs/network_protocol/network_protocol.proto&sa=D&ust=1598802820328000&usg=AOvVaw31f9RjZArgBu1iWTBflj7I).

On each iteration of the main loop, the controller component forwards
the parameters from the GUI (e.g. PEEP 5, PIP 20, …) to the breath
FSM (finite state machine, see below), which responds with a “desired
system state”, the physical properties we want the pneumatic system to
have at this moment. Since we have implemented pressure-controlled
ventilation modes, the main physical property to achieve is patient
pressure. The controller reads from the sensors, uses PID to calculate
the valve positions and fan power which it thinks will achieve the
desired state, and forwards these to the actuator.

The breath FSM (finite state machine) translates ventilator parameters
into a timeseries of desired states of the ventilator’s pneumatic
system. For example, the ventilator parameters “command pressure mode
with PEEP 5, PIP 20, RR 12 bpm, I:E 0.25” translates to the timeseries
“start pressure at 5 cmH2O, linearly ramping up to 20 cmH2O over 100ms;
sit at 20 cmH2O for 900ms; then drop to 5 cmH2O for 4s”.

The breath FSM is also responsible for inspiratory effort detection in
pressure assist mode. In this case, the time series would keep pressure
at PEEP until either a breath is detected or it has been too long
between breaths.

The sensors module reads raw sensor voltages from HAL (hardware
abstraction layer, see below) and translates them into physical
measurements. It is responsible for calibrating the system’s three DP
sensors and translating the readings into two flow measurements (one for
each venturi) and one patient pressure measurement.

The actuators module receives a set of commands from the controller for
every actuator in the system, e.g. “blower speed 90%, inspiratory pinch
valve 28% open, etc.”, and forwards them down to HAL to be acted upon.

The actuators module might seem like an unnecessary component -- why
can’t the controller simply call into HAL itself?  There are two
reasons.

-   Separating the choice of actuation state from actual actuation lets
    us unit test the controller.
-   When we run in simulation with Modelica for software-in-the-loop
    testing, we replace the real actuators component with a component
    that sends the commands to Modelica.

Finally, our HAL (hardware abstraction layer) is responsible for
communicating directly with the hardware, e.g. reading a voltage from
the STM32’s analog-to-digital converter. The HAL also sends commands to
the stepper drivers that control the ventilator’s pinch valves.

One last component which does not fit in the diagram or description
above is the debug module.  Among
other things, this powerful module lets us read and write values in the
controller without reflashing the device. We have used it to tune PID in
a live system, to operate the ventilator without the GUI attached (e.g.
for automated testing), and to capture and graph the ventilator’s
internal state as it runs.

### Algorithms of note

This section describes some significant algorithms implemented in the
cycle controller.

#### Valve control

The controller translates a desired patient pressure into
inspiratory/expiratory valve positions using closed-loop PID control.
The PID’s integral term is set based on the PEEP-to-PIP pressure delta
(i.e. some minor gain scheduling). The expiratory valve tracks the
inspiratory valve; as the inspiratory valve opens more, the expiratory
valve closes more.

#### Venturi pressure to flow conversion

We characterized the response of our venturis over a large range of
flows using a Fleisch pneumotachograph. We used a standard venturi
pressure-to-flow formula with a correction factor of 0.97 as the only
correction applied. The comparison between the two instruments matched
our empirical measurements very closely. The 0.97 correction factor is
in line with ISO recommendations for smooth surfaces with a Reynolds
number of \~104.

#### Volume zeroing

The net volume change over a breath is not always exactly 0, due to
leakage, sensor zero-point drift, and the fact that venturis have
relatively high error at low flows. A simple way to correct for this
would be to set volume at the beginning of every breath to 0, but this
introduces a discontinuity in the graph at each breath, which looks
wrong. And fundamentally it does not solve the problem; one can still
observe that volume measurements are “sloped”.

Our volume zeroing algorithm addresses this. At the start of each
breath, we predict what the volume would be at the next breath if the
flow error remained constant. We then apply a flow offset to drive the
next breath’s volume to 0.

This works well on test lungs, but more work is required to characterize
its behavior in more realistic situations, like coughing, airway
blockage, etc. We also need to understand better users’ expectations
about how flow leakage should show up in the ventilator’s graphs. We
expect we will need a more sophisticated algorithm.

#### Inspiratory effort detection

We use the following algorithm to detect inspiratory effort in pressure
support mode.  First, we wait for flow to become nonnegative during the
exhale phase. Then we start keeping two [exponentially-weighted moving
averages](https://www.google.com/url?q=https://en.wikipedia.org/wiki/Moving_average%23Exponential_moving_average&sa=D&ust=1598802820332000&usg=AOvVaw16YnTD2TU9-RmsnOgfXU10) of
flow. The “slow average” has a small alpha term and thus reacts slowly
to changes in flow. The “fast average” has a large alpha term and thus
reacts quickly. We can think of the slow average as characterizing
“normal flow” during the expiratory cycle (which we’ve observed on test
lungs does change, but slowly), while the fast average calculates
“current flow”.  When the fast average exceeds the slow average by a
certain threshold, that triggers a breath.

This works well on our test lungs, but much more testing is needed to
see how it performs in more realistic situations. Graphs and a demo
video are available in [02-1 Performance
Evaluation](https://www.google.com/url?q=https://docs.google.com/document/d/1g7qLD5qD4BKfR1mcGq7-QY6XE2C9oIIw5GJdUzU31Zg/edit?ts%3D5eefc588%23heading%3Dh.pt7ef8fp4ywf&sa=D&ust=1598802820333000&usg=AOvVaw3PSoAKrxDU1RlhGSshEkvd).