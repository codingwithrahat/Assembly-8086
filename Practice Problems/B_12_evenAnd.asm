;Problem 12: Even or Odd using AND Logic 
;Question: Input a digit and use AND operation to check if it's even or odd. Display "EVEN NUMBER!" or "ODD NUMBER!".
 
.MODEL SMALL
.STACK 100H
.DATA
M1 DB 'ENTER A DIGIT: $'
M2 DB 'EVEN NUMBER!$'
M3 DB 'ODD NUMBER!$'


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
    
    AND AL, 1 
    JZ EV
    
    LEA DX,M3
    
    JMP DISPLAY
    
     
    EV: 
    LEA DX,M2
    
    DISPLAY:
    MOV AH,9
    INT 21H
       
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
    
     
