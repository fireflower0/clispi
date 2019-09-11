(uiop:define-package #:color
  (:use #:cl
        #:color/app)
  (:export #:start))
(in-package #:color)

(defun start (&rest args)
  (format t "boot :  Hello, world!~%")
  (main args))
