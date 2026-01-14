.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC

             

    LP:
    MOV AH,1
    INT 21H           

    CMP AL,' '
    JE EXIT

    JMP LP

    EXIT:
    MOV AH,4CH
    INT 21H

MAIN ENDP
END MAIN
