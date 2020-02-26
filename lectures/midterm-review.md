# Midterm Review (Spring 2020)

# Format

- Open notes: bring as much printed material as you want
- Closed computers / phones / everything else
- If you're asked to write in a language, I will give you the grammar
- I *won't* give you compiler passes, evaluators, etc.
- Should take only 30-40 minutes
- If you successfully completed the homework assignments, the questions should be easy
- Liberal partial credit applied (especially when you're asked to write code)

# Major topics

- Uniquifying variables
- Flattening expressions
- Translation to C₀ language
- x86₀ programming
- Translation to x86₀
- Passes of the A2 / A3 / A4 compiler
- Stack allocation
- Register allocation
  - Liveness analysis
  - Interference graph
  - Allocation by graph coloring
- Typechecking
- Building and using control flow graphs

# Sample Questions

## Uniquifying variables

For each of the following expressions, replace each variable with a
  "uniquified" version, e.g. `x` ⇒ `x1`.


    let x = 5
    in let y = 6
       in x + y
    
    let x = 5
    in let x = 6
       in x + x
    
    let x = (let x = 7
             in x + 1)
    in let x = 6
       in x + x
    
    let x = 5
    in let x = (let x = 7
                in x + 1)
       in x + x

## Flattening Expressions

Compile the following R₁ program into C₀:

    (let x = 5
     in x + 3) + 7

## x86 / compiler passes / stack allocation

Compile the pseudo-x86 program below into x86, placing all variables
on the stack.


    [ MovqE (RegE "rax") (VarXE "x")
    , MovqE (IntXE 4)    (VarXE "t1")
    , AddqE (IntXE 5)    (VarXE "t1")
    , MovqE (VarXE "t1") (VarXE "t2")
    , AddqE (VarXE "x")  (VarXE "t2")
    , MovqE (VarXE "t2") (RegE "rax) ]

Part (a): for each variable in the program, assign the variable a home
on the stack.

- `x`:
- `t1`:
- `t2`:

Part (b): what is the size (in bytes) of the stack frame for this
program?

Part (c): write down the complete x86 program

## Liveness analysis / interference graph / graph coloring

Consider this program:

    let x = 5
    in let y = 6
    in x + y + y

Compiled into pseudo-x86, the program becomes:

    [ MovqE ( IntXE 5 ) ( VarXE "x1" )
    , MovqE ( IntXE 6 ) ( VarXE "y2" )
    , MovqE ( VarXE "x1" ) ( VarXE "tmp3" )
    , AddqE ( VarXE "y2" ) ( VarXE "tmp3" )
    , MovqE ( VarXE "tmp3" ) ( VarXE "tmp4" )
    , AddqE ( VarXE "y2" ) ( VarXE "tmp4" )
    , MovqE ( VarXE "tmp4" ) ( RegE "rax" )
    , RetqE
    ] 

Annotate the below copy of the program with each instruction's
*live-after* set.

    [ MovqE ( IntXE 5 ) ( VarXE "x1" )          {       }
    , MovqE ( IntXE 6 ) ( VarXE "y2" )          {       }
    , MovqE ( VarXE "x1" ) ( VarXE "tmp3" )     {       }
    , AddqE ( VarXE "y2" ) ( VarXE "tmp3" )     {       }
    , MovqE ( VarXE "tmp3" ) ( VarXE "tmp4" )   {       }
    , AddqE ( VarXE "y2" ) ( VarXE "tmp4" )     {       }
    , MovqE ( VarXE "tmp4" ) ( RegE "rax" )     {       }
    , RetqE
    ] 

Draw the interference graph for this program.

For the following interference graph, assign a register to each
variable using saturation-based graph coloring. You may use the
registers `rbx`, `rcx`, and `rdx`.

- `x1`:
- `y2`:
- `tmp3`:
- `tmp4`:

## Typechecking

For each of the following expressions, write the type of the
expression. If the expression is not well-typed, write "none."


    if 5
    then 1
    else 2
    
    if 1 == 2
    then 2 + 3
    else 5
    
    if 1 == 2
    then 2 + 3
    else True
    
    if False
    then 2 == 3
    else True
    
    let x = 5
    in if x == 5
       then (let y = 6
             in x + y)
       else 6
    
    let x = (let y = 5 + 6
             in y + 7)
    in if False
       then x + 2
       else 3
        
    let x = (let y = 5 + 6
             in y + x)
    in if False
       then x + 2
       else 3
        
    let x = (let y = 5 + 6
             in y + 7)
    in if False
       then x + y
       else 3
    
    
    let x = (if x == 5
             then True
             else False)
    in if x
       then 5 == 6
       else 7
    

## Control Flow Graphs

Consider the following pseudo-x86 program compiled from R2, with 4
basic blocks.

    "start":
            [ CmpqE ( IntXE 6 ) ( IntXE 5 )
            , JmpIfE CCe "label4" 
            , JmpE "label3" 
            ] 
    
    "label3":
            [ MovqE ( IntXE 8 ) ( VarXE "x1" )
            , JmpE "label2" 
            ] 
    
    "label4":
            [ MovqE ( IntXE 7 ) ( VarXE "x1" )
            , JmpE "label2" 
            ] 
    
    "label2":
            [ MovqE ( VarXE "x1" ) ( VarXE "tmp5" )
            , AddqE ( IntXE 10 ) ( VarXE "tmp5" )
            , MovqE ( VarXE "tmp5" ) ( RegE "rax" )
            , RetqE
            ] 
    
1. Draw the control flow graph for this program (without
   instructions - only labels required) (i.e. the "jumps-to graph"
   described in class).

2. In what order should liveness analysis be performed on the basic
   blocks of this program?

3. Perform the liveness analysis for this program, filling in the
   live-after sets for each instruction and the live-before sets for
   each basic block.

Program:

    "start":  LIVE-BEFORE: {               }
            [ CmpqE ( IntXE 6 ) ( IntXE 5 )           {           }
            , JmpIfE CCe "label4"                     {           }
            , JmpE "label3"                           {           }
            ] 
    
    "label3":  LIVE-BEFORE: {               }
            [ MovqE ( IntXE 8 ) ( VarXE "x1" )        {           }
            , JmpE "label2"                           {           }
            ] 
    
    "label4":  LIVE-BEFORE: {               }
            [ MovqE ( IntXE 7 ) ( VarXE "x1" )        {           }
            , JmpE "label2"                           {           }
            ] 
    
    "label2":  LIVE-BEFORE: {               }
            [ MovqE ( VarXE "x1" ) ( VarXE "tmp5" )   {           }
            , AddqE ( IntXE 10 ) ( VarXE "tmp5" )     {           }
            , MovqE ( VarXE "tmp5" ) ( RegE "rax" )   {           }
            , RetqE
            ] 
