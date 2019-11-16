(uiop:define-package #:color/app
  (:use #:cl
        #:clispi/wiringpi-wrapper)
  (:export #:main))
(in-package #:color/app)

(defparameter *gpio-17-red* 17)
(defparameter *gpio-22-blue* 22)
(defparameter *gpio-27-green* 27)

(defparameter *initial-value* 0)
(defparameter *pwm-range* 100)

(defun main (&rest args)
  ;; Initialization and Preparation
  (wiringpi-setup-gpio)
  (pin-mode *gpio-17-red*   +output+)
  (pin-mode *gpio-22-blue*  +output+)
  (pin-mode *gpio-27-green* +output+)

  ;; Infinite loop
  (loop
     ;; PWM出力設定
     (soft-pwm-create *gpio-17-red*   *initial-value* *pwm-range*)
     (soft-pwm-create *gpio-22-blue*  *initial-value* *pwm-range*)
     (soft-pwm-create *gpio-27-green* *initial-value* *pwm-range*)

     ;; PWMで各端子に出力
     (soft-pwm-write *gpio-17-red*   (random *pwm-range*))
     (soft-pwm-write *gpio-22-blue*  (random *pwm-range*))
     (soft-pwm-write *gpio-27-green* (random *pwm-range*))

     ;; 待機
     (delay 500)))
