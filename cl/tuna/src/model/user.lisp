(in-package :cl-user)
(defpackage tuna-model-user
  (:use :cl)

  (:export :<user>
	   :user-id
	   :user-email
	   :user-display-name
	   :user-login-status
	   :user-to-s))
(in-package :tuna-model-user)

(deftype loginStatus ()
    '(member anonymous login))

(defclass <user> ()
  ((user-id :initarg :id)
   (user-email :initarg :email)
   (user-display-name :initarg :dispaly-name)
   (usr-login-status :initarg :login-status)))

(defmethod set-slots((o <user>) id email display-name login-status)
  (with-slots (user-id user-email user-display-name user-login-status) o
    (setf user-id id)
    (setf user-email email)
    (setf user-display-name display-name)
    (setf user-login-status login-status)
    o))

(defmethod user-to-s((o <user>))
  (with-slots (user-id user-email user-display-name user-login-status) o
    (format t "~A ~A ~A ~A ~A" o user-id user-email user-display-name user-login-status)
    o))
