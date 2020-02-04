


        .globl _main
_main:
        pushq %rbp
        movq %rsp, %rbp
        subq $32, %rsp
        
        movq $54, -8(%rbp)
        movq $55, -16(%rbp)
        movq $56, -24(%rbp)

        movq -16(%rbp), %rax
        addq %rax, -24(%rbp)

        addq -16(%rbp), -24(%rbp)
        
        movq -8(%rbp), %rdi
        callq _print_int

        addq $32, %rsp
        popq %rbp
        retq
