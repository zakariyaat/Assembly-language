org 100h          ; starting address for .COM program

.data
one_comp db 0F0h   ; example 1's complement number
two_comp db 00h    ; storage for 2's complement result

.code
start:
    mov al, [one_comp]   ; load 1's complement number
    add al, 1            ; add 1 to make it 2's complement
    mov [two_comp], al   ; store result in memory

    ; exit to DOS
    mov ah, 4Ch
    int 21h
