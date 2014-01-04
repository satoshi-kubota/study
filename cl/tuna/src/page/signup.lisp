(in-package :cl-user)
(defpackage tuna-page-signup
  (:use
   :cl
   :tuna-dao-user-dao
   :tuna-model-user
   :tuna-page-render-info
   :tuna-page-base)
  (:export :<signup>))
(in-package :tuna-page-signup)

(defclass <signup> (<base>)
  ())

(defmethod initialize-instance :after((o <signup>) &rest initargs)
  (with-slots (page-page-id page-title) o
    (setf page-page-id "signup")
    (setf page-title "サインアップ")))

(defmethod page-validate-session(o session)
  (print o)
  (print session)
  nil)

(defmethod page-process(o session prms)
  (print o)
  (print session)
  (print prms))


(defmethod page-make-render-info(o session prms)
  (with-slots (page-page-id page-title) o
      (make-instance '<render-info> :ri-page-id page-page-id :ri-title page-title)))






