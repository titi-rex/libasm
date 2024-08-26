GLOBAL  ft_strcmp

SECTION .text



ft_strcmp:
        xor     rax, rax
        xor     rbx, rbx
 
        dec rdi
        dec rsi

.loop:
        inc     rdi
        inc     rsi
        mov     al, BYTE[rdi]

        test    al, al          ; test *a, '\0'
        jz      .end            ; if *a == '\0' goto .end

        cmp     al, BYTE[rsi]   ; test *a, *b
        jz      .loop           ; if *a == *b goto .loop

 
.end:
        mov     bl, BYTE[rsi]
        sub     rax, rbx
        ret
 
 