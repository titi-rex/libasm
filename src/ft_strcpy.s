GLOBAL  ft_strcpy

SECTION .text

ft_strcpy:
        mov     rax, rdi
        dec     rdi
        dec     rsi

.loop:  
        inc     rdi
        inc     rsi
        mov     dl, [rsi]
        mov     [rdi], dl
        cmp     BYTE [rsi], 0
        jnz     .loop

        ret
