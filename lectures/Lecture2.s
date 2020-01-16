// Simple assembly program from Lecture 2

        .globl _main
_main:
        pushq %rbp
        movq $5, %r8
        addq $6, %r8
        movq $8, %r9
        addq $10, %r9
        movq %r8, %rdi
        addq %r9, %rdi
        callq _print_int
        popq %rbp
        retq
