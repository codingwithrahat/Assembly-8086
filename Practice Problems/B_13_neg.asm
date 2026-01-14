;Problem 13: Simple Subtraction Check 
;Question: Input two digits. Subtract second from first. If result is positive, display "POSITIVE!". If zero, display "EQUAL!". If negative, display "NEGATIVE!".

.MODEL SMALL
.STACK 100H
.DATA
M1 DB 'ENTER FIRST DIGIT: $'
M2 DB 'ENTER SECOND DIGIT: $'
M3 DB 'POSITIVE!$'
M4 DB 'EQUAL!$'
M5 DB 'NEGATIVE!$'



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
    MOV BL, AL 
    
    LEA DX,M2
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H 
    SUB AL, 30H
    
    SUB BL, AL    
    JZ EQ
    JS NG  
    
    LEA DX,M3    
    JMP DISPLAY
    
    EQ:
    LEA DX,M4 
    JMP DISPLAY
     
    NG: 
    LEA DX,M5  
    
    
    
    DISPLAY:
    MOV AH,9
    INT 21H
       
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
    
     
