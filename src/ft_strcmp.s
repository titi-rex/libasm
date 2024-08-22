GLOBAL  ft_strcmp

SECTION .text

ft_strcmp:
    xor     rax, rax
    xor     rcx, rcx


.loop:
        mov     al, [rdi]
        mov     cl, [rsi]
        ; sub     al, [rsi]
        cmp     al, BYTE[rsi]
        ; je      .end
        ; cmp     al, 0
        jne     .end
        test     al, al
        jz      .end
        inc     rdi
        inc     rsi
        je     .loop


.end:
        sub     rax, rcx
        ret

