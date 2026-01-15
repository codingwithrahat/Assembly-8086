.MODEL SMALL
.STACK 100H
.DATA
M1 DB 0DH, 0AH, 'ABOVE$'
M2 DB 0DH, 0AH, 'AT$'
M3 DB 0DH, 0AH, 'BELOW'

.CODE
MAIN PROC  
    
    MOV AX, @DATA
    MOV DS, AX

    
    MOV AH, 1
    INT 21H
    SUB AL, 30H
 
    MOV AH, 0
    MOV BL, 2
    DIV BL 
    
    NOT AL
    
    CMP AL, 250
    JG AB
    JL BE
    
    LEA DX, M2
    JMP DISPLAY
    
    
    AB:
    LEA DX, M1
    JMP DISPLAY
    
    BE:                     
    LEA DX, M3
    JMP DISPLAY
    
    
    
    DISPLAY:
    MOV AH, 9
    INT 21H
    
             

    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
