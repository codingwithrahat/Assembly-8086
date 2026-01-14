;Problem 5: Bit Pattern Check using OR 
;Question: Input a digit. OR it with 5. If result is greater than 7, display "HIGH BITS!", otherwise "LOW BITS!".

.MODEL SMALL
.STACK 100H
.DATA
M1 DB 'ENTER A DIGIT: $'
M2 DB 'HIGH BITS!$'
M3 DB 'LOW BITS!$'



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
    
    OR AL, 5
    CMP AL, 7
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
    
     
