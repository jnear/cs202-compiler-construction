#lang racket


;; exp ::= int | (read) | (- exp) | (+ exp exp) | var | (let ([var exp]) exp)
;; R1 ::= (program exp)

(define (lookup x env)
  (cond
    [(assq x env) => cdr]
    [else (error "didn't find ~a in ~a" x env)]))

(define (interp-exp e env)
  (match e
    [(? fixnum?) e]
    [(? symbol?) (lookup e env)]
    [`(+ ,e1 ,e2) (+ (interp-exp e1 env)
                     (interp-exp e2 env))]
    [`(- ,e) (- (interp-exp e env))]
    [`(read) (read)]
    [`(let ([,x ,e1]) ,e2)
     (interp-exp e2
                 (cons `(,x . ,(interp-exp e1 env)) env))]))

(define (interp-r1 e)
  (match e
    [`(program ,exp) (interp-exp exp '())]))

(interp-exp '(+ 1 2) '())
(interp-exp '(let ((x 5)) (+ x 10)) '())
(interp-exp '(+ x 10) '((x . 5)))
(interp-exp '(let ((x 5))
               (+ x (let ((x 6)) 
                      (+ x 10))))
            '())
