(in-package :cl-user)
(defpackage tuna-page-render-info
  (:use :cl)
  (:export :<render-info>
	   :ri-content-id
	   :ri-title
	   :ri-env))
(in-package :tuna-page-render-info)

(defclass <render-info> ()
  ((ri-content-id :initarg :ri-content-id)
   (ri-title :initarg :ri-title)
   (ri-env :initarg :ri-env)))
