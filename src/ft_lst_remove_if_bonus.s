GLOBAL  ft_list_remove_if

EXTERN  free

SECTION .text

ft_list_remove_if:
        push    rbp
        mov     rbp, rsp
        push    r12
        push    r13
        sub     rsp, 0x20
        mov     [rbp - 0x8], rdi        ; **begin_list
        mov     [rbp - 0x10], rsi       ; *data_ref
        mov     [rbp - 0x18], rdx       ; *cmp
        mov     [rbp - 0x20], rcx       ; *free_fct

        mov     r12, [rdi]              ; head = *begin_list
        xor     r13, r13                ; current == NULL

.loop_parent:
        cmp     r12, QWORD 0x0          ; head == NULL -> ret
        jz      .end

        ; test if node should be deleted
        mov     rdi, [r12]
        mov     rsi, [rbp - 0x10]
        call    [rbp - 0x18]            ; call cmp
        test    rax, rax                ; if camp return 0 -> delete node
        jnz     .loop_node              ; else we found head -> go to next loop

        ; extract &node to delete and reform list
        mov     r15, r12                ; r15 = & of node to delete
        mov     r12, [r12 + 0x8]        ; head = head->next
        mov     rcx, [rbp - 0x8]        ; get begin_list
        mov     [rcx], r12              ; *begin_list = head

        ; delete node
        mov     rdi, [r15]
        call    [rbp - 0x20]            ; call free_fct to destroy node data
        mov     rdi, r15
        call    free WRT ..plt          ; call free to destroy node

        jmp     .loop_parent

                ; from now head is called parent
.inc_parent:
        mov     r12, r13                ; parent = current (old current)

.loop_node:
        mov     r13, [r12 + 0x8]        ; current = parent->next
        cmp     r13, QWORD 0x0
        jz      .end

        ; test if node should be deleted
        mov     rdi, [r13]
        mov     rsi, [rbp - 0x10]
        call    [rbp - 0x18]            ; call cmp
        test    rax, rax                ; if cmp return 0, destroy the node
        jnz     .inc_parent             ; else advance on the list

        ; extract &node to delete and reform list
        mov     r15, [r13 + 0x8]        ; link parent and next node
        mov     [r12 + 0x8], r15        ; parent->next = current->next 

        ; delete node
        mov     rdi, [r13]
        call    [rbp - 0x20]            ; call free_fct
        mov     rdi, r13
        call    free WRT ..plt          ; call free

        jmp     .loop_node


.end:
        add     rsp, 0x20
        pop     r13
        pop     r12
        leave
        ret