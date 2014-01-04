(in-package :cl-user)
(defpackage tuna-page-json
  (:use :cl)
  (:export :<base>
	   :json-validate-session
	   :json-validate-prms
	   :json-process
	   :json-make-json-info))
(in-package :tuna-page-json)

(defclass <json> ()
  ())

(defgeneric json-validate-session(o session))

(defgeneric json-validate-prms(o session prms))

(defgeneric json-process(o session prms))

(defgeneric json-make-json-infox(o session prms))

