(uiop:define-package #:blink/app
  (:use #:cl
        #:blink/wrapper/wiringpi)
  (:export #:main))
(in-package #:blink/app)

(defparameter *pin* 14)

(defun main (&rest args)
  ;; Initialization and Preparation
  (wiringpi-setup-gpio)
  (pin-mode *pin* +output+)

  ;; Infinite loop
  (loop
   (digital-write *pin* 1)
   (delay 500)
   (digital-write *pin* 0)
   (delay 500)))
