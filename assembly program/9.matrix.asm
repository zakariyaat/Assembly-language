; Program: Print Matrix using any character (e.g., '*')

.MODEL SMALL
.STACK 100H
.DATA
    star DB '*$'          ; character to print
    newline DB 0Dh,0Ah,'$' ; new line (for row change)

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, 5       ; number of rows (outer loop)

ROW_LOOP:
    PUSH CX         ; save row counter
    MOV CX, 5       ; number of columns (inner loop)

COL_LOOP:
    LEA DX, star
    MOV AH, 09H
    INT 21H         ; print "*"
    LOOP COL_LOOP   ; repeat for each column

    ; print newline after finishing row
    LEA DX, newline
    MOV AH, 09H
    INT 21H

    POP CX          ; restore row counter
    LOOP ROW_LOOP   ; repeat for each row

    ; Exit program
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN