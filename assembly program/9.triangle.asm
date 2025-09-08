
; Program: Print Triangle using any character (e.g., '*')

.MODEL SMALL
.STACK 100H
.DATA
    star DB '*$'           ; character to print
    newline DB 0Dh,0Ah,'$' ; new line (for row change)

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, 5        ; number of rows (outer loop)

ROW_LOOP:
    PUSH CX          ; save row counter

    ; calculate number of columns for this row
    MOV BX, 5
    SUB BX, CX       ; BX = (total_rows - current_row)
    INC BX           ; so row 1 ? 1 star, row 2 ? 2 stars, ...

    MOV CX, BX       ; inner loop counter = number of stars

COL_LOOP:
    LEA DX, star
    MOV AH, 09H
    INT 21H          ; print "*"
    LOOP COL_LOOP

    ; print newline after finishing row
    LEA DX, newline
    MOV AH, 09H
    INT 21H

    POP CX           ; restore row counter
    LOOP ROW_LOOP    ; repeat until all rows printed

    ; Exit program
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
