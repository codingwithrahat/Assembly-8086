;Problem 14: Division by 2 Check 
;Question: Input a digit. Divide it by 2 using shift operation. If result is greater than 3, display "BIG HALF!", otherwise "SMALL HALF!".

.MODEL SMALL
.STACK 100H
.DATA
M1 DB 'ENTER A DIGIT: $'
M2 DB 'BIG HALF!$'
M3 DB 'SMALL HALF!$'

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
    
    SHR AL, 1
    
    CMP AL, 3
    JG LR
    
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
