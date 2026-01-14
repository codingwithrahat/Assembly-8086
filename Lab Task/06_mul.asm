.MODEL SMALL
.STACK 100H

.DATA
MSG1 DB 0DH,0AH,'Enter First Number:$'
MSG2 DB 0DH,0AH,'Enter Second Number:$'
MSG4 DB 0DH,0AH,'Enter Third Number:$'
MSG3 DB 0DH,0AH,'(A + B) * C : $'

NUM1  DB ?
NUM2  DB ?
NUM3  DB ?
SUM   DB ?


.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX


    LEA DX, MSG1
    MOV AH, 9
    INT 21H

    MOV AH, 1
    INT 21H
    SUB AL, 30H
    MOV NUM1, AL

    LEA DX, MSG2
    MOV AH, 9
    INT 21H

    MOV AH, 1
    INT 21H
    SUB AL, 30H
    MOV NUM2, AL


    LEA DX, MSG4
    MOV AH, 9
    INT 21H

    MOV AH, 1
    INT 21H
    SUB AL, 30H
    MOV NUM3, AL


    MOV AL, NUM1
    ADD AL, NUM2
    MUL NUM3         

    MOV SUM, AL
    ADD SUM, 30H       

    LEA DX, MSG3
    MOV AH, 9
    INT 21H

    MOV DL, SUM
    MOV AH, 2
    INT 21H

    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
