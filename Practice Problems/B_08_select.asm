;Problem 8: Simple Calculator Choice
;Question: Write a program that displays a menu (1-Add, 2-Subtract, 3-Exit) and branches to appropriate sections based on user choice.


.MODEL SMALL
.STACK 100H 

.DATA
M1 DB 0DH, 0AH, '1-ADD , 2-SUB, 3-EXIT: $'
M2 DB 0DH, 0AH, 'ADD SELECT$'
M3 DB 0DH, 0AH, 'SUB SELECT$'
M4 DB 0DH, 0AH, 'EXIT SELECT $'


.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,M1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    
    CMP AL,'1'
    JE AD
    CMP AL, '2'
    JE SU   
    JMP EX
    
    AD:
    LEA DX, M2
    JMP DISPLAY
    
    SU:
    LEA DX, M3
    JMP DISPLAY 
    
    
    EX:
    LEA DX,M4
      
    DISPLAY:
    MOV AH,9
    INT 21H 
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
    
     
