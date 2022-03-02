# Midterm Review (Spring 2022)

# Format

- Open notes: bring as much printed material as you want
- Closed computers / phones / everything else
- You'll be expected to be familiar with:
  - Languages (and IRs) used in our compilers
  - Compiler passes in our assignments
- Should take only 30-40 minutes
- If you successfully completed the homework assignments, the questions should be easy
- Liberal partial credit applied (especially when you're asked to write code)

# Major topics

- Atomicity & removing complex operands (Remove-complex-opera*)
- x86 programming
- Translation to x86 (Select-instructions)
- Passes of the A2 / A3 compiler
- Stack allocation
- Register allocation
  - Liveness analysis
  - Interference graph
  - Allocation by graph coloring
- Typechecking

# Sample Questions

## Compiler Passes

For each of the following passes, what is its purpose? What property
is true of its output?

- `remove-complex-opera`
- `select-instructions`
- `assign-homes` (A2)
- `uncover-live` (A3)
- `build-interference` (A3)
- `allocate-registers` (A3)
- `patch-instructions`
- `print-x86`

## Removing Complex Operands

Which of the following are atomic expressions?

    1
    True
    5 + 6

Perform the remove-complex-opera* pass on this program:

    x = 5 + 6
    y = x + 7 + 8
    print(x + y)

## x86 / compiler passes / stack allocation

Compile the pseudo-x86 program below into x86, placing all variables
on the stack.

    movq $1, x
    movq $4, tmp_1
    addq $5, tmp_1
    movq tmp_1, tmp_2
    addq x, tmp_2
    movq tmp_2, %rdi
    callq print_int


Part (a): for each variable in the program, assign the variable a home
on the stack.

- `x`:
- `tmp_1`:
- `tmp_2`:

Part (b): what is the size (in bytes) of the stack frame for this
program?

Part (c): write down the complete x86 program

## Liveness analysis / interference graph / graph coloring

Consider this pseudo-x86 program (same as above). Annotate each
instruction with its *live-after set*.

    movq $1, x          {            }
    movq $4, tmp_1      {            }
    addq $5, tmp_1      {            }
    movq tmp_1, tmp_2   {            }
    addq x, tmp_2       {            }
    movq tmp_2, %rdi    {            }
    callq print_int     {            }

Draw the interference graph for this program.

For the following interference graph, assign a register to each
variable using saturation-based graph coloring. You may use **only**
the registers `rbx` and `rcx`.

- `x`:
- `tmp_1`:
- `tmp_2`:

## Typechecking

For each of the following programs, determine whether or not the
program is *well-typed*. If it is not well-typed, circle the part of
the program containing a type error.

    x = 5
    print(x)
    
    x = 5
    x = 6
    print(x)
    
    x = 5
    x = True
    print(x)
    
    x = 5 + True
    print(x)
    
    if 5 == 6:
        x = 5
    else:
        x = True

