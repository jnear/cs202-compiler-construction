# Assignment 1

**Implement a compiler for the `Lmin` language by modifying the
`compiler.py` file in the `a1` directory of the [assignments
repository](https://github.com/jnear/cs202-assignments) and submit
your `compiler.py` file on the course Blackboard under "Assignment
1".**

**Due: Monday, Jan 31, 11:59pm**

Complete `compiler.py` so that it implements a compiler from the
`Lmin` language to x86 assembly. The required subset includes programs
that print a single integer, as described by the grammars below.

**Concrete Syntax:**
```
Lmin ::= print(int)
```

**Abstract Syntax:**
```
Lmin ::= Program([Print(Constant(i))])
```

An online compiler for this assignment is available
[here](http://jnear.w3.uvm.edu/cs202/compiler-a1.php).
