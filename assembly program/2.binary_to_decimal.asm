;--------------------------------------
; Program: Binary to Decimal Conversion
; Input: binary string (max 8 bits)
; Output: decimal number
;--------------------------------------

.model small
.stack 100h
.data
    msg1 db 'Enter a binary number (up to 8 bits): $'
    msg2 db 0dh,0ah,'Decimal value: $'
    bin_input db 9 dup('$')     ; buffer for binary input
    dec_output db 4 dup('$')    ; buffer for decimal output

.code
main proc
    mov ax,@data
    mov ds,ax

    ;---- Prompt user ----
    mov ah,9
    lea dx,msg1
    int 21h

    ;---- Read binary string ----
    mov ah,0ah
    lea dx,bin_input
    int 21h

    ;---- Convert binary string to number ----
    mov si,offset bin_input+2   ; input string starts here
    mov cx,0                    ; length counter
    mov cl,[bin_input+1]        ; number of chars entered
    mov bx,0                    ; result in BX = decimal number

bin_loop:
    mov al,[si]
    cmp al,'0'
    je zero_bit
    cmp al,'1'
    je one_bit
    jmp skip_bit                ; ignore invalid chars

zero_bit:
    shl bx,1
    jmp next_bit

one_bit:
    shl bx,1
    inc bx
    jmp next_bit

next_bit:
    inc si
skip_bit:
    loop bin_loop

    ;---- Print decimal result ----
    mov ah,9
    lea dx,msg2
    int 21h

    ; Convert BX to decimal string
    mov ax,bx
    mov cx,0
conv_loop:
    mov dx,0
    mov bx,10
    div bx          ; AX / 10 ? Quotient=AX, Remainder=DX
    push dx         ; save remainder
    inc cx
    cmp ax,0
    jne conv_loop

print_dec:
    pop dx
    add dl,'0'
    mov ah,2
    int 21h
    loop print_dec

    ; Exit program
    mov ah,4ch
    int 21h
main endp
end main
