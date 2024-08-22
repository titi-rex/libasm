GLOBAL  ft_strcpy

SECTION .text

ft_strcpy:
        mov     rax, rdi

.loop:  mov     dl, [rsi]
        mov     [rdi], dl
        cmp     BYTE [rsi], 0
        je      .end
        inc     rdi
        inc     rsi
        jne     .loop

.end:   ret
