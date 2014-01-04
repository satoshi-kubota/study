(defclass foo ()
  ((a :initarg :a)
   (b :initarg :b)))

(defclass woo (foo)
  ())

(defmethod initialize-instance :after ((o woo) &rest initargs)
  (with-slots (a b) o
    (setf a "aaa")
    (setf b "bbb")))

