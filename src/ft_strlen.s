SECTION .text

GLOBAL  ft_strlen

ft_strlen:
        mov     rax, rdi
        dec     rax

.loop:     
        inc     rax
        cmp     BYTE [rax], 0
        jnz     .loop

        sub     rax, rdi
        ret
