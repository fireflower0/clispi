(uiop:define-package #:<% @var name %>
  (:use #:cl
        #:<% @var name %>/app)
  (:export #:start))
(in-package #:<% @var name %>)

(defun start (&rest args)
  (main args))
