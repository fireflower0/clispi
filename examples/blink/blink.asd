(defsystem "blink"
  :class :package-inferred-system
  :version "0.1.0"
  :author ""
  :license ""
  :description ""
  :depends-on ("cffi"
               "blink/boot"
               "cl-syntax-annot"))

(register-system-packages "blink/boot" '(#:blink))
