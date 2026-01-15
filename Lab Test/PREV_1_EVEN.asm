.MODEL SMALL
.STACK 100H
.DATA
M1 DB 0DH, 0AH, 'HIGH EVEN SUM$'
M2 DB 0DH, 0AH, 'LOW EVEN SUM $'
M3 DB 0DH, 0AH, 'HIGH ODD SUM $'
M4 DB 0DH, 0AH, 'LOW ODD SUM $'

VA DB ?
VB DB ? 
SUM DB ?

.CODE
MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 1
    INT 21H
    SUB AL, 30H
    MOV VA, AL
    
    MOV AH, 1
    INT 21H
    SUB AL, 30H
    MOV VB, AL
    
    
    MOV AL, VA
    ADD AL, VB
    MOV SUM, AL          
    
    AND AL, 1
    
    CMP AL, 0
    JE EV
    
    CMP SUM, 8
    JG HIO
    
    LEA DX, M4
    JMP DISPLAY
    
    
    HIO:
    LEA DX, M3
    JMP DISPLAY
    
    EV:
    CMP SUM, 8 
    JG HIE
    
    LEA DX, M2
    JMP DISPLAY
    
    HIE:
    LEA DX, M1          
  
    
    DISPLAY:
    MOV AH, 9
    INT 21H
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
