GLOBAL  ft_list_size

SECTION .text

ft_list_size:
        xor     rax, rax
        jmp     .isend

.loop:
        inc     rax
        mov     rdi, [rdi + 0x8]

.isend:
        cmp     rdi, 0x0
        jnz     .loop
        ret
