(in-package :cl-user)
(defpackage tuna-dao-test-asd
  (:use :cl :asdf))
(in-package :tuna-dao-test-asd)

(defsystem tuna-dao-test
  :author ""
  :license ""
  :depends-on (:tuna-dao
               :cl-test-more)
  :components ((:module "t"
			:components
                ((:file "tuna-dao"))))
  :perform (load-op :after (op c) (asdf:clear-system c)))
