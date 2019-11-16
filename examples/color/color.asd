(defsystem "color"
  :class :package-inferred-system
  :version "0.1.0"
  :author ""
  :license ""
  :description ""
  :depends-on ("cffi"
               "clispi"
               "color/boot"
               "cl-syntax-annot"))

(register-system-packages "color/boot" '(#:color))
