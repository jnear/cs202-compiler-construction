# Assignment 7

**Implement a compiler for the `Lfun` language with functions by
modifying the `compiler.py` file in the `a7` directory of the
[assignments repository](https://github.com/jnear/cs202-assignments)
and submit your `compiler.py` file on the course Blackboard under
"Assignment 7".**

**Due: Monday, Apr 24, 11:59pm**

Complete `compiler.py` so that it implements a compiler from the
`Lfun` language to x86 assembly. A grammar for the required subset
appears below.

**Concrete Syntax:**
```
expr   ::= x | n | expr + expr | expr - expr | expr * expr | expr && expr | expr || expr
         | expr == expr | expr > expr | expr < expr | expr >= expr | expr <= expr
         | expr[n] | (expr, ..., expr)
         | expr(expr, ..., expr)
stmt   ::= x = expr | print(expr) | if expr: stmt+ else: stmt+ | while expr: stmt+
         | def name(x: t, ..., x: t) -> t: stmt+
LFun   ::= stmt*
```

**Abstract Syntax:**
```
op     ::= "add" | "sub" | "mult" | "not" | "or" | "and" | "eq" | "gt" | "gte" | "lt" | "lte"
         | "subscript" "tuple"
Expr   ::= Var(x) | Constant(n) | Prim(op, List[Expr]) 
         | Call(Expr, List[Expr])
Stmt   ::= Assign(x, Expr) | Print(Expr) | If(Expr, Stmts, Stmts) | While(Expr, Stmts)
         | FunctionDef(name, List[Tuple[x, t]], Stmts, t)
Stmts  ::= List[Stmt]
LFun   ::= Program(Stmts)
```

An online compiler for this assignment is available
[here](http://jnear.w3.uvm.edu/cs202/compiler-a7.php).

**Challenge Exercise:**

No challenge exercise this time.
