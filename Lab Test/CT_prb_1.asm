.MODEL SMALL
.STACK 100H
.DATA
M1 DB 0DH, 0AH, 'INPUT A: $'
M2 DB 0DH, 0AH, 'INPUT B: $'
M3 DB 0DH, 0AH, 'INPUT C: $'
M4 DB 0DH, 0AH, 'INPUT D: $'
M5 DB 0DH, 0AH, 'OUTPUT: $'

VA DB ?
VB DB ?
VC DB ?
VD DB ? 
SUM DB ?
TENS DB ?
ONES DB ?




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
    MOV VA, AL
    
    LEA DX, M2
    MOV AH, 9
    INT 21H
    
    MOV AH, 1
    INT 21H
    SUB AL, 30H
    MOV VB, AL
    
    LEA DX, M3
    MOV AH, 9
    INT 21H
    
    MOV AH, 1
    INT 21H
    SUB AL, 30H
    MOV VC, AL
    
    LEA DX, M4
    MOV AH, 9
    INT 21H
    
    MOV AH, 1
    INT 21H
    SUB AL, 30H
    MOV VD, AL 
    
    
    MOV AL, VA
    MUL VB
    ADD AL, VC
    MOV AH, 0
    DIV VD
    MOV SUM, AL 
    
    LEA DX, M5
    MOV AH, 9
    INT 21H
    
    
    MOV AL, SUM
    XOR AH,AH        
    MOV BL,10
    DIV BL           
    
    MOV TENS,AL
    MOV ONES,AH

    CMP TENS,0
    JE D_ONES
    
    
    MOV DL,TENS
    ADD DL,30H       
    MOV AH,2
    INT 21H
    
   
    
    D_ONES:
    MOV DL,ONES
    ADD DL,30H       
    MOV AH,2
    INT 21H

    
    
        
    
 
    
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
