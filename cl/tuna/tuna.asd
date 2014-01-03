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
	       :babel
	       :cl-base64
	       :ironclad

               ;; HTML Template
               :cl-emb

               ;; for rendering JSON
               :yason
               :trivial-types

               ;; for CL-DBI
               :caveman2-db
	       :tuna-dao)
  :components ((:module "src"
                :components
                ((:file "tuna" :depends-on ("config"))
                 (:file "web" :depends-on ("view"))
                 (:file "view")
                 (:file "config"))))
  :description ""
  :in-order-to ((test-op (load-op tuna-test))))
