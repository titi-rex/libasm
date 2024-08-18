global _start

SECTION .data

message:    db 'Hello world!', 0x0a
msglenght:  equ $-message

STDOUT:     equ 1

SECTION .text

; write macro
; %1: fd, %2: msg, %3: msglenght
%macro m_write 3 
    mov   rax, 1
    mov   rdi, %1
    mov   rsi, %2
    mov   rdx, %3
    syscall
%endmacro


; exit macro
%macro m_exit 1
    mov rax, 60
    mov rdi, %1
    syscall
%endmacro


_start:

    m_write STDOUT, message, msglenght

    mov rax, rbx
    sub rbx, msglenght
    
    m_exit rbx



;   CALL addresse -> call subroutine
;   PUSH EIP
;   JMP adresse

;   LEAVE -> prep for ret
;   MOV ESP, EBP
;   POP EBP

;   RET -> return
;   POP EIP
