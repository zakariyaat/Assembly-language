.MODEL SMALL
.STACK 100H

.DATA
    BIN1 DB 00000001B     ; 1
    BIN2 DB 00000010B     ; 2
    BIN_SUM DB ?          ; result
    msg DB 'Sum = $'

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    ; --- Addition ---
    MOV AL,BIN1
    ADD AL,BIN2
    MOV BIN_SUM,AL        ; store result

    ; --- Print message ---
    MOV AH,9
    LEA DX,msg
    INT 21H

    ; --- Convert result to decimal and print ---
    MOV AL,BIN_SUM
    AAM                   ; ASCII adjust after multiply (AL ? quotient:AH, remainder:AL when dividing by 10)
                          ; After AAM: AH = tens digit, AL = ones digit

    ADD AH,'0'            ; convert to ASCII
    ADD AL,'0'

    ; Print tens digit (skip if zero for cleaner output)
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
