.MODEL SMALL
.STACK 100H
.DATA
M1 DB 0DH, 0AH, 'INPUT A: $'
M2 DB 0DH, 0AH, 'INPUT B: $'
M3 DB 0DH, 0AH, 'INPUT C: $'

M4 DB 0DH, 0AH, 'HIGH RESULT!$'
M5 DB 0DH, 0AH, 'MEDIUM RESULT!$'
M6 DB 0DH, 0AH, 'LOW RESULT!$'

VA DB ?
VB DB ?
VC DB ?



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
   
    
    
    MOV AL, VA
    MUL VB
    SUB AL, VC    
    
    CMP AL, 15
    JG HI
    
    CMP AL, 5
    JL LW
    
    LEA DX, M5
    JMP DISPLAY    
    
    LW:
    LEA DX, M6
    JMP DISPLAY
    
    
    HI:
    LEA DX, M4
    
    DISPLAY:    
    MOV AH, 9
    INT 21H
    
    
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
