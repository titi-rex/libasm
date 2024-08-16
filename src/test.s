global _start

SECTION .data

message:    db 'Hello world!', 0x0a
msglenght:  equ $-message
SC_WRITE:   equ 1
SC_EXIT:    equ 60
STDOUT:     equ 1

SECTION .text

_start:

    mov rax,SC_WRITE
    mov rdi,STDOUT
    mov rsi,message
    mov rdx,msglenght
    syscall

    push rax

    mov rax,SC_EXIT
    pop rdi
    sub rdi,msglenght
    syscall
