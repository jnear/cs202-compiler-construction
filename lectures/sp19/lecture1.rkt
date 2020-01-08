#lang racket

(define five 5)

(define (identity a)
  a)

(define (identity2 a b)
  `(,a ,b))

(define (mk-plus a b)
  `(+ ,a ,b))

(let ([x 5]
      [y 10])
  (+ x y))

(define (length ls)
  (match ls
    ['() 0]
    [`(,x . ,xs) (+ 1 (length xs))]))

(define (eval-exp e)
  (match e
    [(? boolean?) e]
    [(? fixnum?) e]
    ['(read) (read)]
    [`(- ,e) (- (eval-exp e))]
    [`(and ,e1 ,e2) (and (eval-exp e1)
                         (eval-exp e2))]
    [`(+ ,e1 ,e2) (+ (eval-exp e1)
                     (eval-exp e2))]))

