(defsystem "7seg"
  :class :package-inferred-system
  :version "0.1.0"
  :author "fireflower0"
  :license "MIT"
  :description ""
  :depends-on ("cffi"
               "clispi"
               "7seg/boot"
               "cl-syntax-annot"))

(register-system-packages "7seg/boot" '(#:7seg))
