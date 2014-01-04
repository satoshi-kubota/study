(in-package :cl-user)
(defpackage tuna-page-top
  (:use
   :cl
   :tuna-dao-user-dao
   :tuna-model-user
   :tuna-page-render-info
   :tuna-page-base)
  (:export :<top>))
(in-package :tuna-page-top)

(defclass <top> (<base>)
  ())

(defmethod initialize-instance :after((o <top>) &rest initargs)
  (with-slots (page-content-id page-title) o
    (setf page-content-id "top")
    (setf page-title "ツナ")))

(defmethod page-validate-session(o session)
  (print o)
  (print session))
   
(defmethod page-validate-prms(o session prms)
  (print o)
  (print session)
  (print prms))

(defmethod page-process(o session prms)
  (print o)
  (print session)
  (print prms))


(defmethod page-make-render-info(o session prms)
  (with-slots (page-content-id page-title) o
      (make-instance '<render-info> :ri-content-id page-content-id :ri-title page-title)))






