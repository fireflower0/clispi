(uiop:define-package #:color/app
  (:use #:cl
        #:color/wrapper/wiringpi)
  (:export #:main))
(in-package #:color/app)

(defparameter *red-pin* 17)
(defparameter *green-pin* 27)
(defparameter *blue-pin* 22)

(defparameter *initial-value* 0)
(defparameter *pwm-range* 100)

(defun main (&rest args)
  (format t "Hello, world!~%")

  ;; GPIO初期化
  (wiringpi-setup-gpio)

  ;; ピンモード設定
  (pin-mode *red-pin*   +output+)
  (pin-mode *green-pin* +output+)
  (pin-mode *blue-pin*  +output+)

  (loop
   ;; PWM出力設定
   (soft-pwm-create *red-pin*   *initial-value* *pwm-range*)
   (soft-pwm-create *green-pin* *initial-value* *pwm-range*)
   (soft-pwm-create *blue-pin*  *initial-value* *pwm-range*)

   ;; PWMで各端子に出力
   (soft-pwm-write *red-pin*   (random *pwm-range*))
   (soft-pwm-write *green-pin* (random *pwm-range*))
   (soft-pwm-write *blue-pin*  (random *pwm-range*))

   ;; 待機
   (delay 500)))
