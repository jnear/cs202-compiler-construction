# Assignment 2

**Solve the exercise(s) by modifying the `compiler.py` file in the `a2`
directory of the [assignments
repository](https://github.com/jnear/cs202-assignments) and submit
your `compiler.py` file on the course Blackboard under "Assignment
2".**

**Due: Monday, Feb 22, 11:59pm**

Complete `compiler.py` so that it implements a compiler from a subset
of the RVar language to x86 assembly. The required subset is defined by
the grammar below (and by the AST definition in the assignments repo).
   
```
RVarExp ::= <int>
       |  <variable>
       |  RVarExp + RVarExp
       |  let <variable> = RVarExp in RVarExp
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

- Exercise 1
- Exercise 3
- Exercise 4
- Exercise 5
- Exercise 6
- Exercise 7

## Challenge Exercise

Implement a partial evaluator for the RVar language. This challenge
exercise corresponds to Exercise 9 on page 41 of the textbook.

Optionally, extend your partial evaluator by completing Exercise 10.

**Note**: if you are an undergraduate student, and you solve the
challenge exercise for extra credit, please note this in a comment at
the top of your file.

## Online Compiler

[An online compiler for this assignment is available
here](http://jnear.w3.uvm.edu/cs202/compiler-a2.php).
