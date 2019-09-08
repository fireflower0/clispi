(uiop:define-package #:blink/app
  (:use #:cl
        #:blink/wrapper/wiringpi
        #:blink/utils)
  (:export #:main
           #:*loop-control-flag*))
(in-package #:blink/app)

(defparameter *loop-control-flag* nil)

(defparameter *pin* 14)

(defun main (&rest args)
  ;; Initialization and Preparation
  (wiringpi-setup-gpio)
  (pin-mode *pin* +output+)

  ;; Infinite loop
  (while *loop-control-flag*
    (digital-write *pin* 1)
    (delay 500)
    (digital-write *pin* 0)
    (delay 500)))
