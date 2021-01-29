# Assignment 4

**Solve the exercise(s) by modifying the `Compiler.hs` file in the `a4`
directory of the [assignments
repository](https://github.com/jnear/cs202-assignments) and submit
your `Compiler.hs` file on the course Blackboard under "Assignment
4".**

**Due: Monday, March 9, 11:59pm**

Extend your compiler from Assignment 3 to compile the R2 language.

The following exercise descriptions describe the required changes:

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

## Online Compiler

[An online compiler for this assignment is available
here](http://jnear.w3.uvm.edu/cs202/compiler-a4.php).
