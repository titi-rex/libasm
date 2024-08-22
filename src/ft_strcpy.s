GLOBAL  ft_strcpy

SECTION .text

ft_strcpy:
        mov     rax, rdi

.loop:  mov     [rax], rsi
        cmp     BYTE [rsi], 0
        je      .end
        inc     rax
        inc     rsi
        jne     .loop

.end:   ret
