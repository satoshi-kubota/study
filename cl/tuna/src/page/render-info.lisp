(in-package :cl-user)
(defpackage tuna-page-render-info
  (:use :cl)
  (:export :<render-info>
	   :ri-page-id
	   :ri-title
	   :ri-env))
(in-package :tuna-page-render-info)

(defclass <render-info> ()
  ((ri-status :initarg :ri-status)
   (ri-page-id :initarg :ri-page-id)
   (ri-title :initarg :ri-title)
   (ri-env :initarg :ri-env)))
