(in-package :cl-user)
(defpackage tuna-dao-asd
  (:use :cl :asdf))
(in-package :tuna-dao-asd)

(defsystem tuna-dao
  :version "0.1"
  :author ""
  :license ""
  :depends-on (:babel
	       :series
	       :cl-base64
	       :ironclad
	       :uuid
	       :dbi)
  :components ((:module "src/dao"
                :components
                ((:file "user-dao"))))
  :description "")

