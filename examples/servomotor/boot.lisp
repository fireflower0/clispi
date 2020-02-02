(uiop:define-package #:servomotor
  (:use #:cl
        #:servomotor/app)
  (:export #:start))
(in-package #:servomotor)

(defun start (&rest args)
  (main args))
