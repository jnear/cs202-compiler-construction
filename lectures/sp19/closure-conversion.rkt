#lang racket
(require racket/set)
(require rnrs/mutable-pairs-6)

;; Closure conversion examples

(let ([f (lambda (x) x)])
  (f 5))

(define (lookup x env)
  (cond
    [(assq x env) => (lambda (x) (unbox (cdr x)))]
    [else (error 'lookup "failed to find ~a in ~a" x env)]))

(define (eval-exp e env)
  (printf "env: ~a\n" env)
  (match e
    [(? symbol?) (lookup e env)]
    [(? number?) e]
    [`(set! ,x ,e)
     (let ([v (eval-exp e env)])
       (let ([p (assq x env)])
         (set-box! (cdr p) v)))]
    [`(let ([,x ,e1]) ,e2)
     (let* ([v (eval-exp e1 env)]
            [new-env (cons (cons x (box v)) env)])
       (eval-exp e2 new-env))]
    [`(lambda (,x) ,e)
     `(closure ,x ,e ,env)]              ;; this version implements LEXICAL SCOPE
    [`(,f ,e)
     (match (eval-exp f env)
       [`(closure ,x ,body ,c-env)
        (let* ([v (eval-exp e env)]
               [new-env (cons (cons x (box v)) c-env)])
          (eval-exp body new-env))])]))

(eval-exp '(lambda (x) x)
          '())

(eval-exp '(let ([f (lambda (x) x)])
             (f 5))
          '())

(eval-exp '((lambda (x) x) 5)
          '())

;; LAMBDA LIFTING
;; find every lambda and lift it to a top level definition
;; (lambda Integer (x : Integer) x)
;; id :: A -> A

(define (global-fn-1 x)
  x)
  
(let ([f global-fn-1])
  (f 5))

(let ([y 10])
  (let ([f (lambda (x) y)])
    (f 5)))

(eval-exp '(let ([y 10])
             (let ([f (lambda (x) y)])
               (f 5)))
          '())


(define (global-fn-2 x y)
  y)

(let ([y 10])
  (let ([f global-fn-2])
    (f 5 y)))


(define (fv e)
  (match e
    [(? symbol?) (set e)]
    [(? number?) (set)]
    [`(let ([,x ,e1]) ,e2)
     (set-union
      (fv e1)
      (set-subtract (fv e2) (set x)))
     ]
    [`(lambda (,x) ,e)
     (set-subtract (fv e) (set x))
     ]
    [`(,f ,e)
     (set-union
      (fv f)
      (fv e))
     ]))



(fv '(lambda (x) y))

;; lambda lifting
;; 1. find lambdas in the program
;; 2. lift them into top-level R4 function definitions
;; 3. replace the lambda with a reference to the top-level
;;    definition
;; 4. modify each function application to pass values
;;    for the free variables


(define (global-fn-3 x y)
  y)

(let ([y 10])
  (let ([f global-fn-3])
    (f 5 y)))

(((lambda (y)
    (lambda (x)
      y))
  5) 6)

(let ([f (let ([y 10])
           (lambda (x) y))])
  (f 5))

;(eval-exp '(let ([f (let ([y 10])
;                      (lambda (x) y))])
;             (f 5))
;          '())

(let ([y 10])
  (let ([f (lambda (x) y)])
    (let ([y 20])
      (f 5))))

;; dynamic scope (bad!)
(eval-exp '(let ([y 10])
             (let ([f (lambda (x) y)])
               (let ([y 20])
                 (f 5))))
          '())

;; lexical scope (good!)
(eval-exp '(let ([y1 10])
             (let ([f (lambda (x) y1)])
               (let ([y2 20])
                 (f 5))))
          '())

;; closure: a function which "closes over" (saves) values of
;; its free variables at function creation time

(eval-exp '(let ([f (let ([y 10])
                      (lambda (x) y))])
             (f 5))
          '())

(define (global-fn-5 x v)
  (vector-set! v 0 x))

(let ([v (vector 1)])
  (let ([f global-fn-5])
    (f 5 v)
    v))


;; lambda lifting fails

;; we want: closure conversion

(define (global-fn-6 x y)
  y)

;(let ([f (let ([y 10])
;           global-fn-6)])
;  (f 5 y))

;; closure conversion
;; 1. lift lambdas
;; 2. replace lambda expressions with closure creation code
;;    (create a vector with function + values of free vars)
;; 3. replace function application with vector-ref into
;;    closure value, plus pass free vars from closure structure

(define (global-fn-7 x fvs)
  (vector-ref fvs 0))

(let ([f (let ([y 10])
           (vector global-fn-7 (vector y)))])
  ((vector-ref f 0) 5 (vector-ref f 1)))

(eval-exp '(let ([x 5])
             (let ([y (set! x 6)])
               x))
          '())

