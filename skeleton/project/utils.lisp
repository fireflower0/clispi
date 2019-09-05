(uiop:define-package #:<% @var name %>/utils
  (:use #:cl
        #:<% @var name %>/wrapper/wiringpi)
  (:export #:while))
(in-package #:<% @var name %>/utils)

(defmacro while (test &body body)
  `(do ()
       ((not ,test))
     ,@body))
