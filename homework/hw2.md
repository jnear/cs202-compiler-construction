# Assignment 2

**Implement a compiler for the `Lvar` language by modifying the
`compiler.py` file in the `a2` directory of the [assignments
repository](https://github.com/jnear/cs202-assignments) and submit
your `compiler.py` file on the course Blackboard under "Assignment
2".**

**Due: Monday, Feb 14, 11:59pm**

Complete `compiler.py` so that it implements a compiler from the
`Lvar` language to x86 assembly.

You will need to complete the definitions of the following passes:

- remove-complex-opera
- select-instructions
- assign-homes
- patch-instructions
- print-x86

## Challenge Exercise

Complete **Exercise 8** in the textbook (Section 2.9): add a partial
evaluator as a new pass to the front of your compiler. See Section 1.6
for more information on partial evaluation.

## Online Compiler

[An online compiler for this assignment is available
here](http://jnear.w3.uvm.edu/cs202/compiler-a2.php).
