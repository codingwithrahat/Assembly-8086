;Problem 18: Simple Counter Loop 
;Question: Start with number 5. Keep subtracting 1 and display count until it reaches 0. When 0, display "COUNTDOWN FINISHED!".
 
.MODEL SMALL
.STACK 100H
.DATA
M1 DB 0DH, 0AH,'COUNT: $'
M2 DB 0DH, 0AH, 'COUNTDOWN FINISHED!$'
COUNTER DB 5

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    
    LP:      
    LEA DX,M1
    MOV AH,9
    INT 21H
    
    MOV AH, 2
    MOV DL, COUNTER
    ADD DL, 30H    
    INT 21H 
    
    DEC COUNTER    
    JZ LR
    JMP LP
    
    
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
    
     
