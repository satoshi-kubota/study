(in-package :cl-user)
(defpackage tuna.config
  (:use :cl)
  (:import-from :envy
                :config-env-var
                :defconfig)
  (:export :config
           :*application-root*
           :*static-directory*
           :*template-directory*))
(in-package :tuna.config)

(setf (config-env-var) "APP_ENV")

(defparameter *application-root*   (asdf:system-source-directory :tuna))
(defparameter *static-directory*   (merge-pathnames #P"static/" *application-root*))
(defparameter *template-directory* (merge-pathnames #P"templates/" *application-root*))

(defconfig |default|
  `(:debug T :databases ((:maindb :postgres :database-name "tuna" :username "tuna" :password "tuna"))))



(defun config (&optional key)
  (envy:config #.(package-name *package*) key))


