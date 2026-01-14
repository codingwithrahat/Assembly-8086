.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC    
            
    MOV CX, 80
    
    
    LP:
    MOV AH, 2
    MOV DL, '*'
    INT 21H
    
    LOOP LP
    
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
