;Problem 11: Basic Addition Check 
;Question: Write a program that adds two single digits and checks if the result is greater than 10. Display "BIG SUM!" if result > 10, otherwise display "SMALL SUM!".

 
.MODEL SMALL
.STACK 100H
.DATA
M1 DB 'ENTER FIRST DIGIT: $'
M2 DB 'ENTER SECOND DIGIT: $'
M3 DB 'BIG SUM!$'
M4 DB 'SMALL SUM!$'

N1 DB ?
N2 DB ?


.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,M1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H 
    SUB AL, 30H
    MOV N1, AL 
    
    LEA DX,M2
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H 
    SUB AL, 30H
    MOV N2, AL
    
    MOV AL, N1
    ADD AL, N2
    
    CMP AL, 10
    JG BG  
    
    LEA DX,M4
    
    JMP DISPLAY
    
     
    BG: 
    LEA DX,M3
    
    DISPLAY:
    MOV AH,9
    INT 21H
       
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
    
     
