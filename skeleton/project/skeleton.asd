(defsystem "<% @var name %>"
  :class :package-inferred-system
  :version "0.1.0"
  :author "<% @var author %>"
  :license "<% @var license %>"
  :description "<% @var description %>"
  :depends-on ("cffi"
               "clispi"
               "<% @var name %>/boot"
               "cl-syntax-annot"))

(register-system-packages "<% @var name %>/boot" '(#:<% @var name %>))
