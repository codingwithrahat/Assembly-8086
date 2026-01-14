;Problem 16: Double and Compare 
;Question: Input a digit. Multiply it by 2 (using ADD or SHL). If result is less than 10, display "FITS!", otherwise "TOO BIG!".

.MODEL SMALL
.STACK 100H
.DATA
M1 DB 'ENTER A DIGIT: $'
M2 DB 'FITS!$'
M3 DB 'TOO BIG!$'



.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,M1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H 
    SUB AL, 30H
    
    SHL AL, 1
    CMP AL, 10
    JL LR 
    
    LEA DX,M3    
    JMP DISPLAY
    
    LR:
    LEA DX,M2
    JMP DISPLAY
    
    
    DISPLAY:
    MOV AH,9
    INT 21H
       
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
    
     
