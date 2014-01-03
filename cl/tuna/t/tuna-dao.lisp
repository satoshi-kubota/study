(in-package :cl-user)
(defpackage tuna-dao-test
  (:use :cl
	:dbi
        :tuna-dao-user-dao
        :cl-test-more))
(in-package :tuna-dao-test)

(plan nil)

(with-connection (con :postgres :database-name "tuna" :username "tuna" :password "tuna")
  (ok (get-timestamp con)))

(with-connection (con :postgres :database-name "tuna" :username "tuna" :password "tuna")
  (ok (get-seq con)))

(with-connection (con :postgres :database-name "tuna" :username "tuna" :password "tuna")
  (ok (create-user con "test@test.co.jp" "さとし" "password")))

(with-connection (con :postgres :database-name "tuna" :username "tuna" :password "tuna")
  (ok (read-user-count-by-email con "test@test.co.jp")))

(with-connection (con :postgres :database-name "tuna" :username "tuna" :password "tuna")
  (print (read-user-count-by-email con "atest@test.co.jp")))

;; (with-connection (con :postgres :database-name "tuna" :username "tuna" :password "tuna")
;;   (multiple-value-bind
;; 	(id email hashedpasswd guid time)
;;       (create-user con "test@test.co.jp" "passwd")
;;     (ok id)
;;     (read-user-by-email con email)
;; (ok (create-user con "test@test.co.jp" "password")))



(run-test-all)

(finalize)

