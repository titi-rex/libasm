GLOBAL  ft_write

EXTERN  __errno_location

SECTION .text

ft_write:
        mov     rax, 1
        syscall
        cmp     rax, 0
        jl      .error
        ret

.error:
        mov     rdi, rax
        call    __errno_location WRT ..plt
        neg     rdi
        mov     [rax], rdi
        mov     rax, -1
        ret
