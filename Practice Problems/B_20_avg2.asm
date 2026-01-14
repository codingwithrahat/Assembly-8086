;Problem 20: Simple Average Check
;Question: Input two digits. Add them and divide by 2 (using SHR). If average is 4 or more, display "GOOD AVERAGE!", otherwise "LOW AVERAGE!".

.MODEL SMALL
.STACK 100H
.DATA
M1 DB 'ENTER FIRST DIGIT: $'
M2 DB 'ENTER SECOND DIGIT: $'
M3 DB 'GOOD AVERAGE!$'
M4 DB 'LOW AVERAGE!$'

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 
    
    LEA DX, M1
    MOV AH, 9
    INT 21H
    
    MOV AH, 1
    INT 21H  
    SUB AL, 30H
    MOV BL, AL
    
    LEA DX, M2
    MOV AH, 9
    INT 21H
    
    MOV AH, 1
    INT 21H  
    SUB AL, 30H
    
    ADD AL, BL
    
    SHR AL, 1
    
    CMP AL, 4
    JGE LR  
    
    LEA DX, M4
    JMP DISPLAY
    
    
    LR:
    LEA DX,M3
    JMP DISPLAY
    
    
    DISPLAY:
    MOV AH,9
    INT 21H
       
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
    
     
