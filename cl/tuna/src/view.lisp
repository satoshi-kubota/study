(in-package :cl-user)
(defpackage tuna.view
  (:use :cl)
  (:import-from :tuna.config
                :*template-directory*)
  (:import-from :caveman2
                :*response*)
  (:import-from :clack.response
                :headers)
  (:import-from :cl-emb
                :*escape-type*
                :*case-sensitivity*
                :*function-package*
                :execute-emb)
  (:import-from :yason
                :encode
                :encode-plist
                :encode-alist)
  (:import-from :trivial-types
                :property-list-p
                :association-list-p)
  (:import-from :tuna.a
		:testtesttest)
  (:export :*default-layout-path*
           :render
           :render-json
           :with-layout))
(in-package :tuna.view)

(defvar *default-layout-directory* #P"layouts/")
(defvar *default-layout-path* #P"default.tmpl")

(defun render (template-path &optional env)
  (let ((emb:*escape-type* :html)
        (emb:*case-sensitivity* nil))
    (emb:execute-emb
     (merge-pathnames template-path
                      *template-directory*)
     :env env)))

(defun render-json (object)
  (setf (headers *response* :content-type) "application/json")
  (with-output-to-string (s)
    (cond
      ((property-list-p object) (encode-plist object s))
      ((association-list-p object) (encode-alist object s))
      (T (encode object s)))))

(defmacro with-layout ((&rest env-for-layout) &body body)
  (let ((layout-path (merge-pathnames *default-layout-path*
                                      *default-layout-directory*)))
    (when (pathnamep (car env-for-layout))
      (setf layout-path (pop env-for-layout)))

    `(let ((emb:*escape-type* :html)
           (emb:*case-sensitivity* nil))
       (emb:execute-emb
        (merge-pathnames ,layout-path
                         *template-directory*)
        :env (list :content (progn ,@body)
                   ,@env-for-layout)))))

;; Define functions that are available in templates.
(import '(tuna.config
          caveman2:url-for)
        emb:*function-package*)
