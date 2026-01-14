.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 0DH,0AH,'Enter first number: $'
MSG2 DB 0DH,0AH,'Enter second number: $'
RES  DB 0DH,0AH,'MUL is: $'
TENS DB ?
ONES DB ?

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    LEA DX,MSG1
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    SUB AL,30H       
    MOV BL,AL        


    LEA DX,MSG2
    MOV AH,9
    INT 21H
    MOV AH,1
    INT 21H
    SUB AL,30H       

    MUL BL
    
    ;DIV AL BY 10
    XOR AH,AH        ; AH = 0 before divide(MOV AH, 0 also work)
    MOV BL,10
    DIV BL           ; AL = tens, AH = remainder (ones)
    
    MOV TENS,AL
    MOV ONES,AH


    LEA DX,RES
    MOV AH,9
    INT 21H

    CMP TENS,0
    JE D_ONES
    
    ;IF AL NOT EQUAL TO 0 (13 MOD 10 = 3) AND (13 DIV 10 = 1) 
    ;AH = 3
    ;AL = 1
    
    MOV DL,TENS
    ADD DL,30H       
    MOV AH,2
    INT 21H
    
    
    ;IF AL EQUAL ZERO (3 MOD 10 = 3) AND (3 DIV 10 = 0)
    ;AH = 3
    ;AL = 0
    
    D_ONES:
    MOV DL,ONES
    ADD DL,30H       
    MOV AH,2
    INT 21H

    EXIT:
    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN
