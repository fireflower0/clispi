# blink

## Description

Blink LED

## Circuit diagram

Wire as follows

* Connect the anode side of the LED to the GPIO14 pin
* Connect a 330Ω resistor to the cathode side of the LED

```
GPIO14 ----- A LED C ----- R (330Ω) ----- GND
```

## Usage

Run roswell script

```
ros roswell/blink.ros
```
