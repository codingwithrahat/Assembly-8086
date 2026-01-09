.MODEL SMALL
.STACK 100H

.DATA
VAR1 DB 5       ;NUMERIC VALUE
VAR2 DB '5'     ;ASCCI VALUE
VAR3 DB ?       ;TAKE USER INPUT (ASCCI)


.CODE
MAIN PROC
     
     MOV AX, @DATA
     MOV DS, AX   
     
     MOV AH, 1
     INT 21H
     MOV VAR3, AL
     
     MOV AH, 2
     MOV DL, 0DH
     INT 21H
     MOV DL, 0AH
     INT 21H
     
     MOV AH, 2
     MOV DL, VAR1  
     ADD DL, 30H   ; CONVERT NUMERIC 5 TO ASCCI 5
     INT 21H
     
     MOV DL, VAR2
     INT 21H       ;VALUE IN ASSCI  
     
     MOV DL, VAR3
     INT 21H 
     
     EXIT:
     MOV AH, 4CH
     INT 21H
     MAIN ENDP
END MAIN
