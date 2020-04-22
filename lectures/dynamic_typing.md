# Dynamic Typing

## What is dynamic typing?

You can write this program in Python:

    def test(i):
        if i == 5:
            return 42
        else:
            return "hello"

The output type of the function is unknown at compile time - it's
dependent on what happens at runtime!

This means bad stuff can happen:

    5 + test(x)

This program returns 47 if `x = 5`, but throws a **run-time error** if `x = 6`.

In a dynamically-typed system like Python, there are 3 options for mixing types like this:

1. **Overload** operators to work over many types
2. Give **run-time** type errors
3. Segfault


## Strong vs weak vs static vs dynamic

There are several concepts in type systems that are often confused:

- A **strongly typed** language doesn't let you interpret something of type **A** as something of type **B** (i.e. interpret number as string; interpret number as memory address)
- A **weakly typed** language does let you do this (i.e. segfaults are your fault!)
- A **statically typed** language gives type errors at compile time, and guarantees that type errors never occur at run time
- A **dynamically typed** language may give type errors at run time

So there's a multi-axis spectrum:

                | Weak          | Strong        |
        --------+---------------+---------------+
        Static  | Pascal        | OCaml [*]     |
                | C             | Haskell       |
                | C++           |               |
        --------+---------------+---------------+
        Dynamic |               | CommonLisp    |
                | Perl          | Python        |
                |               | SmallTalk     |

Why is Perl weakly typed? You can do things like:

    "1" + 2

But it's debatable whether this is *really* weakly typed. 

In C, you can say:

    char c = 'h';
    int x = (int)c;

A *cast* of this form literally *reinterprets the bits in memory* as a
different type of thing. Why is "false" 0 and "true" 1? **BY
ACCIDENT**: it happens that we represent booleans that way in bits in
memory.

Any language with explicit casts should make you extra nervous about
this.

C lets you cast integers to pointers, so you can reference
*any* memory you want to!

      int *p = x;
      *p = 5;

This will segfault. C doesn't care that reinterpreting bits as
something else might break things - making sure that doesn't happen is
the programmer's job.

Strongly typed languages guarantee that you *never* reinterpret bits
of one type as another type. C is *not* strongly typed.

In Python, you can create an object and get its address in
memory with `id`:

    class MyClass:
        x = 5
    x = MyClass()
    print(id(x))

But there's no way to use that address for anything other than
referencing the object. Python is strongly typed.

The key point to remember: static/dynamic vs strong/weak are **orthogonal** concepts.

## R6, R7, and Any

R6 introduces a type called "Any". 

Any is a **tagged union** or **sum type**. It can hold the other types
in R5, but only one at a time, and it always maintains a tag at
runtime to say what the type inside is.

One solution is to add the "Any" type to our language, then we can
write functions like:

    lambda (x: Any) -> x

This function works for integers, booleans, or any other type. The R6
language is exactly R5, plus the `Any` type.

R7 is a language with *no* type annotations - it's a dynamically typed
language, like Python. The function above is written as:

    lambda (x) -> x

Again, this function works for any input type.

### Compiling R7 to R6

Our strategy for compiling R7 is to compile it to R6 by inserting type
annotations. The rule of thumb is: *anywhere a type annotation is
required, just put `Any`*:

    lambda (x) -> x

turns into:

    lambda (x: Any) -> x

This means that *every* type annotation in the resulting R6 program is
`Any`.

### Compiling R6

Now we need to compile R6 into R5. The rule of thumb is: *we will tag
values of type `Any` at runtime, and recover static type information
by adding dynamic checks of the tags.* For example, `Plus` expressions
require their arguments to be integers. We will modify `Plus`
expressions to first check (at runtime) that the two arguments are
integers (by looking at their tags), then perform the addition, and
then tag the result as an integer. We'll have two new forms for this:

- `project e t` does a runtime check to verify that `e`'s tag says
  that `e` has type `t`, and then returns an *untagged* value of type
  `t`
  
- `inject e t` requires that `e` has static type `t`, and returns a
  *tagged* value with static type `Any` and a tag for type `t`

For example, `PlusE e1 e2` would compile to:

    InjectE (PlusE (ProjectE e1 IntT)
                   (ProjectE e2 IntT))
            IntT

So our modified plus expressions first check (at runtime) that their
arguments are integers, remove the tags, do the addition, and add the
integer tag back to the result.

### Tags

We'll use the bottom 3 bits of a 64-bit value to hold the tag. The
tags are:

    Integer  → 001 = 1
    Vector   → 010 = 2
    Function → 011 = 3
    Boolean  → 100 = 4
    Void     → 101 = 5

Integers get shifted left 3 bits, so we only have 61 bits left (our
integers get smaller). Everything else is fine - booleans & void are
small anyway, and vectors and functions are pointers - and our
pointers are 8-byte aligned, so the bottom 3 bits are always 000
anyway!

