(in-package :cl-user)
(defpackage tuna-asd
  (:use :cl :asdf))
(in-package :tuna-asd)

(defsystem tuna
  :version "0.1"
  :author ""
  :license ""
  :depends-on (:clack
               :caveman2
               :envy
               :osicat
               :cl-ppcre

               ;; HTML Template
               :cl-emb

               ;; for rendering JSON
               :yason
               :trivial-types

               ;; for CL-DBI
               :caveman2-db)
  :components ((:module "src"
                :components
                ((:file "a")
		 (:file "tuna" :depends-on ("config"))
                 (:file "web" :depends-on ("view"))
                 (:file "view" :depends-on ("config" "a"))
                 (:file "config"))))
  :description ""
  :in-order-to ((test-op (load-op tuna-test))))
