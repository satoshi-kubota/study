(in-package :cl-user)
(defpackage tuna.web
  (:use :cl
	:cl-dbi
        :caveman2
        :caveman2.db
        :tuna.config
        :tuna.view
	:tuna-page-base
	:tuna-page-top
	:tuna-page-signup
	:tuna-page-render-info)
  (:export :*web*))
(in-package :tuna.web)

;;
;; Application

(defclass <web> (<app>) ())
(defparameter *web* (make-instance '<web>))

;;
;; Routing rules

(defun process-page(type &rest prms)
  (let
      ((o (make-instance type))
       (sess *session*))
    (let ((errors (page-validate-session o sess)))
      (if (not errors)
	  (progn 
	    (page-process o *session* prms)
	    (page-make-render-info o sess prms))))))

(defroute "/tuna" nil
  (let ((r (process-page 'tuna-page-top:<top>)))
    (with-slots (ri-page-id ri-title) r
      (with-layout (:title ri-title :page-id ri-page-id)
  	(render #P"init.tmpl" `(page-id ,ri-page-id))))))

  ;; (let* ((p (make-instance 'tuna-page-top:<top>))
  ;; 	 (r (page-make-render-info p nil nil)))
  ;;   (with-slots (ri-page-id ri-title) r
  ;;     (with-layout (:title ri-title :page-id ri-page-id)
  ;; 	(render #P"init.tmpl" '(page-id "top"))))))

(defroute ("/tuna/login" :method :get) nil
  (with-layout (:title "ログイン" :page-id "login")
    (render #P"init.tmpl" '(page-id "login"))))

(defroute ("/tuna/signup" :method :get) nil
  (let ((r (process-page 'tuna-page-signup:<signup>)))
    (with-slots (ri-page-id ri-title) r
      (with-layout (:title ri-title :page-id ri-page-id)
  	(render #P"init.tmpl" `(page-id ,ri-page-id))))))

  ;; (with-layout (:title "サインアップ")
  ;;   (render #P"init.tmpl" '(page-id "signup"))))

(defroute ("/ajax/getContent/top" :method :get) nil
  (render #P"index.tmpl"))

(defroute ("/ajax/getContent/login" :method :get) nil
  (render #P"login.tmpl"))

(defroute ("/ajax/getContent/signup" :method :get) nil
  (render #P"signup.tmpl"))

;;(ironclad:byte-array-to-hex-string
;;               (ironclad:digest-sequence :sha1
;;                  (ironclad:ascii-string-to-byte-array "password")))

(defroute ("/ajax/signup" :method :get) (&rest prms)
  (print prms)
  (with-layout (:title "ログイン" :page-id "login")
    (render #P"init.tmpl" '(page-id "login"))))


;; (defroute ("/ajax/signup" :method :get) (&key |email| |passwd| |passwd_conf|)
;;   (print |email|)
;;   )

(defroute ("/ajax/aaa" :method :get) (&rest prms)
  (print prms)
  )






;CL-USER> (cl-base64:usb8-array-to-base64-string (ironclad:digest-sequence :sha256 (babel:string-to-octets "あいうえお")))
;"/bSB6pVv22VK/MMnz/m2JpZrKr2rw/Pm28sWZ6iI7Zo="
;CL-USER> (cl-base64:base64-string-to-usb8-array "/bSB6pVv22VK/MMnz/m2JpZrKr2rw/Pm28sWZ6iI7Zo=")
;#(253 180 129 234 149 111 219 101 74 252 195 39 207 249 182 38 150 107 42 189 171 195 243 230 219 203 22 103 168 136 237 154)

;;(defroute ("/ajax/signup" :method :get) nil;;(&key |email| |passwd|)
;;  (print |email|)
;;  (print |passwd|)
;;  (let* ((con (connect-db :maindb))XC
;;	 (q (prepare con "insert into usertb values (?,?,?,?,?,?)"))
;;	 (render #P"signup.tmpl"))))

;;(defroute ("/ajax/getContent/page-id" :method :get) (&key (pageId "top"))
;;  (render #P"login.tmpl" `(:dt ,(test))))

;;  (testtesttest)
;;  (print pageId)
;;  (print "hello")
;;  (render-json `('pageId ,(render #P"index.tmpl"))))

;; Error pages

(defmethod on-exception ((app <web>) (code (eql 404)))
  (declare (ignore app))
  (merge-pathnames #P"_errors/404.html"
                   *template-directory*))
