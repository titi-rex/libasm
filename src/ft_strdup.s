GLOBAL  ft_strdup

EXTERN ft_strlen
EXTERN ft_strcpy
EXTERN malloc

SECTION .text

ft_strdup:
        push    rdi
        call    ft_strlen
        inc     rax
        mov     rdi, rax
        call    malloc WRT ..plt
        test    rax, rax
        jz      .end
        mov     rdi, rax
        pop     rsi
        call    ft_strcpy

.end:
        ret
