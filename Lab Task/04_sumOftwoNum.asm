 .MODEL SMALL  
 
 .STACK 100H
 .DATA
 MSG1 DB 0DH,0AH,'Enter First Number:$'
 MSG2 DB 0DH,0AH,'Enter Second Number:$'
 MSG3 DB 0DH,0AH,'SUM :$'
 
 NUM1 DB ?
 NUM2 DB ?
 SUM DB ?
 
 
 ;new line
 ;0DH it means CARRIAGE RETURN
 ;0AH it meansLINE FEED
 
 .CODE
 MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
     
    
    MOV AH,1
    INT 21H
    SUB AL, 30H
    MOV NUM1,AL
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H
     
    
    MOV AH,1
    INT 21H
    SUB AL, 30H
    MOV NUM2,AL 
    
    MOV AL,NUM1
    ADD AL,NUM2
    MOV SUM,AL      
    
     
    LEA DX,MSG3
    MOV AH,9
    INT 21H  
    
    ADD SUM, 30H   
    MOV DL,SUM
    MOV AH,2
    INT 21H
    
    MOV AH,4CH
    INT 21H

MAIN ENDP
END MAIN
    

 
