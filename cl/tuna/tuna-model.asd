(in-package :cl-user)
(defpackage tuna-model-asd
  (:use :cl :asdf))
(in-package :tuna-model-asd)

(defsystem tuna-model
  :version "0.1"
  :author ""
  :license ""
  :depends-on ()
  :components ((:module "src/model"
                :components
                ((:file "user"))))
  :description "")

