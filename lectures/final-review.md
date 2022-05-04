# Final Review (Spring 2022)

# Format

- Same question format as the midterm
- Open notes: bring as much printed material as you want
- Closed computers / phones / everything else
- You'll be expected to be familiar with:
  - Languages (and IRs) used in our compilers
  - Compiler passes in our assignments
- Should take only 30-40 minutes
- If you successfully completed the homework assignments, the questions should be easy
- Liberal partial credit applied (especially when you're asked to write code)

# Major topics

- Loops and dataflow analysis
  - While loops & typechecking of loops
  - Cyclic control flow graphs and challenges of liveness analysis
  - Fixpoint-based dataflow analysis
- Heap allocation
  - Tuples
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
  - Lifting lambdas to top-level functions
  - Closure conversion
- Dynamic typing
  - Definitions
  - "Any" type and typechecking
  - Inject / project
  - Representation (tagging)
  - Runtime checks & generating x86
- Objects
  - Method tables
  - Representation with tuples
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

## Cyclic Control Flow Graphs

Consider the following pseudo-x86 program with 4 basic blocks.

    start:
      movq $0, x
      jmp label_1
    label_1:
      cmpq $10, x
      jl label_2
      jmp label_3
    label_2:
      addq $1, x
      jmp label_1
    label_3:
      jmp conclusion
    
1. Draw the control flow graph for this program (without
   instructions - only labels required).

2. In what order should liveness analysis be performed on the basic
   blocks of this program?

3. Perform the liveness analysis for this program, filling in the
   live-after sets for each instruction and the live-before sets for
   each basic block.

## Heap allocation

Consider the following program:

    x = (5, 6)
    y = (x, 5, x)
    z = (x, y)

1. Assuming registers are *not* used, which variables will be placed on the stack, and which variables will be placed on the root stack?

2. Draw the tags for the tuples `x`, `y`, and `z`.

3. Draw the root stack and heap after this program runs, assuming the initial heap size is large enough that no garbage collection is needed.

Consider the following heap state (root stack and from-space):

![](heap-diagram1.png)

4. Complete the diagram by filling the to-space with the new state of the heap *after* garbage collection. Assume Cheney's algorithm for copying collection.

## Functions


Consider the following x86 program.

```
add1_main:
  pushq %rbp
  movq %rsp, %rbp
  pushq %rbx
  pushq %r12
  pushq %r13
  pushq %r14
  subq $0, %rsp

  jmp add1_start
add1_start:
  movq %rdi, %r12
  movq %r12, %r12
  addq $1, %r12
  movq %r12, %rax
  jmp add1_conclusion
add1_conclusion:
  addq $0, %rsp
  popq %r14
  popq %r13
  popq %r12
  popq %rbx
  popq %rbp
  retq

  .globl main
main:
  pushq %rbp
  movq %rsp, %rbp
  pushq %rbx
  pushq %r12
  pushq %r13
  pushq %r14
  subq $0, %rsp
  movq $16384, %rdi
  movq $16, %rsi
  callq initialize
  movq rootstack_begin(%rip), %r15

  jmp main_start
main_start:
  movq $5, %rdi
  callq add1_main
  movq %rax, %r12
  movq %r12, %rdi
  callq print_int
  jmp main_conclusion
main_conclusion:
  movq $0, %rax
  addq $0, %rsp
  popq %r14
  popq %r13
  popq %r12
  popq %rbx
  popq %rbp
  retq
```

7. Write the original Python program for which this x86 program is (roughly) the output of our compiler.


## Anonymous functions (lambda)

8. What are the free variables of the lambda expression `lambda x: -> x + y`?

Consider the following program:

```
y = 10
f = lambda x: y
y = 20
print(f(5))
```

9. What value is printed under *dynamic scope*?

10. What value is printed program under *lexical scope*?

11. Perform closure conversion to transform this program into a Lfun program (you may omit type annotations). Your transformed code should implement lexical scope.

## Dynamic typing

Consider the following program:

```
if True:
  x = 1 + 2
else:
  x = False + 3
```

12. Does this program have a *static* type, according to our typechecker?

13. Does running this program result in a *run-time* type error?

14. Convert this program to one which has a static type, according to the Lany typechecker. Use `inject` and `project`.


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

