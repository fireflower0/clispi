(uiop:define-package #:<% @var name %>/app
  (:use #:cl
        #:<% @var name %>/wrapper/wiringpi
        #:<% @var name %>/utils)
  (:export #:main
           #:*loop-control-flag*))
(in-package #:<% @var name %>/app)

(defparameter *loop-control-flag* nil)

(defun main (&rest args)
  ;; Initialization and Preparation

  ;; Infinite loop
  (while *loop-control-flag*
    ;; Your progra
    ))
