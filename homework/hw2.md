# Assignment 2

**Solve the exercise(s) by modifying the `Compiler.hs` file in the `a2`
directory of the [assignments
repository](https://github.com/jnear/cs202-assignments) and submit
your `Compiler.hs` file on the course Blackboard under "Assignment
2".**

**Due: Monday, Feb 10, 11:59pm**

Complete `Compiler.hs` so that it implements a compiler from a subset
of the R1 language to x86 assembly. The required subset is defined by
the grammar below.
   
```
R1Exp ::= <int>
       |  <variable>
       |  R1Exp + R1Exp
       |  let <variable> = R1Exp in R1Exp
```

You will need to complete the definitions of the following passes:

- uniquify
- remove-complex-opera
- explicate-control
- select-instructions
- assign-homes
- patch-instructions

This assignment corresponds roughly to the following exercises in the
textbook:

- Exercise 2 (page 29)
- Exercise 3 (page 29)
- Exercise 4 (page 31)
- Exercise 5 (page 33)
- Exercise 6 (page 34)
- Exercise 7 (page 35)

## Challenge Exercise

Implement a random expression generator that generates correct
expressions. Write a function called `randomTest` which generates 100
test cases and tests that your compiler generates correct solutions
for them.

**Note**: if you are an undergraduate student, and you solve the
challenge exercise for extra credit, please note this in a comment at
the top of your file.

## Online Compiler

[An online compiler for this assignment is available
here](http://jnear.w3.uvm.edu/cs202/compiler-a2.php).
