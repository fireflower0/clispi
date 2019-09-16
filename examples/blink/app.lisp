(uiop:define-package #:blink/app
  (:use #:cl
        #:blink/wrapper/wiringpi)
  (:export #:main))
(in-package #:blink/app)

(defparameter *gpio-14* 14)

(defconstant +on+ 1)
(defconstant +off+ 0)

(defun main (&rest args)
  ;; Initialization and Preparation
  (wiringpi-setup-gpio)
  (pin-mode *gpio-14* +output+)

  ;; Infinite loop
  (loop
     (digital-write *gpio-14* +on+)
     (delay 500)
     (digital-write *gpio-14* +off+)
     (delay 500)))
