(deftype loginStatus ()
    '(member anonymous login))

(defclass <userInfo> ()
  ((id)
   (email)
   (display-name)
   (login-status)))

(defmethod set-slots((o <userInfo>) pid pemail pdisplay-name plogin-status)
  (with-slots (id email display-name login-status) o
    (setf id pid)
    (setf email pemail)
    (setf display-name pdisplay-name)
    (setf login-status plogin-status)
    o))

(defmethod to_s((o <userInfo>))
  (with-slots (id email display-name login-status) o
    (format t "~A ~A ~A ~A ~A" o id email display-name login-status)
    o))

(defun create<userInfo> () 
  (let ((o (make-instance '<userInfo>)))
    (set-slots o nil nil "ななしさん" 'anonymous)))

