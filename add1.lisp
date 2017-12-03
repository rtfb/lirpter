(defun eval-expr (x)
  (cond
    ((numberp x)
        (+ x x))
    ((listp x)
     (cond
       ((and
          (symbolp (car x))
          (eq 'add1 (car x)))
        (+ 1 (car (cdr x))))
       (t x)))
    (t (do-apply x))))
