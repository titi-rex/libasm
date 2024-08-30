GLOBAL  ft_atoi_base

SECTION .text

ft_atoi_base:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 0x20
        mov     [rbp - 0x8], rdi        ; str
        mov     [rbp - 0x10], rsi       ; base

        xor     rax, rax                ; init return value to 0
        xor     r8, r8                  ; init base_len counter to 0
        mov     r9, 0x1                 ; init sign counter to 1

        ; should atoi crash if you use it wrongly ? 
        test    rdi, rdi
        jz      .end
        test    rsi, rsi
        jz      .end


        ; check if base is valid
.base.loop:
        mov     cl, [rsi]
        test    cl, cl                  ; if *base == '\0'
        jz      .base.end               ; go out
        cmp     cl, 0x20                ; if *base <= 32 (non printable ascii)
        jle     .end                    ; go error
        cmp     cl, 0x2b                ; if *base == '+'
        je      .end                    ; go error
        cmp     cl, 0x2d                ; if *base == '-'
        je      .end                    ; go error

        mov     r10, [rbp - 0x10]       ; init duplicate-searcher base offset (dsbo)

.base.loop.duplicate:
        cmp     r10, rsi                ; if dsbo == base (where we are in base parsing) 
        je      .base.next              ; no duplicate found

        cmp     cl, BYTE [r10]          ; if *base == *dsbo
        je      .end                    ; go error

        inc     r10                     ; inc dsbo
        jne     .base.loop.duplicate    ; loop again

.base.next:
        inc     r8                      ; ++base_len
        inc     rsi                     ; ++base
        jmp     .base.loop


.base.end:
        cmp     r8, 0x1                 ; if base_len == 1
        jle     .end                    ; go error


        ; skip space (whitespace(3))
.space.loop:
        mov     cl, [rdi]
        test    cl, cl                  ; if *str == '\0
        jz      .end                    ; go error
        cmp     cl, 0x20                ; if *str > ' '
        jg      .sign.loop              ; go sign
        cmp     cl, 0x9                 ; if *str < 9
        jl      .end                    ; go error
        cmp     cl, 0xd                 ; if *str > 13
        jg      .end                    ; go error
        inc     rdi
        jmp     .space.loop


        ; get sign
.sign.minus:
        neg     r9

.sign.inc:
        inc     rdi
        mov     cl, [rdi]
        jmp     .sign.loop

.sign.loop:
        cmp     cl, 0x2b                ; if *str == '+'
        je      .sign.inc
        cmp     cl, 0x2d                ; if *str == '-'
        je      .sign.minus


        ; extract number
        mov     rsi, [rbp - 0x10]       ; reset base &

; r8 = lenbase
; r9 = sign
; rax = res
; cl = *str
; rsi = base
; rdx = base + i (base offset)

.extract:
        mov     rdx, [rbp - 0x10]       ; init base offset
        dec     rdx

.extract.loop:
        inc     rdx                     ; inc base offset 
        cmp     [rdx], BYTE 0x0              ; if base offset == '\'
        jz      .end                    ; go .end
        cmp     cl, [rdx]               ; if *str == *(base + offset)
        jne     .extract.loop           ; if false, loop again

.extract.extract:
        imul    rax, r8                 ; mult res by base_len (powerup unit category)
        sub     rdx, rsi                ; extract unit number from difference between base and offset
        add     rax, rdx                ; add unit number
        inc     rdi
        mov     cl, [rdi]
        test    cl, cl                  ; if *str == '\0'
        jnz     .extract


.end:
        imul    rax, r9
        add     rsp, 0x20
        leave
        ret
