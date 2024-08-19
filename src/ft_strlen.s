GLOBAL  ft_strlen

SECTION .text

ft_strlen:
            mov     rax, rdi
            cmp     BYTE [rax], 0
            je      .end

.loop:      inc     rax
            cmp     BYTE [rax], 0
            jne     .loop

.end:       sub rax,rdi
            ret
