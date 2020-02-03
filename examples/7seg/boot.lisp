(uiop:define-package #:7seg
  (:use #:cl
        #:7seg/app)
  (:export #:start))
(in-package #:7seg)

(defun start (&rest args)
  (main args))
