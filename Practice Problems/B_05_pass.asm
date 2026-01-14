;Problem 5: Password Check
;Question: Write a program that prompts for a password. If the user enters 'X', display "ACCESS GRANTED". Otherwise, display "ACCESS DENIED".


.MODEL SMALL
.STACK 100H  
.DATA

M1 DB 0DH, 0AH, 'ENTER PASS: $' 
M2 DB 0DH, 0AH, 'GRANTED $'
M3 DB 0DH, 0AH, 'DENIED $'



.CODE
MAIN PROC 
    
    MOV AX, @DATA
    MOV DS, AX 
    
    LEA DX, M1  
    MOV AH, 9
    INT 21H 
    
    
    MOV AH, 1
    INT 21H 
    
    CMP AL, 'X'
    JNE DE  
    
    LEA DX, M2
    JMP DISPLAY
    
    DE: 
    LEA DX, M3 
    JMP DISPLAY
    
    
    DISPLAY:  
    MOV AH, 9
    INT 21H   
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
    
     
