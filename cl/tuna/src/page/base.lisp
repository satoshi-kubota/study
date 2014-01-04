(in-package :cl-user)
(defpackage tuna-page-base
  (:use :cl)
  (:export :<base>
	   :page-page-id
	   :page-title
	   :page-validate-session
	   :page-process
	   :page-make-render-info))
(in-package :tuna-page-base)

(defclass <base> ()
  ((page-page-id :initarg :page-page-id)
   (page-title :initarg :page-title)))

(defgeneric page-validate-session(o session))

(defgeneric page-process(o session prms))

(defgeneric page-make-render-infox(o session prms))

