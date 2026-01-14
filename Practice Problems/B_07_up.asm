;Problem 7: Upper/Lower Case Check
;Question: Write a program that determines if an entered character is uppercase, lowercase, or neither.


.MODEL SMALL
.STACK 100H 

.DATA
M1 DB 0DH, 0AH, 'ENTER A CHAR: $'
M2 DB 0DH, 0AH, 'UPPER $'
M3 DB 0DH, 0AH, 'LOWER $'
M4 DB 0DH, 0AH, 'NEITHER $'

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,M1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    
    CMP AL,'A'
    JL NE
    CMP AL, 'Z'
    JLE UP
    
    CMP AL, 'a'
    JL NE
    CMP AL, 'z'
    JLE LW
    
    UP:
    LEA DX, M2
    JMP DISPLAY
    
    LW:
    LEA DX, M3
    JMP DISPLAY 
    
    
    NE:
    LEA DX,M4
      
    DISPLAY:
    MOV AH,9
    INT 21H 
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
    
     
