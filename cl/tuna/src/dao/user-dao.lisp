(in-package :cl-user)
(defpackage tuna-dao-user-dao
  (:use :cl
	:babel
	:cl-base64
	:dbi
	:uuid)
  (:export :get-timestamp
	   :get-seq
	   :create-user
	   :delete-user
	   :read-user-by-email
	   :read-user-count-by-email))
(in-package :tuna-dao-user-dao)

 (defun get-timestamp(con)
   (let* ((qs "select statement_timestamp() as ts")
	  (ps (prepare con qs))
	  (c (execute ps))
	  (r (fetch c)))
     (getf r :|ts|)))

 (defun get-seq(con)
   (let* ((qs "select nextval('user_sq') as sq")
	  (ps (prepare con qs))
	  (c (execute ps))
	  (r (fetch c)))
     (getf r :|sq|)))

(defun create-user(con email display-name passwd)
  (let* ((qs "insert into usertb values (?,?,?,?,?,to_timestamp(?,'YYYY-MM-DD HH24:MI:SS.MS'),to_timestamp(?,'YYYY-MM-DD HH24:MI:SS.MS'))")
	 (sq (get-seq con))
	 (hp (usb8-array-to-base64-string (
					   ironclad:digest-sequence :sha256 (string-to-octets passwd))))
	 (guid (print-bytes nil (make-v1-uuid)))
	 (ps (prepare con qs))
	 (now (get-timestamp con)))
    (execute ps sq email display-name hp guid now now)
    (values sq hp guid now)))
  
(defun delete-user(con id)
  (let* ((qs "delete from usertb where id = ?")
	 (ps (prepare con qs)))
    (execute ps id)))

(defun read-user-by-email(con email)
  (let* ((qs "select * from usertb where email = ?")
	 (ps (prepare con qs))
	 (c (execute ps email)))
    (series:scan (fetch-all c))))

(defun read-user-count-by-email(con email)
  (let* ((qs "select count(*) cnt from usertb where email = ?")
	 (ps (prepare con qs))
	 (c (execute ps email)))
    (getf (fetch c) :|cnt|)))

		     
;;(cl-base64:usb8-array-to-base64-string (ironclad:digest-sequence :sha256 (babel:string-to-octets "あいうえお")))


;;  (defun createUser(&key con |email| |passwd|)
;;   (let ((qs "insert into usertb values (?,?,?,?,?,?,?)")
;; 	(now 


;; (defroute ("/ajax/signup" :method :ge) (&key |email| |passwd| |passwd_conf|)
;;   (let* ((con (connect-db :maindb))
;; 	 (q (prepare con "insert into usertb values (?,?,?,?,?,?)"))
;; 	 (hp (
;; 	 (render #P"signup.tmpl"))))
