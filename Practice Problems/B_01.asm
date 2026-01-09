;Problem 1: Simple Character Comparison
;Question: Write an assembly program that prompts the user to enter a character. If the character is 'A', display "CORRECT!". Otherwise, display "WRONG!".   

.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 0DH, 0AH, 'CORRECT! $'
MSG2 DB 0DH, 0AH, 'WRONG! $'

.CODE  

MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 1
    INT 21H
    MOV BL, AL
    
    CMP BL, 'A'
    JE EQUAL
    
    LEA DX, MSG2
    MOV AH, 9
    INT 21H
    JMP EXIT
    
    EQUAL:
    LEA DX, MSG1
    MOV AH, 9
    INT 21H
    JMP EXIT 
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
    
