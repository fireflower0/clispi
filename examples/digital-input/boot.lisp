(uiop:define-package #:digital-input
  (:use #:cl
        #:digital-input/app)
  (:export #:start))
(in-package #:digital-input)

(defun start (&rest args)
  (main args))
