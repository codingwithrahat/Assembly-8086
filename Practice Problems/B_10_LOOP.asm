;Problem 10: Loop with Condition
;Question: Write a program that repeatedly asks for a character until the user enters 'Q' to quit. Display "CONTINUE" for any other character.


.MODEL SMALL
.STACK 100H 

.DATA
M1 DB 0DH, 0AH, 'ENTER A CHAR : $'  
M2 DB 0DH, 0AH, 'CONTINUE $'


.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
     
    LP: 
    LEA DX,M1
    MOV AH,9
    INT 21H
       
    MOV AH,1
    INT 21H
 
    
    
    CMP AL, 'Q'
    JE EXIT
      
    LEA DX,M2
    MOV AH,9
    INT 21H
    JMP LP
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
    
     
