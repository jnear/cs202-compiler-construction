# Assignment 3

**Implement a compiler for the `Lvar` language that performs register
allocation by modifying the `compiler.py` file in the `a3` directory
of the [assignments
repository](https://github.com/jnear/cs202-assignments) and submit
your `compiler.py` file on the course Blackboard under "Assignment
3".**

**Due: Monday, Feb 28, 11:59pm**

Complete `compiler.py` so that it implements a compiler from the
`Lvar` language to x86 assembly. Your compiler should implement a
graph-coloring-based register allocator as described in Chapter 3 of
the textbook.

## Challenge Exercise

Complete **Exercise 16** in the textbook (Section 3.7): implement
*move biasing* in your register allocator.

## Online Compiler

[An online compiler for this assignment is available
here](http://jnear.w3.uvm.edu/cs202/compiler-a3.php).
