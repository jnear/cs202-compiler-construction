#lang racket

;;    exp ::= int | (read) | (- exp) | (+ exp exp)
;;    R0 ::= (program exp)

;; exhaustively generate all programs in R0
;; return a list of programs
(define (gen-exp-R0 n)
  (cond
    [(zero? n) '()]
    [else
     (append
      (gen-int)
      '((read))
      (map (lambda (e) `(- ,e)) (gen-exp-R0 (- n 1)))
      (map (lambda (es) `(+ ,(car es) ,(cadr es)))
           (cartesian-product
            (gen-exp-R0 (- n 1)) (gen-exp-R0 (- n 1)))))]))

;; returns a list of programs
(define (gen-int)
  '(7 19 459 1 2))





;; exp ::= int | (read) | (- exp) | (+ exp exp)
;;      |  var | (let ([var exp]) exp)
;; R1 ::= (program exp)

(define (gen-exp-R1 env n)
  (cond
    [(zero? n) '()]
    [else
     (append
      (gen-int)
      '((read))
      env
      (gen-let env n)
      (map (lambda (e) `(- ,e))
           (gen-exp-R1 env (- n 1)))
      (map (lambda (es) `(+ ,(car es) ,(cadr es)))
           (cartesian-product
            (gen-exp-R1 env (- n 1))
            (gen-exp-R1 env (- n 1)))))]))

;; return a list of let programs
(define (gen-let env n)
  (let* ([xs (gen-var)])
    (append*
     ;; result is a list of lists of let programs
     (map (lambda (x) (gen-let-helper x env n))
          xs))))

;; return a list of let programs
(define (gen-let-helper x env n)
  (let ([es (cartesian-product
             (gen-exp-R1 env (- n 1))
             (gen-exp-R1 (cons x env) (- n 1)))])
    (map (lambda (e)
           `(let ([,x ,(car e)]) ,(cadr e)))
         es)))

(define (gen-var)
  '(x y))
