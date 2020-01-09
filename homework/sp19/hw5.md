# Assignment 5

**Solve the exercises in a single Racket source file named
  `compiler-A5.rkt`, and submit your solution in a ZIP file (as
  specified in the [support code GitHub
  repository](https://github.com/jnear/compiler-construction-assignments))
  on the course Blackboard under "Assignment 5".**

**Due: Monday, April 1, 11:59pm**

Extend your compiler from Assignment 4 to compile the R2 language.

In addition to the exercises you solved in Assignment 4, you will need
to solve:

- Exercise 13 (a typechecker for R2)

- Exercise 14 (the `shrink` pass)

- Exercise 15 (updates to `explicate-control`)

- Exercise 16 (updates to `select-instructions`)

- Exercise 17 (updates to register allocation)

- Exercise 18 (updates to `patch-instructions`)

**Challenge exercise**: Implement the pass `optimize-jumps`, which
removes unnecessary jumps from the program. The pass comes directly
after `select-instructions`. For each block `b₁` in the program, if
*exactly one* other block `b₂` jumps to `b₁`, and this jump is the
last instruction of `b₂` (in many cases, the jump ends up being the
*only* instruction in `b₂`), then `optimize-jumps` removes `b₁` from
the control flow graph, removes the jump from `b₂`, and appends the
instructions from `b₁` to `b₂`.

**Note**: if you are an undergraduate student, and you solve the
  challenge exercise for extra credit, please note this in a comment
  at the top of your file.
