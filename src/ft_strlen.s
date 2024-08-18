global _start




SECTION .data
greet:      db  "start",0xa
greet_l:    equ $ - greet
end:        db  "end",0xa
end_l:      equ $ - end

string:     db  "bjr je suis un string a tester!.."
expected:   equ $ - string

nwl:        db 0x0a


SECTION .text

; write macro
; %1: fd, %2: msg, %3: msglenght
%macro m_write 3 
    mov   rdi, %1
    mov   rsi, %2
    mov   rdx, %3
    mov   rax, 1
    syscall
%endmacro


; exit macro
%macro m_exit 1
    mov rdi, %1
    mov rax, 60
    syscall
%endmacro

_start:
        sub rsp , 8
        m_write 1, greet, greet_l

        mov     rdi, string
        call    ft_strlen


        mov     [rsp + 16], rax
        lea     rax, [rsp + 16]
        
        m_write 1, rax, 1
        m_write 1, nwl, 1

        m_write 1, end, end_l
        m_exit rax


ft_strlen:
    mov rax, 49
    ret


;   CALL addresse -> call subroutine
;   PUSH EIP
;   JMP adresse

;   LEAVE -> prep for ret
;   MOV ESP, EBP
;   POP EBP

;   RET -> return
;   POP EIP
