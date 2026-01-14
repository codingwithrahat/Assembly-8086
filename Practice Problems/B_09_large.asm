;Problem 9: Number Comparison
;Question: Write a program that inputs two single digits and displays which one is larger, or if they are equal.


.MODEL SMALL
.STACK 100H 

.DATA
M1 DB 0DH, 0AH, 'NUM1 : $'
M2 DB 0DH, 0AH, 'NUM2 : $'
M3 DB 0DH, 0AH, 'EQUAL $' 
M4 DB 0DH, 0AH, 'NUM1 IS LARGE $'
M5 DB 0DH, 0AH, 'NUM2 IS LARGE $' 

N1 DB ?
N2 DB ?


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
    MOV N1, AL
    
    LEA DX,M2
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    SUB AL, 30H
    MOV N2, AL 
              
    MOV AL, N1          
    CMP AL, N2
    JE EQ
    JG LW
    
    LEA DX, M5
    JMP DISPLAY
    
    EQ:
    LEA DX, M3
    JMP DISPLAY
    
    LW:
    LEA DX, M4
    JMP DISPLAY 
      
    DISPLAY:
    MOV AH,9
    INT 21H 
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
    
     
