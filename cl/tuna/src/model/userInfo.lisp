(deftype loginStatus ()
    '(member anonymous login))

(defclass <userInfo> ()
  ((userId)
   (userName)
   (loginStatus)))

(defmethod set-slots((o <userInfo>) id name status)
  (with-slots (userId userName loginStatus) o
	     (setf userId id)
	     (setf userName name)
	     (setf loginStatus status)
	     o))

(defmethod to_s((o <userInfo>))
  (with-slots (userId userName loginStatus) o
    (format t "~A ~A ~A ~A" o userId userName loginStatus)
    o))

(defun create<userInfo> () 
  (let ((o (make-instance '<userInfo>)))
    (set-slots o nil "ななしさん" 'anonymous)))

