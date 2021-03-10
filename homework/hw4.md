# Assignment 4

**Solve the exercise(s) by modifying the `compiler.py` file in the `a4`
directory of the [assignments
repository](https://github.com/jnear/cs202-assignments) and submit
your `compiler.py` file on the course Blackboard under "Assignment
4".**

**Due: Monday, March 22, 11:59pm**

Extend your compiler from Assignment 3 to compile the RIf language.

**Challenge exercise**: Implement the pass `remove-jumps`, which
removes unnecessary jumps from the program. The pass comes directly
after `select-instructions`. For each block `b₁` in the program, if
*exactly one* other block `b₂` jumps to `b₁`, and this jump is the
last instruction of `b₂` (in many cases, the jump ends up being the
*only* instruction in `b₂`), then `optimize-jumps` removes `b₁` from
the control flow graph, removes the jump from `b₂`, and appends the
instructions from `b₁` to `b₂`. See section 4.13 in the textbook.

**Note**: if you are an undergraduate student, and you solve the
  challenge exercise for extra credit, please note this in a comment
  at the top of your file.

## Online Compiler

[An online compiler for this assignment is available
here](http://jnear.w3.uvm.edu/cs202/compiler-a4.php).
