GLOBAL  ft_list_sort

SECTION .text

; rdi: head ptr of list
; rsi: ptr to cmp func
ft_list_sort:
        ; test if head is NULL
        test    rdi, rdi
        jz      .end

       ; test if *head is NULL
        cmp    QWORD [rdi], QWORD 0x0
        jz      .end

        ; test if cmp is NULL
        test    rsi, rsi
        jz      .end

        ; get *head in rbx for storing current pos in list
        mov     rbx, [rdi] 

        ; push    rbp
        ; mov     rbp, rsp
        ; save head and cmp
        sub     rsp, 0x10
        mov     [rbp - 0x8], rdi
        mov     [rbp - 0x10], rsi
        mov     rax, rsi
        mov     rax, QWORD [rbp - 0x10]
        jmp     .isend

.loop:
        mov     rdi, [rbx]          ; mov current->data in rdi
        mov     rsi, [rbx + 0x8]    ; mov current->next in rsi
        mov     rsi, [rsi]          ; mov current->next->data in rsi
        mov     rax, QWORD [rbp - 0x10]
        push    rbx
        call    rax        ; call cmp func
        pop     rbx
        test    rax, rax            ; test if cmp return 0
        jnz     .rec

.recout:
        mov     rbx, [rbx + 0x8]    ; current = current->next

.isend: 
        cmp     QWORD [rbx + 0x8], QWORD 0x0
        jne     .loop

.rec:
        ; swap current->data and current->next->data
; rdi = rbx
; rbx + 0x0 = [rbx + 0x8]
; rbx + 0x8 = rdi
        mov     rdi, [rbx]
        mov     rbx, [rbx + 0x8]
        mov     [rbx + 0x8], rdi


        ; mov     rsi, [rbx + 0x8]
        ; mov     rsi, [rsi]
        ; mov     [rbx], rsi
        ; mov     [rbx + 0x8], rdi

        mov     rdi, [rbp - 0x8]
        mov     rsi, [rbp - 0x10]
        push    rbx
        call    ft_list_sort
        pop     rbx
        jmp     .recout

.end:
        add     rsp, 0x10
        leave
        ret