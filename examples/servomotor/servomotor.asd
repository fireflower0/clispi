(defsystem "servomotor"
  :class :package-inferred-system
  :version "0.1.0"
  :author "fireflower0"
  :license "MIT"
  :description ""
  :depends-on ("cffi"
               "clispi"
               "servomotor/boot"
               "cl-syntax-annot"))

(register-system-packages "servomotor/boot" '(#:servomotor))
