(uiop:define-package #:color
    (:use #:cl
          #:color/app)
  (:export #:start))
(in-package #:color)

(defun start (&rest args)
  (main args))
