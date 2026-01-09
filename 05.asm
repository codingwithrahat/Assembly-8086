.MODEL SMALL
.STACK 100H

.CODE
MAIN PROC
    
    MOV AH, 1
    
    INT 21H
    MOV BL, AL
    
    INT 21H
    MOV CL, AL
    
    ADD BL, CL ; BL = BL + AL
    
    SUB BL, 48 ; BL = BL - '0', COVERT ASCII TO NUM, FOR HEXA 30H
    
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    MOV AH, 2
    MOV DL, BL
    INT 21H
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
