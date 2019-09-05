(uiop:define-package #:<% @var name %>/app
  (:use #:cl
        #:<% @var name %>/utils
        #:<% @var name %>/wrapper/wiringpi)
  (:export #:*loop-escape-flag*
           #:main))
(in-package #:<% @var name %>/app)

(defparameter *loop-escape-flag* nil)

(defun main ()
  ;; Initialization
  (while *loop-escape-flag*
    ;; Your program
    ))
