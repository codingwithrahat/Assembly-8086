.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC    
            
    MOV AX, -6
    
    CMP AX, 0
    JL NG
    JG PO
    
    MOV BX, 0
    JMP EXIT
    
    NG:
    MOV BX, -1
    JMP EXIT
    
    PO:
    MOV BX, 1
        
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
