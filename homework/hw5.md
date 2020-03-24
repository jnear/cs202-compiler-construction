# Assignment 5

**Solve the exercise(s) by modifying the `Compiler.hs` file in the `a5`
directory of the [assignments
repository](https://github.com/jnear/cs202-assignments) and submit
your `Compiler.hs` file on the course Blackboard under "Assignment
5".**

**Due: Monday, April 6, 11:59pm**


Extend your compiler from Assignment 4 to compile the R3 language, as
outlined in Chapter 5 of the text.

You will need to add the pass `expose-allocate`, and update other
passes.

You do *not* need to implement the garbage collector; an
implementation is provided for you in `runtime.c`. Your solution
should compile to code that calls the collector defined there, and
works properly with that implementation.

**Challenge exercise**: No challenge exercise for this assignment.

## Online Compiler

[An online compiler for this assignment is available
here](http://jnear.w3.uvm.edu/cs202/compiler-a5.php).
