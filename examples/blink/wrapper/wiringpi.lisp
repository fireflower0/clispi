(uiop:define-package #:blink/wrapper/wiringpi
  (:use #:cl #:cffi)
  (:export #:+input+
           #:+output+
           #:+pwm-output+
           #:+pwm-mode-ms+
           #:+pwm-mode-bal+
           #:+pud-off+
           #:+pud-down+
           #:+pud-up+
           #:wiringpi-setup-gpio
           #:pin-mode
           #:digital-read
           #:digital-write
           #:pull-updn-control
           #:pwm-set-mode
           #:pwm-set-range
           #:pwm-set-clock
           #:pwm-write
           #:soft-pwm-create
           #:soft-pwm-write
           #:wiringpi-i2c-setup
           #:wiringpi-i2c-write-reg8
           #:wiringpi-i2c-read
           #:wiringpi-i2c-read-reg16
           #:wiringpi-spi-setup
           #:wiringpi-spi-data-rw
           #:delay))
(in-package #:blink/wrapper/wiringpi)

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

;; Init wiringPi GPIO
(defcfun ("wiringPiSetupGpio" wiringpi-setup-gpio) :int)

;; wiringPiSetupPhys

;; wiringPiSetupSys

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

;; digitalWriteByte

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

;; wpiPinToGpio

;; physPinToGpio

;; setPadDrive

;;; Timing
;;; ============================================================

;; millis

;; micros

;; Delay (millisecond)
(defcfun ("delay" delay) :void
  (howlong :uint))

;; delayMicroseconds

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

;; Writes 8-bit data to the instructed device register.
(defcfun ("wiringPiI2CWriteReg8" wiringpi-i2c-write-reg8) :int
  (fd :int) (reg :int) (data :int))

;; wiringPiI2CWriteReg16

;; wiringPiI2CReadReg8

;; It reads the 16-bit value from the indicated device register.
(defcfun ("wiringPiI2CReadReg16" wiringpi-i2c-read-reg16) :int
  (fd :int) (reg :int))

;;; Shift Library
;;; ============================================================

;; shiftIn

;; shiftOut

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

;; softToneCreate

;; softToneCreate
