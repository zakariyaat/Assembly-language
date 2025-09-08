.MODEL SMALL
.STACK 100H

.DATA
    BIN1 DB 00000101B     ; 5
    BIN2 DB 00000010B     ; 2
    BIN_DIFF DB ?         ; result
    msg DB 'Difference = $'

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    ; --- Subtraction ---
    MOV AL,BIN1
    SUB AL,BIN2
    MOV BIN_DIFF,AL       ; store result in memory

    ; --- Print message ---
    MOV AH,9
    LEA DX,msg
    INT 21H

    ; --- Convert result to decimal and print ---
    MOV AL,BIN_DIFF
    AAM                   ; divide AL by 10 ? AH=tens, AL=ones

    ADD AH,'0'            ; convert tens to ASCII
    ADD AL,'0'            ; convert ones to ASCII

    ; Print tens digit (skip if zero)
    CMP AH,'0'
    JE skip_tens
    MOV DL,AH
    MOV AH,2
    INT 21H
skip_tens:

    ; Print ones digit
    MOV DL,AL
    MOV AH,2
    INT 21H

    ; --- Exit ---
    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN
