;Problem 19: NOT Operation Check 
;Question: Input a digit. Apply NOT operation and check if result is greater than 240. Display "BIG NOT!" or "SMALL NOT!".

.MODEL SMALL
.STACK 100H
.DATA
M1 DB 'ENTER A DIGIT: $'
M2 DB 'BIG NOT!$'
M3 DB 'SMALL NOT!$'

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 
    
    LEA DX, M1
    MOV AH, 9
    INT 21H
    
    MOV AH, 1
    INT 21H  
    SUB AL, 30H
    
    NOT AL
    
    CMP AL, 240
    JG LR  
    
    LEA DX, M3
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
    
     
