(uiop:define-package #:blink
  (:use #:cl
        #:blink/app)
  (:export #:start
           #:stop))
(in-package #:blink)

(defun start (&rest args)
  (setf *loop-control-flag* t)
  (main args))

(defun stop ()
  (setf *loop-control-flag* nil))
