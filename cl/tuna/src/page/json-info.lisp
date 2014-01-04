(in-package :cl-user)
(defpackage tuna-page-json-info
  (:use :cl)

  (:export :<json-info>
	   :create-<json-info>
	   :ji-status
	   :ji-errors
	   :ji-env))
  
(in-package :tuna-page-json-info)

(defclass <json-info> ()
  ((ji-status :initarg :ji-status)
   (ji-errors :initarg :ji-errors)
   (ji-env :initarg :ji-env)))

