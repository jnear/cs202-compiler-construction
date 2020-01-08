#lang racket

(define rectangle%
  (class object%
         (define width 10)
         (define height 20)
         
         (super-new)
 
         (define/public (area)
           (* width height))))

(define obj (new rectangle%))

(send obj area)


;; step 1: lift methods

(define rectangle%
  (class object%
         (define width 10)
         (define height 20)
         
         (super-new)
 
))

(define (rectangle-area this)
  (* (field-ref this width) (field-ref this height)))

(define rectangle-method-table
  (vector rectangle-area))

(define obj (new rectangle%))

(send obj area)

;; step 2: new objects are vectors

(define rectangle%
  (class object%
         (define width 10)   ;; slot 1
         (define height 20)  ;; slot 2
         
         (super-new)
 
))

(define (rectangle-area this)
  (* (field-ref this width) (field-ref this height)))

(define rectangle-method-table
  (vector rectangle-area))

;; vector format: (vector (vector m1 m2 ...) f1 f2 ...)

(define obj (vector rectangle-method-table 10 20))

(send obj area)

;; step 3: method calls use the method table!

(define (rectangle-area this)
  (* (field-ref this width) (field-ref this height)))

(define rectangle-method-table
  (vector rectangle-area))

;; vector format: (vector (vector m1 m2 ...) f1 f2 ...)

(define obj (vector rectangle-method-table 10 20))

((vector-ref
  (vector-ref obj 0) ;; gets the method table
  0)                 ;; gets the first method
 obj)                ;; pass "this"

;; step 4: field refs

(define (rectangle-area this)
  (* (vector-ref this 1) (vector-ref this 2)))

(define rectangle-method-table
  (vector rectangle-area))

;; vector format: (vector (vector m1 m2 ...) f1 f2 ...)

(define obj (vector rectangle-method-table 10 20))

((vector-ref
  (vector-ref obj 0) ;; gets the method table
  0)                 ;; gets the first method
 obj)                ;; pass "this"
