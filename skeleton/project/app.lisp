(uiop:define-package #:<% @var name %>/app
  (:use #:cl
        #:<% @var name %>/wrapper/wiringpi)
  (:export #:main))
(in-package #:<% @var name %>/app)

(defun main (&rest args)
  ;; Initialization and Preparation

  ;; Infinite loop
  (loop
       ))
