(uiop:define-package #:servomotor/app
  (:use #:cl
        #:clispi/wiringpi-wrapper)
  (:export #:main))
(in-package #:servomotor/app)

(defparameter *gpio-18* 18)
(defparameter *pwm-generator* 1024)
(defparameter *pwm-clock* 375)

(defun prompt-read (prompt)
  (format *query-io* "~a: " prompt)
  (force-output *query-io*)
  (read *query-io*))

(defun main (&rest args)
  (wiringpi-setup-gpio)
  (pin-mode *gpio-18* +pwm-output+)
  (pwm-set-mode +pwm-mode-ms+)
  (pwm-set-range *pwm-generator*)
  (pwm-set-clock *pwm-clock*)

  (loop
     (let ((degree (prompt-read "Degree (-90 ~ 90)")))
       (pprint degree)
       (when (and (>= degree -90) (<= degree 90))
         (let ((move-deg (floor (+ 81 (* (/ 41 90) degree)))))
           (pprint move-deg)
           (pwm-write *gpio-18* move-deg))))))
