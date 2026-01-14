;Problem 6: Grade Classification
;Question: Write a program that inputs a character grade (A,B,C,D,F) and displays the corresponding message: "EXCELLENT" for A, "GOOD" for B, "AVERAGE" for C, "POOR" for D, and "FAIL" for F.


.MODEL SMALL
.STACK 100H 

.DATA
M1 DB 'ENTER GRADE: $'
M2 DB 'EXCELLENT$'
M3 DB 'GOOD$'
M4 DB 'AVERAGE$'
M5 DB 'POOR$'
M6 DB 'FAIL$'

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,M1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    
    CMP AL,'A'
    JE EXCELLENT
    CMP AL,'B'
    JE GOOD
    CMP AL,'C'
    JE AVERAGE
    CMP AL,'D'
    JE POOR
    CMP AL,'F'
    JE FAIL
    JMP EXIT
    
    EXCELLENT:
    LEA DX,M2
    JMP DISPLAY
    
    GOOD:
    LEA DX,M3
    JMP DISPLAY
    
    AVERAGE:
    LEA DX,M4
    JMP DISPLAY
    
    POOR:
    LEA DX,M5
    JMP DISPLAY
    
    FAIL:
    LEA DX,M6
    
    DISPLAY:
    MOV AH,9
    INT 21H 
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
    
     
