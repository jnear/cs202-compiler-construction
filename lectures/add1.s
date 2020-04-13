        // To call a function: callq
        
        // Each function gets its own stack frame
        
        // Parameter passing registers: rdi, rsi, rdx, rcx, r8, r9
        // Return value register: rax

        // Functions must save callee-saved registers
        // Callee-saved registers: rbx, r12, r13, r14
        
        // To save a function pointer: leaq
        // let f = add
        // in f(20, 22)

        .globl _main
_main:
        pushq %rbp
        movq %rsp, %rbp

        movq $20, %rdi
        movq $22, %rsi
        leaq _add(%rip), %r10
        callq *%r10

        movq %rax, %rdi
        callq _print_int

        popq %rbp
        retq

_add1:
        pushq %rbp
        movq %rsp, %rbp

        pushq %rbx
        pushq %r12
        pushq %r13
        pushq %r14

        movq %rdi, %rax
        addq $1, %rax

        popq %r14
        popq %r13
        popq %r12
        popq %rbx

        popq %rbp

        retq

_add:
        pushq %rbp
        movq %rsp, %rbp

        pushq %rbx
        pushq %r12
        pushq %r13
        pushq %r14

        movq %rdi, %rax
        addq %rsi, %rax

        popq %r14
        popq %r13
        popq %r12
        popq %rbx

        popq %rbp

        retq

