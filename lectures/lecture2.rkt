#lang racket

(require rackunit rackunit/text-ui)

;; exp ::= int | (read) | (- exp) | (+ exp exp)
;; R0  ::= (program exp)

;; R0 -> bool
(define (is-R0? e)
  (match e
    [`(program ,e) (is-exp? e)]
    [else #f]))

;; exp -> bool
(define (is-exp? e)
  (match e
    [(? fixnum?) #t]
    [`(read) #t]
    [`(- ,e) (is-exp? e)]
    [`(+ ,e1 ,e2) (and (is-exp? e1)
                       (is-exp? e2))]
    [else #f]))


(define-test-suite R0?-tests
  (test-case "t1" (check-eq? (is-R0? '(program (+ 1 1)))
                             #t))
  
  )

(run-tests R0?-tests)


;; exp ::= int | (read) | (- exp) | (+ exp exp)
;; R0  ::= (program exp)

;; R0 -> int
(define (interp-R0 e)
  (match e
    [`(program ,e) (interp-exp e)]))

;; exp -> int
(define (interp-exp e)
  (match e
    [(? fixnum?) e]
    [`(read) (read)]
    [`(- ,e) (- (interp-exp e))]
    [`(+ ,e1 ,e2) (+ (interp-exp e1) (interp-exp e2))]))




;; exp ::= int | (read) | (- exp) | (+ exp exp)
;; R0  ::= (program exp)

;; R0 -> R0
(define (pe-R0 e)
  (match e
    [`(program ,e) `(program ,(pe-exp e))]))

;; (- (+ e1 e2)) ->
;;   (+ (- e1) (- e2))

;; (- (+ (- e1) e2))
;; -> (+ (- (- e1)) (- e2))
;; -> (+ e1 (- e2))

;; (+ (+ e1 e2) e3)
;;  and e1 and e3 are numbers
;; `(+ ,(+ e1 e3) ,e2)

(define (pe-neg r)
  (match r
    [(? fixnum? r) (- r)]
    [`(- (- ,r)) ]
    [`(- ,r) `(- ,r)]))

(define (pe-add r1 r2)
  (match `(,r1 ,r2)
    [`(,r1 ,r2)
     #:when (and (fixnum? r1) (fixnum? r2))
     (+ r1 r2)]
    [`(,r1 ,r2) `(+ ,r1 ,r2)]))


;; exp -> exp
(define (pe-exp e)
  (match e
    [(? fixnum?) e]
    [`(read) `(read)]
    [`(- ,e) (pe-neg (pe-exp e))]
    [`(+ ,e1 ,e2) (pe-add (pe-exp e1) (pe-exp e2))]))



(define-test-suite pe-tests
  (test-case "t1" (check-equal?
                   (pe-R0 '(program (+ 1 1)))
                   '(program 2)))
  (test-case "t2" (check-equal?
                   (pe-R0 '(program (+ (read) (+ 1 2))))
                   '(program (+ (read) 3))))
  (test-case "t3" (check-equal?
                   (pe-R0 '(program (+ 1 (+ 2 (read)))))
                   '(program (+ 3 (read)))))
  (test-case "t4" (check-equal?
                   (pe-R0 '(program (+ (+ 1 (read)) (+ 2 (read)))))
                   '(program (+ 3 (+ (read) (read))))))
  )

(run-tests pe-tests)









