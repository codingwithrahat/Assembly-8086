;Problem 3: Vowel or Consonant
;Question: Write a program that checks if an entered character is a vowel (A,E,I,O,U) or consonant. Display appropriate message.

.MODEL SMALL
.STACK 100H  
.DATA

M1 DB 0DH, 0AH, 'ENTER A CHAR: $' 
M2 DB 0DH, 0AH, 'VOWEL $'
M3 DB 0DH, 0AH, 'CON $'



.CODE
MAIN PROC 
    
    MOV AX, @DATA
    MOV DS, AX 
    
    LEA DX, M1  
    MOV AH, 9
    INT 21H 
    
    
    MOV AH, 1
    INT 21H 
    
    CMP AL, 'a'
    JGE CON
    JMP NOR
    
    CON:
    SUB AL, 32 
    
    NOR:
    CMP AL, 'A'
    JE VO
    CMP AL, 'E'
    JE VO 
    CMP AL, 'I'
    JE VO 
    CMP AL, 'O'
    JE VO 
    CMP AL, 'U'
    JE VO   
    
    LEA DX, M3
    JMP DISPLAY
    
    VO: 
    LEA DX, M2 
    JMP DISPLAY
    
    
    DISPLAY:  
    MOV AH, 9
    INT 21H   
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
    
     
