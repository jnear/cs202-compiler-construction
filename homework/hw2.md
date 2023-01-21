# Assignment 2

**Implement a compiler for the `LVar` language by modifying the
`compiler.py` file in the `a2` directory of the [assignments
repository](https://github.com/jnear/cs202-assignments) and submit
your `compiler.py` file on the course Blackboard under "Assignment
2".**

**Due: Monday, Feb 6, 11:59pm**

Complete `compiler.py` so that it implements a compiler from the
`LVar` language to x86 assembly. A grammar for the required subset
appears below.

**Concrete Syntax:**
```
expr ::= x | n | expr + expr
stmt ::= x = expr | print(expr)
LVar ::= stmt*
```

**Abstract Syntax:**
```
op ::= "add"
Expr ::= Var(x) | Constant(n) | Prim(op, [Expr])
Stmt ::= Assign(x, Expr) | Print(Expr)
LVar ::= Program([Stmt])
```

An online compiler for this assignment is available
[here](http://jnear.w3.uvm.edu/cs202/compiler-a2.php).
