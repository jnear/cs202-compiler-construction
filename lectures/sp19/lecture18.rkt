#lang racket
(require racket/trace)


(define (type-check-exp e env)
  (match e
    [(? fixnum?)   'Integer]
    [(? boolean?)  'Boolean]
    [(? symbol? x) (dict-ref env x)]
    [`(read)       'Integer]
    [`(let ([,x ,e]) ,body)
     (let* ([te (type-check-exp e env)]
            [new-env (cons `(,x . ,te) env)])
       (type-check-exp body new-env))]
    [`(not ,e)
     (match (type-check-exp e env)
       ['Boolean 'Boolean]
       [else (error 'type-check-exp "'not' expects a Boolean" e)])]
    [`(if ,e1 ,e2 ,e3)
     (match (list (type-check-exp e1 env) (type-check-exp e2 env) (type-check-exp e3 env))
       [`(Boolean ,t2 ,t3) #:when (equal? t2 t3)
        t2]
       [else (error 'type-check-exp "type error in 'if' ~a" e)])]
    [`(and ,e1 ,e2)
     (match (list (type-check-exp e1 env) (type-check-exp e2 env))
       [`(Boolean Boolean) 'Boolean]
       [else (error 'type-check-exp "type error in 'and'" e)])]
    [`(eq? ,e1 ,e2)
     (match (list (type-check-exp e1 env) (type-check-exp e2 env))
       [`(,t1 ,t2) #:when (equal? t1 t2)
        'Boolean]
       [else (error 'type-check-exp "type error in 'eq'" e)])]
    [`(+ ,e1 ,e2)
     (match (list (type-check-exp e1 env) (type-check-exp e2 env))
       [`(Integer Integer)
        'Integer]
       [else (error 'type-check-exp "type error in '+'" e)])]
    [`(,op ,e1 ,e2) #:when (member op '(< > <= >=))
     (type-check-int-cmp op e1 e2 env)]
    [`(- ,e1)
     (match (list (type-check-exp e1 env))
       [`(Integer)
        'Integer]
       [else (error 'type-check-exp "type error in '-'" e)])]
    [`(vector ,es ...)
     (let ([t* (for/list ([e es])
                         (type-check-exp e env))])
       `(Vector ,@t*))]
    [`(vector-ref ,ve ,pos)
     (let ([tve (type-check-exp ve env)])
       (match tve
         [`(Vector ,ts ...) #:when (fixnum? pos)
          (list-ref ts pos)]
         [else (error 'type-check-exp "type error in vector-ref")]))]
    [`(vector-set! ,ve ,pos ,e)
     (let ([tve (type-check-exp ve env)]
           [te  (type-check-exp e env)])
       (match tve
         [`(Vector ,ts ...) 
          #:when (and (fixnum? pos) (eq? te (list-ref ts pos)))
          'Void]
         [else (error 'type-check-exp "type error in vector-ref")]))]

    [`(,op ,args ...)
     (let* ([t_f (type-check-exp op env)]
            [t_args (for/list ([a args]) (type-check-exp a env))])
       (match t_f
         [`(,param_types -> ,out_type)
          (if (equal? t_args param_types)
              out_type
              (error 'type-check-exp
                     "Application: Parameter types and argument types do not match: ~a ~a"
                     param_types t_args))]))]
         
    ))

(define (type-check-int-cmp op e1 e2 env)
  (match (list (type-check-exp e1 env) (type-check-exp e2 env))
     [`(Integer Integer)
      'Boolean]
     [else (error 'type-check-exp "type error in '~a'" op e1 e2)]))

(define (get-tenv p)
  (match p
    [`(,p_name : ,p_type) `(,p_name . ,p_type)]))

(define (type-check-define e top-level-env)
  (match e
    [`(define (,name ,ps ...) : ,t_out ,body)
     (let* ([env (map get-tenv ps)]
            [t_body (type-check-exp body (append env top-level-env))]
            [t_args (map cdr env)])
       (if (equal? t_body t_out)
           `(,name . (,t_args -> ,t_body))
           (error 'type-check-define "Definition's body type does not match annotation")))]))

(define (get-type-decl d)
  (match d
    [`(define (,name ,ps ...) : ,t_out ,body)
     (let* ([env (map get-tenv ps)]
            [t_args (map cdr env)])
       `(,name . (,t_args -> ,t_out)))]))

(define (type-check-R4 p)
  (match p
    [`(program () ,defs ... ,body)
     (let* ([top-level-env (for/list ([def defs]) (get-type-decl def))]
            [def-types (for/list ([def defs]) (type-check-define def top-level-env))])
       (type-check-exp body def-types))]))

(type-check-define '(define (add1 [x : Integer]) : Integer
                      (+ x 1))
                   '())

(type-check-R4
 '(program
   ()
   (define (add1 [x : Integer]) : Integer
     (+ x 1))
   (add1 5)))

(type-check-R4
 '(program
   ()
   (define (identityInt [x : Integer]) : Integer
     x)
   (define (identityBool [x : Boolean]) : Boolean
     x)
   (identityBool #t)))

;; parametric polymorphism
;; dynamic typing

(type-check-R4
 '(program
   ()
   (define (add1 [x : Integer]) : Integer
     (+ x 1))
   (define (add2 [x : Integer]) : Integer
     (add1 (add1 x)))
   (add2 5)))

(type-check-R4
 '(program
   ()
   (define (plustorial [x : Integer]) : Integer
     (if (eq? x 0)
         1
         (+ x (plustorial (+ x (- 1))))))
   (plustorial 5)))

(type-check-R4
 '(program
   ()
   (define (fib [x : Integer]) : Integer
     (if (eq? x 0)
         1
         (if (eq? x 1)
             1
             (+ (fib (+ x -1))
                (fib (+ x -2))))))

   (fib 5)))

(define (fib x)
  (cond
   [(eq? x 0) 1]
   [(eq? x 1) 1]
   [else (+ (fib (- x 1)) (fib (- x 2)))]))

(fib 10)


(type-check-R4
 '(program
   ()
   (define (* [x : Integer]
              [y : Integer]) : Integer
     (if (eq? x 0)
         0
         (+ y (* (+ x -1) y))))
        
   (define (fact [x : Integer]) : Integer
     (if (eq? x 0)
         1
         (* x (fact (+ x (- 1))))))
   (fact 5)))

(define (fact x)
  (cond
   [(zero? x) 1]
   [else (* x (fact (sub1 x)))]))


;; functions are first-class values

(type-check-R4
 '(program
   ()
   (define (add1 [x : Integer]) : Integer
     (+ x 1))
   (define (map-vec [f : ((Integer) -> Integer)]
                    [v : (Vector Integer Integer)])
     : (Vector Integer Integer)
     (vector (f (vector-ref v 0)) (f (vector-ref v 1))))
   (map-vec add1 (vector 1 2))))

(type-check-R4
 '(program
   ()
   (define (add1 [x : Integer]) : Integer
     (+ x 1))
   (define (add2 [x : Integer]) : Integer
     (add1 (add1 x)))
   (let ([obj (vector add1 add2)])
     ((vector-ref obj 0) 5))))


;; Point: x : Integer
;;        y : Integer
;;   add: self: Point
;;        oth : Point

;                   x      y      add
;Point = (Vector Integer Integer)

(type-check-R4
 '(program
   ()
   (define (add [self : (Vector Integer Integer)]
                [oth  : (Vector Integer Integer)])
     : (Vector Integer Integer)
     (vector (+ (vector-ref self 0) (vector-ref oth 0))
             (+ (vector-ref self 1) (vector-ref oth 1))))

   (let ([pt1 (vector (vector 1 1) add)])
     (let ([pt2 (vector (vector 2 3) add)])
        ;; pt1.add(pt2)
       (vector
        ((vector-ref pt1 1)
         (vector-ref pt1 0)
         (vector-ref pt2 0))
        add)))))

;; some tail recursive programs
(type-check-R4
 '(program
   ()
   (define (* [x : Integer]
              [y : Integer]
              [a : Integer]) : Integer
     (if (eq? x 0)
         a
         (* (+ x -1) y (+ y a))))
   (* 500000000 10 0)))

;; Python would run out of stack space for this program
;; Racket would too, if not for tail-call optimization
(define (my-* x y a)
  (cond
   [(zero? x) a]
   [else (my-* (sub1 x) y (+ y a))]))

(my-* 500000000 10 0)

