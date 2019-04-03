# Assignment 6

**Solve the exercises in a single Racket source file named
  `compiler-A6.rkt`, and submit your solution in a ZIP file (as
  specified in the [support code GitHub
  repository](https://github.com/jnear/compiler-construction-assignments))
  on the course Blackboard under "Assignment 6".**

**Due: Monday, Apr 15, 11:59pm**

Extend your compiler from Assignment 5 to compile the R3 language, as
outlined in Chapter 5 of the text.

You will need to add the pass `expose-allocate`, and modify:

- The typechecker
- `explicate-control`
- `uncover-locals`
- `select-instructions`
- `allocate-registers`
- `print-x86`

You do *not* need to implement the garbage collector; an
implementation is provided for you in `runtime.c`. Your solution
should compile to code that calls the collector defined there, and
works properly with that implementation.

**Challenge exercise**: No challenge exercise for this assignment.
