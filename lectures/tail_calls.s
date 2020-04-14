f:
        pushq %rbp
        movq %rsp, %rbp

        // No tail-call optimization:
        //  just callq
        //  segfaults because stack space runs out!
        callq f
        
        popq %rbp
        retq

f_tail:
        pushq %rbp
        movq %rsp, %rbp

        // Tail-call optimization:
        //  1. pop the *current* stack frame
        //  2. jmp instead of callq

        popq %rbp
        jmp f_tail

        .globl main
main:
        pushq %rbp
        movq %rsp, %rbp

        callq f_tail

        popq %rbp
        retq
