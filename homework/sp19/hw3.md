# Assignment 3

**Solve the exercises in a single Racket source file named
  `compiler-A3.rkt`, and submit your solution in a ZIP file (as
  specified in the [support code GitHub
  repository](https://github.com/jnear/compiler-construction-assignments))
  on the course Blackboard under "Assignment 3".**

**Due: Monday, Feb 18, 11:59pm**

Extend your compiler from Assignment 2 to store all variables on the
stack. Your new compiler should handle the same source language as
Assignment 2, but should work for programs with more variables than
available registers.

In addition to the exercises you solved in Assignment 2, you will need
to solve:

- Exercise 6
- Exercise 7

**Challenge exercise**: Implement a random expression generator that
  generates correct expressions, and write a function called
  `random-test` which generates 100 test cases and tests that your
  compiler generates correct solutions for them. Your solution can
  avoid generating programs with the `(read)` expression, since
  testing these is a bit trickier.

**Note**: if you are an undergraduate student, and you solve the
  challenge exercise for extra credit, please note this in a comment
  at the top of your file.
