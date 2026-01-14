.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    MOV AX, 8
    MOV BX, 4 
    
    MOV CX, AX
    CMP BX, CX
    JLE NEXT
    MOV CX, BX
    
    NEXT:    
    MOV AH, 2
    MOV DL, CL 
    ADD DL, 30H
    INT 21H    
    
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
