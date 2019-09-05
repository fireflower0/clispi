(uiop:define-package #:<% @var name %>
  (:use #:cl
        #:<% @var name %>/app)
  (:export #:start
           #:stop))
(in-package #:<% @var name %>)

(defun start ()
  (setf *loop-escape-flag* t)
  (main))

(defun stop ()
  (setf *loop-escape-flag* nil))
