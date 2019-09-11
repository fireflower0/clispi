(uiop:define-package #:blink
  (:use #:cl
        #:blink/app)
  (:export #:start))
(in-package #:blink)

(defun start (&rest args)
  (main args))
