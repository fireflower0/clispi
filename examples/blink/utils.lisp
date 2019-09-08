(uiop:define-package #:blink/utils
  (:use #:cl)
  (:export #:while))
(in-package #:blink/utils)

(defmacro while (test &body body)
  `(do ()
       ((not ,test))
     ,@body))
