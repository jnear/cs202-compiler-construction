# Final Review

# Format

- Same as the midterm
- Open notes: bring as much printed material as you want
- Closed computers / phones / everything else
- If you're asked to write in a language, I will give you the grammar
- I *won't* give you compiler passes, evaluators, etc.
- Should take only 30-40 minutes
- If you successfully completed the homework assignments, the questions should be easy
- Liberal partial credit applied (especially when you're asked to write code)

# Major topics

- Heap allocation
  - Vectors
  - Representation and tagging
  - Root stack
  - Garbage collection
- Functions
  - Calling convention
  - Limiting number of arguments
  - Tail-call optimization
  - Functions as values
- Anonymous functions (lambda)
  - Static vs dynamic scope
  - Lambda lifting
  - Closure conversion
- Dynamic typing
  - Definitions
  - "Any" type and typechecking
  - Inject / project
  - Representation (tagging)
  - Runtime checks & generating x86
- Objects
  - Method tables and dynamic dispatch
  - Representation with vectors
- Optimization
  - Local
    - Partial evaluation
    - Constant propagation
    - Dead code elimination
  - Intraprocedural
    - Register allocation
    - Static typing
    - Move biasing
    - Eliminating unneeded jumps
  - Interprocedural
    - Inlining
- How code gets executed
  - Role of the compiler and linker
  - Object files vs executables
  - Encoding instructions

# Sample Questions


## Heap allocation

Consider the following program:

    (let ([x 5])
      (let ([y 6])
        (let ([v1 (vector x y)])
          (let ([v2 (vector v1 x v1)])
            (vector v1 v2)))))

1. Assuming registers are *not* used, which variables will be placed on the stack, and which variables will be placed on the root stack?

2. Draw the tags for the vectors `v1` and `v2`.

3. Draw the root stack and heap after this program runs, assuming the initial heap size is large enough that no garbage collection is needed.

Consider the following heap state (root stack and from-space):

![](heap-diagram1.png)

4. Complete the diagram by filling the to-space with the new state of the heap *after* garbage collection. Assume Cheney's algorithm for copying collection.

## Functions

5. Circle the *tail calls* in the following program.

    (define (fact [x : Integer]) : Integer
      (if (eq? x 0)
          1
          (* x (fact (+ x -1)))))
    
    (define (* [x : Integer] [y : Integer]) : Integer
      (if (eq? x 0)
          1
          (+ y (* (+ x -1) y))))
    
    (fact 5)

Consider the following program in R4:

    (define (fn [a : Integer]
                [b : Integer]
                [c : Integer]
                [d : Integer]
                [e : Integer]
                [f : Integer]
                [g : Integer]
                [h : Integer]) : Integer
      (+ a (+ b (+ c (+ d (+ e (+ f (+ g h))))))))

    (fn 1 2 3 4 5 6 7 8)

6. Write the output of the `limit-functions` pass on this program (you may omit `has-type` forms).

Consider the following x86 program.

add1start:
  movq %rcx, %rax
  addq $1, %rax
  jmp add1conclusion
add1:
  pushq %rbp
  movq %rsp, rbp
  jmp add1start
add1conclusion:
  popq %rbp
  retq

mainstart:
  leaq add1(%rip), %rdx
  movq $5, %rcx
  movq %rdx, %rax
  popq %rbp
  jmp *%rax

.globl main
main:
  pushq %rbp
  movq %rsp, %rbp
  jmp mainstart
mainconclusion:
  popq %rbp
  retq

7. Write the original R4 program for which this x86 program is (roughly) the output of our compiler.


## Anonymous functions (lambda)

8. What are the free variables of the lambda expression `(lambda (x) (+ x y))`?

Consider the following program:

    (let ([y 10])
      (let ([f (lambda (x) y)])
        (let ([y 20])
          (f 5))))

9. What is the value of this program under *dynamic scope*?

10. What is the value of this program under *lexical scope*?

11. Perform closure conversion to transform this program into an R4 program (you may omit type annotations). Your transformed code should implement lexical scope.

## Dynamic typing

Consider the following program:

    (if #t
        (+ 1 2)
        (+ #f 3))

12. Does this program have a *static* type, according to our R4 typechecker?

13. Does running this program result in a *run-time* type error?

14. Convert this program to one which has a static type, according to the R6 typechecker. Use `inject` and `project`.

    (if #t
        (+ 1 2)
        (+ #f 3))

15. What R6 program corresponds to the following assembly code?

    movq $1, %rdx
    saql $3, %rdx
    orq  $4, %rdx

16. What R6 program corresponds to the following assembly code? Assume that variable `x` of type `Any` has been placed in `%rcx`.

    block1:
      andq $7, %rcx
      cmpq $1, %rcx
      je block2
      movq $-1, %rdi
      callq exit
    block2:
      movq %rcx, %rbx
      sarq $3, %rbx

## Objects

Consider the following program in Racket:

    (define rectangle%
      (class object%
             (define width 10)
             (define height 20)
             
             (super-new)
     
             (define/public (area)
               (* width height))))
    
    (define obj (new rectangle%))
    
    (send obj area)

17. Write the method table, represented using a vector, for the `rectangle%` class.

    (define rectangle-method-table
      (vector
      
      
      
      
      )

18. Compile this program into one which does not use Racket's object system, but instead implements dynamic dispatch via a method table stored in a vector.

## How code gets executed

Consider the following output of `objdump -d adduser.o`:

    adduser.o:    file format Mach-O 64-bit x86-64
    
    Disassembly of section __TEXT,__text:
    _main:
          0:    48 c7 c1 51 00 00 00     movq    $81, %rcx
          7:    48 c7 c2 2d 00 00 00     movq    $45, %rdx
          e:    e8 00 00 00 00     callq    0 <_main+0x13>
         13:    c3     retq

19. What component is responsible for producing the file `adduser.o`?

20. What component is responsible for combining `adduser.o` with another file which contains the definition of the `add` function?

