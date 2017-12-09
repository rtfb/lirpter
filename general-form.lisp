(defun eval-expr (x env)
  (cond
    ((numberp x)
     (+ x x))
    ((symbolp x)
     (funcall env x))
    ((eq (car x) 'lambda)
     (lambda (arg)
       (eval-expr (caddr x) (lambda (y)
                              (if (eq (caadr x) y)
                                arg
                                (funcall env y))))))
    (t (funcall (eval-expr (car x) env)
                (eval-expr (cadr x) env)))))

; $ sbcl --load general-form.lisp
; This is SBCL 1.3.3.debian, an implementation of ANSI Common Lisp.
; [...]
; * (eval-expr '(lambda (z) z) (lambda (y) (error "unbound ~s" y)))
; 
; #<CLOSURE (LAMBDA (ARG) :IN EVAL-EXPR) {1003A88C6B}>
; * (eval-expr '((lambda (z) z) 7) (lambda (y) (error "unbound ~s" y)))
; 
; 14
; * 
