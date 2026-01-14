;Problem 4: Even or Odd Number
;Question: Write a program that inputs a single digit and determines if it's even or odd using branch instructions.

.MODEL SMALL
.STACK 100H  
.DATA

M1 DB 0DH, 0AH, 'ENTER A NUMBER: $' 
M2 DB 0DH, 0AH, 'EVEN $'
M3 DB 0DH, 0AH, 'ODD $'



.CODE
MAIN PROC 
    
    MOV AX, @DATA
    MOV DS, AX 
    
    LEA DX, M1  
    MOV AH, 9
    INT 21H 
    
    
    MOV AH, 1
    INT 21H 
    SUB AL, 30H
    
    AND AL, 1 
    
    CMP AL, 0
    JZ EV
    
    LEA DX, M3
    JMP DISPLAY
    
    EV: 
    LEA DX, M2 
    JMP DISPLAY
    
    
    DISPLAY:  
    MOV AH, 9
    INT 21H   
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
    
     
