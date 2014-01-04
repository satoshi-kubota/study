(in-package :cl-user)
(defpackage tuna-page-base
  (:use :cl)
  (:export :<base>
	   :page-content-id
	   :page-title
	   :page-validate-session
	   :page-validate-prms
	   :page-process
	   :page-make-render-info))
(in-package :tuna-page-base)

(defclass <base> ()
  ((page-content-id :initarg :page-content-id)
   (page-title :initarg :page-title)))

(defgeneric page-validate-session(o session))

(defgeneric page-validate-prms(o session prms))

(defgeneric page-process(o session prms))

(defgeneric page-make-render-infox(o session prms))

