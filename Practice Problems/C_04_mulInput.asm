.MODEL SMALL
.STACK 100H
.DATA

TENS DB ?
ONES DB ?
.CODE
MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX    
    
    
    MOV AL, 0
    MOV BL, 0
    MOV CL, 0      ; Use CL to store accumulated result
    
    LP:
    MOV AH, 1
    INT 21H        ; Read character into AL
    
    CMP AL, 0DH    ; Check if Enter key
    JE I1_DONE 
    
    SUB AL, 30H    ; Convert ASCII to digit
    MOV BL, AL     ; Save current digit in BL
    
    MOV AL, CL     ; Get accumulated result
    MOV DL, 10     ; Use DL as multiplier
    MUL DL         ; AL = AL * 10
    ADD AL, BL     ; Add current digit
    MOV CL, AL     ; Store back in CL
    
    JMP LP
    
    I1_DONE:    
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    MOV AL, CL
        
    ; PRINT MUL DIGIT                 
    XOR AH,AH        
    MOV BL,10
    DIV BL           
    
    MOV TENS,AL
    MOV ONES,AH
 
    CMP TENS,0
    JE D_ONES
    
    MOV DL,TENS
    ADD DL,30H       
    MOV AH,2
    INT 21H
    
    D_ONES:
    MOV DL,ONES
    ADD DL,30H       
    MOV AH,2
    INT 21H
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN
