# Midterm Review (Spring 2019)

**NOTE: This document is from Spring 2019, and has not yet been updated**

# Format

- Open notes: bring as much printed material as you want
- Closed computers / phones / everything else
- If you're asked to write in a language, I will give you the grammar
- I *won't* give you compiler passes, evaluators, etc.
- Should take only 30-40 minutes
- If you successfully completed the homework assignments, the questions should be easy
- Liberal partial credit applied (especially when you're asked to write code)

# Major topics

- Partial evaluation
- Uniquifying variables
- Flattening expressions
- Translation to C₀ language
- x86₀ programming
- Translation to x86₀
- Passes of the A2 / A3 / A4 compiler
- Stack allocation
- Register allocation
  - Liveness analysis
  - Interference graph
  - Allocation by graph coloring
- Typechecking

# Sample Questions

## Partial Evaluation

Partially evaluate the following expressions:

    (+ 10 20)
    (+ (+ 1 2) (+ 3 (read)))
    (+ 2 (+ (read) 4))
    (- (+ (read) (- 10)))
    (+ (+ 1 (read)) (+ 2 (read)))

Here's a partial evaluator:

    (define (pe-neg r)
      (match r
        [(? fixnum?) (- 0 r)]
        [`(read) `(- (read))]
        [`(- ,e) e]
        [`(+ ,e1 ,e2) `(+ ,(pe-neg e1) ,(pe-neg e2))]))
    
    (define (pe-add r1 r2)
      (match `(,r1 ,r2)
        [`(,r1 ,r2) #:when (and (fixnum? r1) (fixnum? r2))
                    (+ r1 r2)]
        [`(,r1 (+ ,r2 ,r3)) #:when (and (fixnum? r1) (fixnum? r2))
                            `(+ ,(+ r1 r2) ,r3)]
        [`(,r1 (+ ,r2 ,r3)) #:when (and (fixnum? r1) (fixnum? r3))
                            `(+ ,(+ r1 r3) ,r2)]
        [`((+ ,r1 ,r2) ,r3) #:when (and (fixnum? r1) (fixnum? r3))
                            `(+ ,(+ r1 r3) ,r2)]
        [`((+ ,r1 ,r2) ,r3) #:when (and (fixnum? r2) (fixnum? r3))
                            `(+ ,(+ r2 r3) ,r1)]
        [`(,r1 ,r2) `(+ ,r1 ,r2)]))
    
    (define (pe-exp e)
      (match e
        [(? fixnum?) e]
        [`(read) `((read))]
        [`(- ,e1) (pe-neg (pe-exp e1))]
        [`(+ ,e1 ,e2) (pe-add (pe-exp e1) (pe-exp e2))]))
    
    
For which of the above expressions will this partial evaluator fail to
produce a fully partially evaluated result?

At a high level (just one sentence), how would you fix it?

## Uniquifying variables

For each of the following expressions, replace each variable with a
  "uniquified" version, e.g. `x` ⇒ `x.1`.

    (let ([x 5])
      (let ([y 6])
        (+ x y)))
      
    (let ([x 5])
      (let ([x 6])
        (+ x x)))
          
    (let ([x (let ([x 7]) 
               (+ x 1))])
      (let ([x 6])
        (+ x x)))

    (let ([x 5])
      (let ([x (let ([x 7]) 
                 (+ x 1))])
        (+ x x)))

## Flattening Expressions

Compile the following R₁ program into C₀:

    (program () (+ (let ([x (read)]) (+ x 3)) 7))

## x86 / compiler passes / stack allocation

Compile the below program into x86, placing all variables on the
stack.

    (program (x t1 t2)
      (callq read_int)
      (movq (reg rax) (var x))
      (movq (int 4) (var t1))
      (negq (var t1))
      (movq (var t1) (var t2))
      (addq (var x) (var t2))
      (movq (var t2) (reg rax)))

Part (a): for each variable in the program, assign the variable a home
on the stack.

- `x`:
- `t1`:
- `t2`:

Part (b): what is the size (in bytes) of the stack frame for this
program?

Part (c): write down the complete x86 program

## Liveness analysis / interference graph / graph coloring

Consider this program:

    (program (x t1 t2)
      (movq (int 5) (var x))
      (movq (int 4) (var t1))
      (negq (var t1))
      (movq (var t1) (var t2))
      (addq (var x) (var t2))
      (movq (var t2) (reg rax)))

Annotate the below copy of the program with each instruction's
*live-after* set.

    (program (x t1 t2)
      (movq (int 5) (var x))     {       }
      (movq (int 4) (var t1))    {       }
      (negq (var t1))            {       }
      (movq (var t1) (var t2))   {       }
      (addq (var x) (var t2))    {       }
      (movq (var t2) (reg rax))) {       }

Draw the interference graph for this program.

For the following interference graph, assign a register to each
variable using saturation-based graph coloring. You may use the
registers `rbx`, `rcx`, and `rdx`.

- `x`:
- `t1`:
- `t2`:

## Typechecking

For each of the following expressions, write the type of the
expression. If the expression is not well-typed, write "none."

    (if (read)
        1
        2)
    
    (if (eq? 1 (read))
        (+ 2 3)
        5)
        
    (if (eq? 1 (read))
        (+ 2 3)
        #t)
        
    (if #f
        (eq? 2 3)
        #t)
        
    (let ([x (read)])
      (if (eq? x 5)
          (let ([y (read)])
            (+ x y))
          6))
    
    (let ([x (let ([y (+ 5 (read))])
               (+ y 7))])
      (if #f
          (+ x 2)
          3))
    
    (let ([x (let ([y (+ 5 (read))])
               (+ y x))])
      (if #f
          (+ x 2)
          3))
    
    (let ([x (let ([y (+ 5 (read))])
               (+ y 7))])
      (if #f
          (+ x y)
          3))
    
    (let ([x (if (eq? x 5)
                 #t
                 #f)])
      (if x
          (+ 5 6)
          (read)))
    
