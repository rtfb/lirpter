(defun lambdap (x)
  (eq (car x) 'lambda))

(defun do-lambda (x)
  (format t "lambda!")
  x)

(defun do-symbol-lookup (x)
  x)

(defun do-apply (x)
  x)

(defun eval-expr (x)
  (cond
    ((numberp x)
        (+ x x))
    ((symbolp x)
        (do-symbol-lookup x))
    ((lambdap x)
        (do-lambda x))
    (t (do-apply x))))
