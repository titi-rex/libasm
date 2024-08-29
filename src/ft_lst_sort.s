GLOBAL  ft_list_sort

SECTION .text

; rdi: head ptr of list
; rsi: ptr to cmp func
ft_list_sort:
        push    rbp
        mov     rbp, rsp
        push    r14
        push    r15
        sub     rsp, 0x10

        test    rdi, rdi                ; test if head is NULL
        jz      .end
        test    rsi, rsi                ; test if cmp is NULL
        jz      .end

        ; save head and cmp
        mov     [rbp - 0x8], rdi
        mov     [rbp - 0x10], rsi

        mov     r14, [rdi]               ; r14 = current
        cmp     r14, QWORD 0x0           ; test if current == NULL
        jz      .end

.loop:
        ; while stop condition
        mov     r15, [r14 + 0x8]          ; r15 = current->next
        cmp     r15, QWORD 0x0           ; test if next == NULL
        jz      .end

        ; test if cmp(current->data, next->data) != 0
        mov     rdi, [r14]           ; mov current->data in rdi
        mov     rsi, [r15]           ; mov next->data in rsi
        call    [rbp - 0x10]        ; call cmp func
        test    rax, rax            ; test if cmp return 0
        jle     .adv

        ; swap 
        mov     r10, [r14]           ; r10 = current->data
        mov     r11, [r15]           ; r11 = next->data
        mov     [r14], r11           ; current->data = r11
        mov     [r15], r10           ; next->data = r10

        mov     rdi, [rbp - 0x8]     ; reset head
        mov     r15, [rdi]

.adv:
        ; advance 
        mov     r14, r15
        jmp     .loop

.end:
        add     rsp, 0x10
        pop     r15
        pop     r14
        leave
        ret