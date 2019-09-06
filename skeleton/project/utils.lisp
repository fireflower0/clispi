(uiop:define-package #:<% @var name %>/utils
  (:use #:cl)
  (:export #:while))
(in-package #:<% @var name %>/utils)

(defmacro while (test &body body)
  `(do ()
       ((not ,test))
     ,@body))
