(defpackage #:clispi/wiringpi-wrapper
  (:use #:cl #:cffi)
  (:export #:+input+
           #:+output+
           #:+pwm-output+
           #:+pwm-mode-ms+
           #:+pwm-mode-bal+
           #:+pud-off+
           #:+pud-down+
           #:+pud-up+

           ;; Setup
           #:wiringpi-setup
           #:wiringpi-setup-gpio
           #:wiringpi-setup-phys
           #:wiringpi-setup-sys

           ;; Core Function
           #:pin-mode
           #:pull-updn-control
           #:digital-write
           #:pwm-write
           #:digital-read
           #:analog-read
           #:analog-write

           ;; Raspberry Pi Specifics
           #:digital-write-byte
           #:pwm-set-mode
           #:pwm-set-range
           #:pwm-set-clock
           #:pi-board-rev
           #:wpi-pin-to-gpio
           #:phys-pin-to-gpio
           #:set-pad-drive

           ;; Timing
           #:millis
           #:micros
           #:delay
           #:delay-micro-seconds

           ;; SPI Library
           #:wiringpi-spi-setup
           #:wiringpi-spi-data-rw

           ;; I2C Library
           #:wiringpi-i2c-setup
           #:wiringpi-i2c-read
           #:wiringpi-i2c-write
           #:wiringpi-i2c-write-reg8
           #:wiringpi-i2c-write-reg16
           #:wiringpi-i2c-read-reg8
           #:wiringpi-i2c-read-reg16

           ;; Software PWM Library
           #:soft-pwm-create
           #:soft-pwm-write

           ;; Software Tone Library
           #:soft-tone-create
           #:soft-tone-write))
(in-package #:clispi/wiringpi-wrapper)

(define-foreign-library libwiringPi
  (:unix "libwiringPi.so")
  (t (:default "libwiringPi")))

(use-foreign-library libwiringPi)

;;; Constant
;;; ============================================================

;; Pin mode
(defconstant +input+      0)
(defconstant +output+     1)
(defconstant +pwm-output+ 2)

;; PWM
(defconstant +pwm-mode-ms+  0)
(defconstant +pwm-mode-bal+ 1)

;; Pull up/down/none
(defconstant +pud-off+  0)
(defconstant +pud-down+ 1)
(defconstant +pud-up+   2)

;;; Setup
;;; ============================================================

;; wiringPiSetup
(defcfun ("wiringPiSetup" wiringpi-setup) :int)

;; Init wiringPi GPIO
(defcfun ("wiringPiSetupGpio" wiringpi-setup-gpio) :int)

;; wiringPiSetupPhys
(defcfun ("wiringPiSetupPhys" wiringpi-setup-phys) :int)

;; wiringPiSetupSys
(defcfun ("wiringPiSetupSys" wiringpi-setup-sys) :int)

;;; Core Function
;;; ============================================================

;; GPIO pin mode setting
(defcfun ("pinMode" pin-mode) :void
  (pin :int) (mode :int))

;; Set the state when nothing is connected to the terminal
(defcfun ("pullUpDnControl" pull-updn-control) :void
  (pin :int) (pud :int))

;; Output control of GPIO pin
(defcfun ("digitalWrite" digital-write) :void
  (pin :int) (value :int))

;; PWM write
(defcfun ("pwmWrite" pwm-write) :void
  (pin :int) (value :int))

;; Read the status of the GPIO pin
(defcfun ("digitalRead" digital-read) :int
  (pin :int))

;; Analog Read
(defcfun ("analogRead" analog-read) :int
  (pin :int))

;; Analog Write
(defcfun ("analogWrite" analog-write) :void
  (pin :int) (value :int))

;;; Raspberry Pi Specifics
;;; ============================================================

;; This writes the 8-bit byte supplied to the first 8 GPIO pins
(defcfun ("digitalWriteByte" digital-write-byte) :void
  (value :int))

;; PWM set mode
(defcfun ("pwmSetMode" pwm-set-mode) :void
  (mode :int))

;; PWM set range (default 1024)
(defcfun ("pwmSetRange" pwm-set-range) :void
  (range :uint))

;; PWM set clock
(defcfun ("pwmSetClock" pwm-set-clock) :void
  (divisor :int))

;; piBoardRev
(defcfun ("piBoardRev" pi-board-rev) :int)

;; wpiPinToGpio
(defcfun ("wpiPinToGpio" wpi-pin-to-gpio) :int
  (wpi-pin :int))

;; physPinToGpio
(defcfun ("physPinToGpio" phys-pin-to-gpio) :int
  (phys-pin :int))

;; setPadDrive
(defcfun ("setPadDrive" set-pad-drive) :void
  (group :int) (value :int))

;;; Timing
;;; ============================================================

;; millis
(defcfun ("millis" millis) :unsigned-int)

;; micros
(defcfun ("micros" micros) :unsigned-int)

;; Delay (millisecond)
(defcfun ("delay" delay) :void
  (howlong :uint))

;; delayMicroseconds
(defcfun ("delayMicroseconds" delay-micro-seconds) :void
  (howlong :unsigned-int))

;;; SPI Library
;;; ============================================================

;; SPI initialization
(defcfun ("wiringPiSPISetup" wiringpi-spi-setup) :int
  (channel :int) (speed :int))

;; Execute concurrent write/read transactions on the selected SPI bus
(defcfun ("wiringPiSPIDataRW" wiringpi-spi-data-rw) :int
  (channel :int) (data :pointer) (len :int))

;;; I2C Library
;;; ============================================================

;; Initialization of the I2C systems.
(defcfun ("wiringPiI2CSetup" wiringpi-i2c-setup) :int
  (fd :int))

;; I2C read
(defcfun ("wiringPiI2CRead" wiringpi-i2c-read) :int
  (fd :int))

;; I2C write
(defcfun ("wiringPiI2CWrite" wiringpi-i2c-write) :int
  (fd :int) (data :int))

;; Writes 8-bit data to the instructed device register.
(defcfun ("wiringPiI2CWriteReg8" wiringpi-i2c-write-reg8) :int
  (fd :int) (reg :int) (data :int))

;; Writes 16-bit data to the instructed device register.
(defcfun ("wiringPiI2CWriteReg16" wiringpi-i2c-write-reg16) :int
  (fd :int) (reg :int) (data :int))

;; It reads the 8-bit value from the indicated device register.
(defcfun ("wiringPiI2CReadReg8" wiringpi-i2c-read-reg8) :int
  (fd :int) (reg :int))

;; It reads the 16-bit value from the indicated device register.
(defcfun ("wiringPiI2CReadReg16" wiringpi-i2c-read-reg16) :int
  (fd :int) (reg :int))

;;; Shift Library
;;; ============================================================

;; shiftIn
(defcfun ("shiftIn" shift-in) :unsigned-char
  (d-pin :unsigned-char)
  (c-pin :unsigned-char)
  (order :unsigned-char))

;; shiftOut
(defcfun ("shiftOut" shift-out) :void
  (d-pin :unsigned-char)
  (c-pin :unsigned-char)
  (order :unsigned-char)
  (val   :unsigned-char))

;;; Software PWP Library
;;; ============================================================

;; Soft PWM Create
(defcfun ("softPwmCreate" soft-pwm-create) :int
  (pin :int) (initial-value :int) (pwm-range :int))

;; Soft PWM Write
(defcfun ("softPwmWrite" soft-pwm-write) :void
  (pin :int) (value :int))

;;; Software Tone Libraryn
;;; ============================================================

;; This creates a software controlled tone pin
(defcfun ("softToneCreate" soft-tone-create) :int
  (pin :int))

;; This updates the tone frequency value on the given pin.
(defcfun ("softToneWrite" soft-tone-write) :void
  (pin :int) (freq :int))
