;Problem 17: XOR Pattern Check 
;Question: Input a digit. XOR it with 3. If result is 0, display "MAGIC NUMBER!", otherwise display "NORMAL NUMBER!".

.MODEL SMALL
.STACK 100H
.DATA
M1 DB 'ENTER A DIGIT: $'
M2 DB 'MAGIC NUMBER!$'
M3 DB 'NORMAL NUMBER!$'


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
    
    XOR AL, 3
    JZ LR
    
    
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
    
     
