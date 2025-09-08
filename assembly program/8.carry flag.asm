
; Program: Check and Display All Active Flag Bits in 8086

.MODEL SMALL
.STACK 100H
.DATA
    msgC DB 'Carry Flag Set',0Dh,0Ah,'$'
    msgZ DB 'Zero Flag Set',0Dh,0Ah,'$'
    msgS DB 'Sign Flag Set',0Dh,0Ah,'$'
    msgO DB 'Overflow Flag Set',0Dh,0Ah,'$'
    newline DB 0Dh,0Ah,'$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Example arithmetic operation
    MOV AL, 80H      ; AL = 128 (signed -128)
    ADD AL, 80H      ; 128 + 128 ? causes Overflow + Carry

    ; --- Check Carry Flag (CF) ---
    JC PRINT_CF      

    ; --- Check Zero Flag (ZF) ---
    JZ PRINT_ZF      

    ; --- Check Sign Flag (SF) ---
    JS PRINT_SF      

    ; --- Check Overflow Flag (OF) ---
    JO PRINT_OF      

    JMP DONE

; --- Print routines for each flag ---
PRINT_CF:
    LEA DX, msgC
    MOV AH, 09H
    INT 21H

PRINT_ZF:
    LEA DX, msgZ
    MOV AH, 09H
    INT 21H

PRINT_SF:
    LEA DX, msgS
    MOV AH, 09H
    INT 21H

PRINT_OF:
    LEA DX, msgO
    MOV AH, 09H
    INT 21H

DONE:
    LEA DX,newline
    MOV AH,09H
    INT 21H

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN