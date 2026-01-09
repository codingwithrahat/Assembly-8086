 .MODEL SMALL  
 
 .STACK 100H
 .DATA
 MSG1 DB 0DH,0AH,'Enter the Uppercase latter:$'
 MSG2 DB 0DH,0AH,'The Lowercase character IS:$'
 CHAR DB ?
 
 
 .CODE
 MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, MSG1
    MOV AH, 9
    INT 21H
    
    MOV AH, 1
    INT 21H
    MOV CHAR, AL
    
    ADD CHAR, 20H  ; in decimal AL, 32 
    
    LEA DX, MSG2
    MOV AH, 9
    INT 21H
    
    MOV AH, 2
    MOV DL, CHAR
    INT 21H
    
    
    MOV AH,4CH
    INT 21H

MAIN ENDP
END MAIN
    

 
