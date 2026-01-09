; A NUMBER IS IN RANGE OR OUT OF RANGE

.MODEL SMALL
.STACK 100H

.DATA
MSG1 DB 0DH, 0AH, 'ENTER A NUMBER: $'
MSG2 DB 0DH, 0AH, 'IN RANGE $'
MSG3 DB 0DH, 0AH, 'OUT OF RANGE $'

.CODE
MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX
                        
    LEA DX, MSG1
    MOV AH, 9
    INT 21H
    
    MOV AH, 1
    INT 21H
    MOV BL, AL
    SUB BL, 30H
    
    CMP BL, 4
    JGE C1    ; IF BL IS GREATHER THAN EQUAL 4
    
    JMP ORANGE
    
    C1:
    
    CMP BL, 7
    JlE RANGE ; IF BL IS LESS THAN EQUAL 7
    
    JMP ORANGE
    
    RANGE:

    LEA DX, MSG2
    MOV AH, 9
    INT 21H
    
    JMP EXIT        
    
     
    ORANGE:
    LEA DX, MSG3
    MOV AH, 9
    INT 21H 
     
    EXIT: 
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
