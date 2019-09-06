(uiop:define-package #:<% @var name %>
  (:use #:cl
        #:<% @var name %>/app)
  (:export #:start
           #:stop))
(in-package #:<% @var name %>)

(defun start (&rest args)
  (setf *loop-control-flag* t)
  (main args))

(defun stop ()
  (setf *loop-control-flag* nil))
