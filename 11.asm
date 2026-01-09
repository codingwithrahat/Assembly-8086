; take 3 number , print the max number 

.MODEL SMALL
.STACK 100H

.DATA
MSG1 DB 0DH, 0AH, 'ENTER 3 NUMBER: $'   
NUM DB ?

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
    
    INT 21H
    MOV BH, AL
    SUB BH, 30H  
    
    INT 21H
    MOV CL, AL
    SUB CL, 30H
    
    CMP BL, BH
    JG C1      ; IF BL IS GREATHER THAN BH  
    JMP C2
    
    C1:
    CMP BL, CL
    JG CBL     ; IF BL IS GREATHER THAN CL 
    JMP CCL 
    
    C2:
    CMP BH, CL  
    JG CBH     ; IF BH IS GREATHER THAN CL
    JMP CCL
    
    
    CBL: 
    MOV AH, 2    
    MOV DL, BL 
    ADD DL, 30H
    INT 21H
    JMP EXIT 
    
    CCL:                                  
    MOV AH, 2  
    MOV DL, CL
    ADD DL, 30H
    INT 21H
    JMP EXIT
    
    CBH: 
    MOV AH, 2
    MOV DL,BH
    ADD DL, 30H
    INT 21H
    JMP EXIT
    
     
    EXIT: 
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
