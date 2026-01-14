.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC    
            
    MOV AH,1
    INT 21H

    CMP AL,'y'
    JE DIS
    CMP AL,'Y'
    JE DIS
    
    JMP EXIT
    
    DIS:
    MOV AH, 2
    MOV DL,AL
    INT 21H
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
