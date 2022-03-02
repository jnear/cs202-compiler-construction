# Final Review (Spring 2020)

# Format

- Same question format as the midterm
- Take-home format, with 6 days to complete
- Liberal partial credit

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

## Control Flow Graphs

Consider the following pseudo-x86 program compiled from R2, with 4
basic blocks.

    "start":
            [ CmpqE ( IntXE 6 ) ( IntXE 5 )
            , JmpIfE CCe "label4" 
            , JmpE "label3" 
            ] 
    
    "label3":
            [ MovqE ( IntXE 8 ) ( VarXE "x1" )
            , JmpE "label2" 
            ] 
    
    "label4":
            [ MovqE ( IntXE 7 ) ( VarXE "x1" )
            , JmpE "label2" 
            ] 
    
    "label2":
            [ MovqE ( VarXE "x1" ) ( VarXE "tmp5" )
            , AddqE ( IntXE 10 ) ( VarXE "tmp5" )
            , MovqE ( VarXE "tmp5" ) ( RegE "rax" )
            , RetqE
            ] 
    
1. Draw the control flow graph for this program (without
   instructions - only labels required) (i.e. the "jumps-to graph"
   described in class).

2. In what order should liveness analysis be performed on the basic
   blocks of this program?

3. Perform the liveness analysis for this program, filling in the
   live-after sets for each instruction and the live-before sets for
   each basic block.

Program:

    "start":  LIVE-BEFORE: {               }
            [ CmpqE ( IntXE 6 ) ( IntXE 5 )           {           }
            , JmpIfE CCe "label4"                     {           }
            , JmpE "label3"                           {           }
            ] 
    
    "label3":  LIVE-BEFORE: {               }
            [ MovqE ( IntXE 8 ) ( VarXE "x1" )        {           }
            , JmpE "label2"                           {           }
            ] 
    
    "label4":  LIVE-BEFORE: {               }
            [ MovqE ( IntXE 7 ) ( VarXE "x1" )        {           }
            , JmpE "label2"                           {           }
            ] 
    
    "label2":  LIVE-BEFORE: {               }
            [ MovqE ( VarXE "x1" ) ( VarXE "tmp5" )   {           }
            , AddqE ( IntXE 10 ) ( VarXE "tmp5" )     {           }
            , MovqE ( VarXE "tmp5" ) ( RegE "rax" )   {           }
            , RetqE
            ] 

## Heap allocation

Consider the following program:

    let x = 5 in
      let y = 6 in
        let v1 = vector(x, y) in
          let v2 = vector(v1, x, v1) in
            vector(v1, v2)

1. Assuming registers are *not* used, which variables will be placed on the stack, and which variables will be placed on the root stack?

2. Draw the tags for the vectors `v1` and `v2`.

3. Draw the root stack and heap after this program runs, assuming the initial heap size is large enough that no garbage collection is needed.

Consider the following heap state (root stack and from-space):

![](heap-diagram1.png)

4. Complete the diagram by filling the to-space with the new state of the heap *after* garbage collection. Assume Cheney's algorithm for copying collection.

## Functions

5. Circle the *tail calls* in the following program.

```
    def fact(x: Integer): Integer = {
      if x == 0
      then 1
      else times(x, fact(x + -1), 0)
    }

    def times(x: Integer, y: Integer): Integer = {
      if x == 0
      then 0
      else y + times(x + -1, y)
    }

    fact(5)
```

Consider the following program in R4:

```
    def fn(a : Integer,
           b : Integer,
           c : Integer,
           d : Integer,
           e : Integer,
           f : Integer,
           g : Integer,
           h : Integer) : Integer
      a + b + c + d + e + f + g + h)

    fn(1,2,3,4,5,6,7,8)
```

6. Write the output of the `limit-functions` pass on this program.

Consider the following x86 program.

```
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
```

7. Write the original R4 program for which this x86 program is (roughly) the output of our compiler.


## Anonymous functions (lambda)

8. What are the free variables of the lambda expression `lambda (x: Integer) -> x + y`?

Consider the following program:

```
    let y = 10 in
      let f = (lambda (x: Integer) -> y) in
        let y = 20 in
          f(5)
```

9. What is the value of this program under *dynamic scope*?

10. What is the value of this program under *lexical scope*?

11. Perform closure conversion to transform this program into an R4 program (you may omit type annotations). Your transformed code should implement lexical scope.

## Dynamic typing

Consider the following program:

```
    if True
    then 1 + 2
    else False + 3
```

12. Does this program have a *static* type, according to our R4 typechecker?

13. Does running this program result in a *run-time* type error?

14. Convert this program to one which has a static type, according to the R6 typechecker. Use `inject` and `project`.

```
    if True
    then 1 + 2
    else False + 3
```

15. What R6 program corresponds to the following assembly code?

```
    movq $1, %rdx
    saql $3, %rdx
    orq  $4, %rdx
```

16. What R6 program corresponds to the following assembly code? Assume that variable `x` of type `Any` has been placed in `%rcx`.

```
    block1:
      andq $7, %rcx
      cmpq $1, %rcx
      je block2
      movq $-1, %rdi
      callq exit
    block2:
      movq %rcx, %rbx
      sarq $3, %rbx
```

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

