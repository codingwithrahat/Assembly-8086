;Problem 2: Number Range Check
;Question: Write a program that inputs a digit (0-9) and displays "SMALL" if it's 0-4, "LARGE" if it's 5-9, or "INVALID" if it's not a digit. 

.MODEL SMALL
.STACK 100H  
.DATA

M1 DB 0DH, 0AH, 'ENTER A NUMBER: $' 
M2 DB 0DH, 0AH, 'SMALL $'
M3 DB 0DH, 0AH, 'LARGE $'
M4 DB 0DH, 0AH, 'INVALID $'



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
    MOV BL , AL
    
    CMP AL, 0
    JL INVALID 
    
    
    CMP AL, 9
    JG INVALID
    
    CMP AL, 4
    JLE SM 
    JMP LA 
    
    
    SM: 
    LEA DX, M2 
    JMP DISPLAY
    
    LA:
    LEA DX, M3
    JMP DISPLAY
    
    
    INVALID:    
    LEA DX, M4
    
    
    DISPLAY:  
    MOV AH, 9
    INT 21H   
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
    
     
