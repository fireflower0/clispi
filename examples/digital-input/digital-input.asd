(defsystem "digital-input"
  :class :package-inferred-system
  :version "0.1.0"
  :author ""
  :license ""
  :description ""
  :depends-on ("cffi"
               "digital-input/boot"
               "cl-syntax-annot"))

(register-system-packages "digital-input/boot" '(#:digital-input))
