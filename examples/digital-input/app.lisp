(uiop:define-package #:digital-input/app
  (:use #:cl
        #:clispi/wiringpi-wrapper)
  (:export #:main))
(in-package #:digital-input/app)

(defparameter *gpio-25* 25)

(defun main (&rest args)
  ;; Initialization and Preparation
  (wiringpi-setup-gpio)
  (pin-mode *gpio-25* +input+)
  (pull-updn-control *gpio-25* +pud-up+)

  ;; Infinite loop
  (loop
     (if (= (digital-read *gpio-25*) 0)
         (format t "Switch ON~%")
         (format t "Switch OFF~%"))
     (delay 500)))
