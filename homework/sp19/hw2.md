# Assignment 2

**Solve the exercises in a single Racket source file named
  `compiler-A2.rkt`, and submit your solution in a ZIP file (as
  specified in the [support code GitHub
  repository](https://github.com/jnear/compiler-construction-assignments))
  on the course Blackboard under "Assignment 2".**

**Due: Monday, Feb 11, 11:59pm**

Solve the following exercises from the course textbook:

- Exercise 2 (page 29)
- Exercise 3 (page 29)
- Exercise 4 (page 31)
- Exercise 5 (page 33)
- Exercise 6 (page 34)

Your solution may assume that enough registers are available to hold
all variables, and your solution does not need to use the stack. You
will not need to implement the `patch-instructions` pass or deal with
stack frames for this assignment.

**Challenge exercise**: Modify your solution to the exercises above to
  make register allocation slightly more intelligent. Your modified
  solution should always place the result of the last instruction in
  the register `%rax`, so that your code never needs an extra `movq`
  instruction at the end. For example, your solution should never
  produce code like this:

```
   addq  %rax , %r8
   addq  $10  , %r8
   movq  %r8  , %rax 
   retq
```

Instead, you should produce code like this (eliminating the final
`movq`):

```
   addq  %r8 , %rax
   addq  $10 , %rax
   retq
```

**Note**: if you are an undergraduate student, and you solve the
  challenge exercise for extra credit, please note this in a comment
  at the top of your file.
