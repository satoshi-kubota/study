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
  (with-slots (page-page-id page-title) o
    (setf page-page-id "top")
    (setf page-title "ツナ")))

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






