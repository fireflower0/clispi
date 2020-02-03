(uiop:define-package #:7seg/app
  (:use #:cl
        #:clispi/wiringpi-wrapper)
  (:export #:main))
(in-package #:7seg/app)

(defconstant +d0-pin+ 18)
(defconstant +d1-pin+ 23)
(defconstant +d2-pin+ 24)
(defconstant +d3-pin+ 25)
(defparameter pin-list `(,+d0-pin+ ,+d1-pin+ ,+d2-pin+ ,+d3-pin+))

(defun display-7seg (num)
  (let ((binary-num (format nil "~4,'0b" num)))
    (loop for char :across "1010"
          for n from 3 downto 0
          :do (digital-write (elt pin-list n) (- (char-code char) 48)))))

(defun main (&rest args)
  (let ((binary-num (format nil "~4,'0b" num)))
    (loop for char :across "1010"
       for n from 3 downto 0
       :do (digital-write (elt pin-list n) (- (char-code char) 48)))))
