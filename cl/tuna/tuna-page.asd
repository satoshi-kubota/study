(in-package :cl-user)
(defpackage tuna-page-asd
  (:use :cl :asdf))
(in-package :tuna-page-asd)

(defsystem tuna-page
  :version "0.1"
  :author ""
  :license ""
  :depends-on (:tuna-dao
	       :tuna-model)
  :components ((:module "src/page"
                :components
                ((:file "base")
		 (:file "json-info")
		 (:file "render-info")
		 (:file "top"))))
  :description "")

