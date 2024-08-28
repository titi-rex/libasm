GLOBAL  ft_list_push_front

EXTERN  malloc

SECTION .text

; rdi: address of head ptr
; rsi: address of data
ft_list_push_front:
        push    rdi                 ; push head
        push    rsi                 ; push &data

        ; create a new node and assign &data to his `data` member
        mov     rdi, 16           ; ask 0x10 == 16 byte for malloc (size of 2 address)
        call    malloc WRT ..plt    ; call malloc, we'll have back 16 byte of memory, for 2 storing address
        test    rax, rax            ; test if malloc retunr NULL
        jz      .end
        pop     QWORD [rax]         ; pop &data in first address emplacement (`data` member) from memory allocated by malloc
        mov     QWORD [rax + 0x8], 0x0    ; set to NULL second address emplacment (`next` member)

        ; put the new node in front of the list, ie assign *head to his `next` member and assign to head his address 
        pop     rdi                 ; pop head
        mov     rsi , [rdi]         ; assign & of actual first node to rsi (rsi is tmp var here)
        mov     [rax + 0x8], rsi    ; set address pointed by head in second address emplacment (`next` member)
        mov     [rdi], rax            ; set head to point to the new node

.end:
        ret
