# Optimization

How long does a program take to run?

- sum (instr * cycles_of(instr))

So we can make the program faster by reducing the number of
instructions, or using faster instructions.

We've already done some of the biggest optimizations!

- Non-trivial register allocation (use registers instead of memory)
- Register saving via register allocation (i.e. avoid spilling when possible)
- Move biasing to eliminate unneeded moves
- Static typechecking to avoid run-time checks
- Avoid branching when possible

## Local optimizations

These are within a basic block.

- Common subexpression elimination
- Constant propagation / constant folding (partial evaluation)

## Intraprocedural global optimizations

These are across block boundaries, but within one function. We've
already done some of these too!

- Liveness analysis & register allocation!
- Constant propagation & folding
- Loop optimization / code motion (move things outside of the loop)
- Loop fusion
- Code hoisting


Example (in Python syntax):

    for i in range(2000):
      x + fib(20)
    ⇓
    tmp = fib(20)
    for i in range(2000):
      x + tmp

Challenges: 

- The thing we're moving might have a side effect!
- The thing we're moving might not terminate! 


## Interprocedural global optimizations

We haven't done much of this. Why not?

You can call a function from **anywhere**. Some other program may even
later link against your binary and call it from their program. So you
can't e.g. move code outside your procedure to the call site, because
you don't know where all the call sites might be!

So how can we do optimization across procedure calls? We *inline* the
procedure. Then we can do all the other optimizations we talked about
earlier.


    def my_const():
      return fib(20)
    
    for x in range(2000):
      x + my_const()
    
    ⇓
    
    def my_const():
      return fib(20)
    
    for x in range(2000):
      x + fib(20)
    
    ⇓
    
    def my_const():
      return fib(20)
    
    tmp = fib(20)
    for x in range(2000):
      x + tmp


## Dead Code Elimination

Once you have constant propagation / folding, dead code elimination
can remove lots of stuff you don't need, like old definitions, which
can also result in better use of registers!

## Leveraging the architecture

The architecture has some properties that are supposed to be
"transparent" to the programmer, but can have a huge effect on the
performance of your code.

- Memory hierarchy: registers, cache, memory (cache is hidden)
- Pipelining and branch prediction: things run in parallel (hidden)

We *definitely* want to keep things in registers. But how do we
leverage the cache?

It depends on the architecture. Generally you want *locality* - a
piece of code touches a small region of memory over and over, so that
this region ends up in the cache and you don't have to hit main memory
often. There are *tons* of domain-specific optimizations for this.

One that can help generally is *loop fission* - splitting one loop
into two (or more). This is totally counterintuitive! But if the loop
body touches two regions of memory, splitting it into two loops can
actually result in *better* performance, due to locality.

To maximize pipelining, we want to minimize jumps. We actually did
some of this in two ways. First, there was a challenge assignment that
removes trivial jumps resulting from conditionals. Second, we designed
`explicate-control-pred` to do some constant propagation and code
hoisting! Recall that:

    (if #f b1 b2)
    ⇓
    b1

And (effectively):

    (if (if e1
            e2
            e3)
        e4
        e5)
    ⇓
    (if e1
        (if e2
            e4
            e5)
        (if e3
            e4
            e5))

In both cases we did slightly better than the naive solution. For the
second one, we could have done:

    (let ([tmp (if e1
                   e2
                   e3)])
      (if tmp
          e4
          e5))

This would have resulted in the use of `set` and `movzbq`
instructions, which we avoided by code hoisting.

Doing a really good job of this kind of thing is *highly* dependent on
architecture, and difficult to reason about.
