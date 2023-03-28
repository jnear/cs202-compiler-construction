# Assignment 6

**Implement a compiler for the `Ltup` language with heap-allocated
tuples by modifying the `compiler.py` file in the `a6` directory of
the [assignments
repository](https://github.com/jnear/cs202-assignments) and submit
your `compiler.py` file on the course Blackboard under "Assignment
6".**

**Due: Monday, Apr 10, 11:59pm**

Complete `compiler.py` so that it implements a compiler from the
`Ltup` language to x86 assembly. A grammar for the required subset
appears below.

**Concrete Syntax:**
```
expr   ::= x | n | expr + expr | expr - expr | expr * expr | expr && expr | expr || expr
         | expr == expr | expr > expr | expr < expr | expr >= expr | expr <= expr
         | expr[n] | (expr, ..., expr)
stmt   ::= x = expr | print(expr) | if expr: stmt+ else: stmt+ | while expr: stmt+
LWhile ::= stmt*
```

**Abstract Syntax:**
```
op     ::= "add" | "sub" | "mult" | "not" | "or" | "and" | "eq" | "gt" | "gte" | "lt" | "lte"
         | "subscript" "tuple"
Expr   ::= Var(x) | Constant(n) | Prim(op, List[Expr])
Stmt   ::= Assign(x, Expr) | Print(Expr) | If(Expr, Stmts, Stmts) | While(Expr, Stmts)
Stmts  ::= List[Stmt]
LWhile ::= Program(Stmts)
```

An online compiler for this assignment is available
[here](http://jnear.w3.uvm.edu/cs202/compiler-a6.php).

**Challenge Exercise:**

No challenge exercise this time.
