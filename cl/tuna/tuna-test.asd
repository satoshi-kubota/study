(in-package :cl-user)
(defpackage tuna-test-asd
  (:use :cl :asdf))
(in-package :tuna-test-asd)

(defsystem tuna-test
  :author ""
  :license ""
  :depends-on (:tuna
               :cl-test-more)
  :components ((:module "t"
                :components
                ((:file "tuna"))))
  :perform (load-op :after (op c) (asdf:clear-system c)))
