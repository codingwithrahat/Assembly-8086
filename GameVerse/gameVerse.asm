.MODEL SMALL
.STACK 100h
.DATA

;ARRAY AND VARIABLE OF MEMORY GAME
MEMP1   DB 9 DUP(0)
MEMP2   DB 9 DUP(0)
CORRECT DB 0
WRONG   DB 0
MOVESMEM DB 0

;ARRAY AND VARIABLE OF MAGIC BOX
BOX DB 9 DUP(0)
USEDBOX DB 9 DUP(0)
MOVESBOX DB 0

ENDL DB 0DH, 0AH, '$'  

MWEL1 DB 0DH, 0AH, '=================================================$'
MWEL2 DB 0DH, 0AH, '   WELCOME TO GAMEVERSE - A GAMING UNIVERSE$'
MWEL3 DB 0DH, 0AH, '=================================================$'

MM DB 0DH, 0AH, 0DH, 0AH, '===== MAIN MENU =====$'
MMO1 DB 0DH, 0AH, '1. MEMORY MATCH GAME$'
MMO2 DB 0DH, 0AH, '2. MAGIC SQUARE BOX$'
MMO3 DB 0DH, 0AH, '3. EXIT$'
MMOC DB 0DH, 0AH, 'CHOOSE (1-3): $'
MMOI DB 0DH, 0AH, 'INVALID CHOICE! TRY AGAIN.$'

ROWLINE  DB '-----------$'
MINPUT DB 0DH, 0AH, 'ENTER NUMBER (1-9): $'
MINVALID DB 0DH, 0AH, 'INVALID OR ALREADY USED! TRY AGAIN.$'

MEMT1 DB 0DH, 0AH, '==================================$'
MEMT2 DB 0DH, 0AH, '     MEMORY MATCH GAME$'
MEMT3 DB 0DH, 0AH, '==================================$' 

MMR1 DB 0DH,0AH,0DH,0AH, '==========FOLLOW THE RULES PLEASE====================$'
MMR2 DB 0DH,0AH, '1. PLAYER 1 WILL SET A GRID (NUMBER 1 TO 9 ONLY)$'
MMR3 DB 0DH,0AH, '2. PLAYER 2 MUST MEMORIZE THE GRID$'
MMR4 DB 0DH,0AH, '3. PLAYER 2 FILLS THE GRID FROM MEMORY$'
MMR5 DB 0DH,0AH, '4. IF PLAYER 2 HAS MORE WRONG THAN CORRECT, PLAYER 2 WINS$'
MMR6 DB 0DH,0AH, '5. IF PLAYER 2 HAS MORE CORRECT THAN WRONG, PLAYER 1 WINS$'
MMR7 DB 0DH,0AH, '=====================================================$'

MMBS DB 0DH,0AH, 'PRESS ANY KEY TO START____$'
 

MMP1TITLE DB 0DH, 0AH, 0DH, 0AH, '===== PLAYER 1 - SET THE GRID =====$'
MMP2TITLE DB 0DH, 0AH, 0DH, 0AH, '===== PLAYER 2 - MEMORIZE & MATCH =====$' 
MMPRESS1 DB 0DH, 0AH, 0DH, 0AH, 'MEMORIZE THE GRID VERY CAREFULLY!$' 

MMPRESS2 DB 0DH, 0AH, 'PRESS ANY KEY WHEN YOU ARE READY...$'

MMR0 DB 0DH, 0AH, '====FILL YOUR GRID TO MATCH PLAYER 1 GRID$====$'

MOVER DB 0DH, 0AH, 0DH, 0AH, '====== GAME OVER ======$'
MMCORRECT DB 0DH, 0AH, 'CORRECT: $'
MMWRONG DB 0DH, 0AH, 'WRONG: $'
MMP1WIN DB 0DH, 0AH, 0DH, 0AH, '=== PLAYER 1 WINS! ===$'
MMP2WIN DB 0DH, 0AH, 0DH, 0AH, '=== PLAYER 2 WINS! ===$'
MMP1P2  DB 0DH, 0AH, 0DH, 0AH, '=== MATCH DRAW! ===$'

MBT1 DB 0DH, 0AH, '==================================$'
MBT2 DB 0DH, 0AH, '      MAGIC SQUARE BOX$'
MBT3 DB 0DH, 0AH, '==================================$'

MBR0 DB 0DH, 0AH,0DH, 0AH, 'FOR RULES PRESS 1 OTHERWISE PRESS 0 : $' 

MBR1 DB 0DH, 0AH,0DH, 0AH, '==========FOLLOW THE RULES PLEASE====================$'
MBR2 DB 0DH, 0AH, '1. FILL THE GRID WITH NUMBERS 1 TO 9$'
MBR3 DB 0DH, 0AH, '2. EACH ROW, COLUMN, AND DIAGONAL SUM SHOULD BE SAME$'
MBR4 DB 0DH, 0AH, '3. NO REPEATED NUMBERS ARE ALLOWED$'
MBR5 DB 0DH, 0AH, '=====================================================$'


MBWIN  DB 0DH, 0AH, 0DH, 0AH, '=== MAGIC BOX VALID - YOU WIN! ===$'
MBLOST DB 0DH, 0AH, 0DH, 0AH, '=== NOT A MAGIC BOX - TRY AGAIN ===$'

M_PLAY_AGAIN DB 0DH, 0AH, 0DH, 0AH, '1. PLAY AGAIN$'
M_BACK_MENU DB 0DH, 0AH, '2. BACK TO MAIN MENU$'
M_CHOOSE DB 0DH, 0AH, 'CHOOSE (1-2): $' 


M_THANK DB 0DH, 0AH, 'THANK YOU! STAY WITH GAMEVERSE $' 

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
       
    MOV AH, 9
    LEA DX, ENDL
    INT 21h
    LEA DX, MWEL1
    INT 21h
    LEA DX, MWEL2
    INT 21h
    LEA DX, MWEL3
    INT 21h

    SHOW_MENU:
    MOV AH, 9
    LEA DX, MM
    INT 21h
    LEA DX, MMO1
    INT 21h
    LEA DX, MMO2
    INT 21h
    LEA DX, MMO3
    INT 21h
    LEA DX, MMOC
    INT 21h
    
    ;HERE GIVE CHOICE TO PLAYER
    MOV AH, 1
    INT 21h
    
    CMP AL, '1'
    JE START_MEMORY
    CMP AL, '2'
    JE START_MAGIC
    CMP AL, '3'
    JE EXIT
    
    ;IF INVALID
    MOV AH, 9
    LEA DX, MMOI
    INT 21h
    JMP SHOW_MENU
    
    
    
    ;HERE IS OUR 1ST GAME - MEMORY
    
    START_MEMORY: 
    
    ;FRIST WE WILL RESET VALUES AND ARRAY'S         
    MOV MOVESMEM, 0   
    MOV CORRECT, 0
    MOV WRONG, 0   
    
    ; HERE RESET THE ARRAY
    MOV CX, 9
    MOV SI, 0
    
    RESET_MEM:
    MOV MEMP1[SI], 0
    MOV MEMP2[SI], 0
    INC SI
    LOOP RESET_MEM
    ;ARRAY ARE SET WITH ZERO NOW
    
    
    ;TITLE OF MEMEORY GAME
    MOV AH, 9
    LEA DX, ENDL
    INT 21H 
    MOV AH, 9
    LEA DX, MEMT1
    INT 21h
    LEA DX, MEMT2
    INT 21h
    LEA DX, MEMT3
    INT 21h
   
    
    LEA DX, MBR0
    INT 21H  
    
    ;ASK IF THEY NEED RULES FOR MATCH GAME         
    MOV AH, 1
    INT 21H
    
    CMP AL, '1'
    JE RULM 
    
    ; IF RULS NOT NEEED THEN PRINT THIS LINE PLAYER 2 TITILE
    MOV AH, 9
    LEA DX, MMP1TITLE
    INT 21h
    
    JMP MEM_GAME_LOOP_P1 
    
       
    
    ;RULSE ARE SHOW HERE
    RULM:   
    
    MOV AH, 9
    LEA DX, MMR1
    INT 21H
    LEA DX, MMR2
    INT 21H
    LEA DX, MMR3
    INT 21H
    LEA DX, MMR4
    INT 21H
    LEA DX, MMR5
    INT 21H 
    LEA DX, MMR6
    INT 21H
    LEA DX, MMR7
    INT 21H 
    
    LEA DX, MMBS
    MOV AH, 9
    INT 21H  
    
    MOV AH, 1
    INT 21H
    
    
    
    ;HERE WE TAKE INPUT FROM PLAYER 1 
    ; PLAYER 1 TITILE, IF SHOW RULE
    MOV AH, 9
    LEA DX, MMP1TITLE
    INT 21h
    
    MEM_GAME_LOOP_P1:
     
    ;HERE WE WILL PRINT THE GRID 
    CALL PRINT_PLAYER1_ROW1
    CALL PRINT_SEP
    CALL PRINT_PLAYER1_ROW2
    CALL PRINT_SEP
    CALL PRINT_PLAYER1_ROW3
    
    MOV AH, 9
    LEA DX, ENDL
    INT 21h
    
    CMP MOVESMEM, 9
    JE DONE_FILL_P1
    
    ;WE WILL ASK PLAYER 1 TO GIVE INPUT
    MOV AH, 9
    LEA DX, MINPUT
    INT 21h
    
    MOV AH, 1
    INT 21h
    SUB AL, 30H
    
    CMP AL, 1
    JL BAD_MEM_INPUT_P1
    CMP AL, 9
    JG BAD_MEM_INPUT_P1
    
    MOV BL, MOVESMEM
    MOV BH, 0
    MOV SI, BX
    MOV MEMP1[SI], AL
    INC MOVESMEM 
    JMP MEM_GAME_LOOP_P1  

        
    BAD_MEM_INPUT_P1:
    MOV AH, 9
    LEA DX, MINVALID
    INT 21h
    JMP MEM_GAME_LOOP_P1 
    
    DONE_FILL_P1:
    
    
    ;PLAYER - 2 TRUN WILL START FROM HERE
    MOV AH, 9 
    LEA DX, MMP2TITLE
    INT 21H
    LEA DX, MMPRESS1
    INT 21H 
    
    ;HERE IT WILL SHOW THE FINAL GRID FOR PLAYER 1
    CALL PRINT_PLAYER1_ROW1
    CALL PRINT_SEP
    CALL PRINT_PLAYER1_ROW2
    CALL PRINT_SEP
    CALL PRINT_PLAYER1_ROW3
    
    ;HERE ASK PLAYER 2 TO REMEBER AND PRESS KEY
    MOV AH, 9
    LEA DX, MMPRESS2
    INT 21h
    
    MOV AH, 1
    INT 21h 
    
    
    ;HERE WE PRINT 100 BLANK LINE SO THE INPUT OF PLAYER 1 WILL VANISH
    MOV CX, 100
    CLEAR_LOOP:
    MOV AH, 2
    MOV DL, 0DH
    INT 21h
    MOV DL, 0AH
    INT 21h
    LOOP CLEAR_LOOP 
    
    MOV AH, 9
    LEA DX, MMR0
    INT 21H
    
    
    ;RESET THE MOVESMEM VARIABLE 
    MOV MOVESMEM, 0
    
    ;HERE IT TAKE INPUT FROM PLAYER 1
    MEM_GAME_LOOP_P2:
    
    ;IT SHOW THE GRID FOR PLAYER 2
    CALL PRINT_PLAYER2_ROW1
    CALL PRINT_SEP
    CALL PRINT_PLAYER2_ROW2
    CALL PRINT_SEP
    CALL PRINT_PLAYER2_ROW3
    
    MOV AH, 9
    LEA DX, ENDL
    INT 21h
    
    CMP MOVESMEM, 9
    JE CHECK_MEM_GAME  
    
    MOV AH, 9
    LEA DX, MINPUT
    INT 21h
    
    MOV AH, 1
    INT 21h
    SUB AL, 30H
    
    CMP AL, 1
    JL BAD_MEM_INPUT_P2
    CMP AL, 9
    JG BAD_MEM_INPUT_P2
    
    MOV BL, MOVESMEM
    MOV BH, 0
    MOV SI, BX
    MOV MEMP2[SI], AL
    INC MOVESMEM
    JMP MEM_GAME_LOOP_P2
    
    BAD_MEM_INPUT_P2:
    MOV AH, 9
    LEA DX, MINVALID
    INT 21h
    JMP MEM_GAME_LOOP_P2
    
    
    ;HERE WE CHCEK P1[INDEX] == P2[INDEX]
    CHECK_MEM_GAME:
    MOV CX, 9
    MOV SI, 0
    MOV CORRECT, 0
    MOV WRONG, 0
    
    CHECK_MEM_LOOP:
    MOV AL, MEMP1[SI]
    CMP AL, MEMP2[SI]
    JE MEM_MATCH
    INC WRONG
    JMP MEM_NEXT
    
    MEM_MATCH:
    INC CORRECT
    
    MEM_NEXT:
    INC SI
    LOOP CHECK_MEM_LOOP 
    
    
    
    ;HERE WE SHOW THE RESULT
    MOV AH, 9
    LEA DX, MOVER
    INT 21h
    
    LEA DX, MMCORRECT
    INT 21h
    MOV AL, CORRECT
    ADD AL, 30H
    MOV DL, AL
    MOV AH, 2
    INT 21h
    
    MOV AH, 9
    LEA DX, MMWRONG
    INT 21h
    MOV AL, WRONG
    ADD AL, 30H
    MOV DL, AL
    MOV AH, 2
    INT 21h
    
    MOV AH, 9
    LEA DX, ENDL
    INT 21h
    
    
    ;HERE WE COMPARE WHO WIN
    MOV AL, CORRECT
    CMP AL, WRONG
    JG PLAYER2_WINS
    
    
    
    ;IF PLAYER 1 WIN
    MOV AH, 9
    LEA DX, MMP1WIN
    INT 21h
    JMP PLAY_AGAIN_MENU  

    PLAYER2_WINS:
    MOV AH, 9
    LEA DX, MMP2WIN
    INT 21h
    JMP PLAY_AGAIN_MENU
    
    
    
    
    
    
    ;THIS IS OUT 2ND GAME MAGIC SQUARE BOX 
    
    START_MAGIC: 
    
    ;HERE WE RESET THE VALUES AND ARRAY'S
    MOV MOVESBOX, 0
    MOV CX, 9
    MOV SI, 0
    
    RESET_MAG:
    MOV BOX[SI], 0
    MOV USEDBOX[SI], 0
    INC SI
    LOOP RESET_MAG
    
    
    ;TITLE OF MAGIC BOX GAME 
    MOV AH, 9
    LEA DX, ENDL
    INT 21H
    MOV AH, 9
    LEA DX, MBT1
    INT 21h
    LEA DX, MBT2
    INT 21h
    LEA DX, MBT3
    INT 21h
    
    LEA DX, MBR0
    INT 21H  
    
    ; ASK FOR RULES FOR MAGIC GAME
    MOV AH, 1
    INT 21H
    
    CMP AL, '1'
    JE RUL 
    JMP MAG_GAME_LOOP    
    
    ;RULSE ARE SHOW HERE
    RUL:   
    
    MOV AH, 9
    LEA DX, MBR1
    INT 21H
    LEA DX, MBR2
    INT 21H
    LEA DX, MBR3
    INT 21H
    LEA DX, MBR4
    INT 21H
    LEA DX, MBR5
    INT 21H  
    
    LEA DX, MMBS
    MOV AH, 9
    INT 21H
    
    MOV AH, 1
    INT 21H
    
    
   
    
    ;HERE WE TAKE INPUT FRO THE GRID
    MAG_GAME_LOOP:
    
    ;HERE IT PRITN THE GRID FOR MAGIC BOX
    CALL PRINT_MAG_ROW1
    CALL PRINT_SEP
    CALL PRINT_MAG_ROW2
    CALL PRINT_SEP
    CALL PRINT_MAG_ROW3
    
    MOV AH, 9
    LEA DX, ENDL
    INT 21h
    
    CMP MOVESBOX, 9
    JE CHECK_MAGIC_BOX
    

    MOV AH, 9
    LEA DX, MINPUT
    INT 21h
    
    MOV AH, 1
    INT 21h
    SUB AL, 30H
    
    CMP AL, 1
    JL BAD_MAG_INPUT
    CMP AL, 9
    JG BAD_MAG_INPUT
    
    
    ;WE USE HERE USEDBOX AS A MAP IN C++ SO THAT WE CAN TRACK THE UNIQUE NUMBER
    
    MOV BL, AL
    DEC BL                ;WE DEC BL CZ USER GIVE INPUT 1 TO 9 BUT ARRAY INDEX ARE 0 TO 8
    MOV BH, 0
    MOV SI, BX
    CMP USEDBOX[SI], 1
    JE BAD_MAG_INPUT
    
    MOV USEDBOX[SI], 1
    
    MOV BL, MOVESBOX
    MOV BH, 0
    MOV SI, BX
    MOV BOX[SI], AL
    INC MOVESBOX
    JMP MAG_GAME_LOOP
    
    BAD_MAG_INPUT:
    MOV AH, 9
    LEA DX, MINVALID
    INT 21h
    JMP MAG_GAME_LOOP
        
    CHECK_MAGIC_BOX:
    
    ;HERE WE CHCEK ALL COLUMN , ROW AND DAIGONAL SUM IS EUQAL OR NOT
    ;ALL SUM MUST BE UNIQUE , MEANS 15
    
    MOV AL, BOX[0]
    ADD AL, BOX[1]
    ADD AL, BOX[2]
    MOV BL, AL
    
    MOV AL, BOX[3]
    ADD AL, BOX[4]
    ADD AL, BOX[5]
    CMP AL, BL
    JNE MAG_FAIL
    
    MOV AL, BOX[6]
    ADD AL, BOX[7]
    ADD AL, BOX[8]
    CMP AL, BL
    JNE MAG_FAIL
    
    MOV AL, BOX[0]
    ADD AL, BOX[3]
    ADD AL, BOX[6]
    CMP AL, BL
    JNE MAG_FAIL
    
    MOV AL, BOX[1]
    ADD AL, BOX[4]
    ADD AL, BOX[7]
    CMP AL, BL
    JNE MAG_FAIL
    
    MOV AL, BOX[2]
    ADD AL, BOX[5]
    ADD AL, BOX[8]
    CMP AL, BL
    JNE MAG_FAIL
    
    MOV AL, BOX[0]
    ADD AL, BOX[4]
    ADD AL, BOX[8]
    CMP AL, BL
    JNE MAG_FAIL
    
    MOV AL, BOX[2]
    ADD AL, BOX[4]
    ADD AL, BOX[6]
    CMP AL, BL
    JNE MAG_FAIL
    
    ;IF ALL ARE SAME WIN
    MOV AH, 9
    LEA DX, MBWIN
    INT 21h
    JMP PLAY_AGAIN_MENU
    
    MAG_FAIL:
    MOV AH, 9
    LEA DX, MBLOST
    INT 21h
    JMP PLAY_AGAIN_MENU
    
    ;HERE ASK THE PLAYER TO PLAY THE GAMI AGAIN OR BACK
    PLAY_AGAIN_MENU:
    MOV AH, 9
    LEA DX, M_PLAY_AGAIN
    INT 21h
    LEA DX, M_BACK_MENU
    INT 21h
    LEA DX, M_CHOOSE
    INT 21h
    
    MOV AH, 1
    INT 21h
    
    CMP AL, '1'
    JE CHECK_LAST_GAME
    CMP AL, '2'
    JE SHOW_MENU
    JMP PLAY_AGAIN_MENU
    
    CHECK_LAST_GAME:
   
    CMP MOVESBOX, 0          ;IF PLAYER MAGIC BOX NOW THEN MOVEBOX SHOULD BE NOT ZERO IT SHOULD 9
    JE START_MEMORY
    JMP START_MAGIC
    
    
    
    ;PLAYER 1 - GRID PRINT FROM HERE
    
    PRINT_PLAYER1_ROW1:
    MOV AH, 2
    MOV DL, 0DH
    INT 21h
    MOV DL, 0AH
    INT 21h
    MOV DL, ' '
    INT 21h
    
    MOV AL, MEMP1[0]
    CMP AL, 0
    JE EMPTY_P1_1
    
    ADD AL, 30H
    MOV DL, AL
    INT 21h
    JMP CONT_P1_1
    
    EMPTY_P1_1:
    MOV DL, '_'
    INT 21h
    
    CONT_P1_1:
    MOV DL, ' '
    INT 21h
    MOV DL, '|'
    INT 21h
    MOV DL, ' '
    INT 21h
    
    
    
    MOV AL, MEMP1[1]
    CMP AL, 0
    JE EMPTY_P1_2
    
    ADD AL, 30H
    MOV DL, AL
    INT 21h
    JMP CONT_P1_2
    
    EMPTY_P1_2:
    MOV DL, '_'
    INT 21h
    
    CONT_P1_2:
    MOV DL, ' '
    INT 21h
    MOV DL, '|'
    INT 21h
    MOV DL, ' '
    INT 21h
    
    MOV AL, MEMP1[2]
    CMP AL, 0
    JE EMPTY_P1_3
    
    ADD AL, 30H
    MOV DL, AL
    INT 21h
    RET                 ; AFTER TAKE THE 3RD CELL OF COLUM 1 IT WILL RETURN TO WHERE IT CALL FROM
    
    EMPTY_P1_3:
    MOV DL, '_'
    INT 21h
    RET
    
    PRINT_PLAYER1_ROW2:
    MOV AH, 2
    MOV DL, 0DH
    INT 21h
    MOV DL, 0AH
    INT 21h
    MOV DL, ' '
    INT 21h
    
    MOV AL, MEMP1[3]
    CMP AL, 0
    JE EMPTY_P1_4
    
    ADD AL, 30H
    MOV DL, AL
    INT 21h
    JMP CONT_P1_4
    EMPTY_P1_4:
    MOV DL, '_'
    INT 21h
    CONT_P1_4:
    MOV DL, ' '
    INT 21h
    MOV DL, '|'
    INT 21h
    MOV DL, ' '
    INT 21h
    
    MOV AL, MEMP1[4]
    CMP AL, 0
    JE EMPTY_P1_5
    
    ADD AL, 30H
    MOV DL, AL
    INT 21h
    JMP CONT_P1_5
    EMPTY_P1_5:
    MOV DL, '_'
    INT 21h
    CONT_P1_5:
    MOV DL, ' '
    INT 21h
    MOV DL, '|'
    INT 21h
    MOV DL, ' '
    INT 21h
    
    MOV AL, MEMP1[5]
    CMP AL, 0
    JE EMPTY_P1_6
    
    ADD AL, 30H
    MOV DL, AL
    INT 21h
    RET
    EMPTY_P1_6:
    MOV DL, '_'
    INT 21h
    RET
    
    PRINT_PLAYER1_ROW3:
    MOV AH, 2
    MOV DL, 0DH
    INT 21h
    MOV DL, 0AH
    INT 21h
    MOV DL, ' '
    INT 21h
    
    MOV AL, MEMP1[6]
    CMP AL, 0
    JE EMPTY_P1_7
    
    ADD AL, 30H
    MOV DL, AL
    INT 21h
    JMP CONT_P1_7
    EMPTY_P1_7:
    MOV DL, '_'
    INT 21h
    CONT_P1_7:
    MOV DL, ' '
    INT 21h
    MOV DL, '|'
    INT 21h
    MOV DL, ' '
    INT 21h
    
    MOV AL, MEMP1[7]
    CMP AL, 0
    JE EMPTY_P1_8
    
    ADD AL, 30H
    MOV DL, AL
    INT 21h
    JMP CONT_P1_8
    EMPTY_P1_8:
    MOV DL, '_'
    INT 21h
    CONT_P1_8:
    MOV DL, ' '
    INT 21h
    MOV DL, '|'
    INT 21h
    MOV DL, ' '
    INT 21h
    
    MOV AL, MEMP1[8]
    CMP AL, 0
    JE EMPTY_P1_9
    
    ADD AL, 30H
    MOV DL, AL
    INT 21h
    RET
    EMPTY_P1_9:
    MOV DL, '_'
    INT 21h
    RET
    
    ;PLAYER 2 - PRINT FROM HERE
    PRINT_PLAYER2_ROW1:
    MOV AH, 2
    MOV DL, 0DH
    INT 21h
    MOV DL, 0AH
    INT 21h
    MOV DL, ' '
    INT 21h
    
    MOV AL, MEMP2[0]
    CMP AL, 0
    JE EMPTY_P2_1
    
    ADD AL, 30H
    MOV DL, AL
    INT 21h
    JMP CONT_P2_1
    EMPTY_P2_1:
    MOV DL, '_'
    INT 21h
    CONT_P2_1:
    MOV DL, ' '
    INT 21h
    MOV DL, '|'
    INT 21h
    MOV DL, ' '
    INT 21h
    
    MOV AL, MEMP2[1]
    CMP AL, 0
    JE EMPTY_P2_2
    
    ADD AL, 30H
    MOV DL, AL
    INT 21h
    JMP CONT_P2_2
    EMPTY_P2_2:
    MOV DL, '_'
    INT 21h
    CONT_P2_2:
    MOV DL, ' '
    INT 21h
    MOV DL, '|'
    INT 21h
    MOV DL, ' '
    INT 21h
    
    MOV AL, MEMP2[2]
    CMP AL, 0
    JE EMPTY_P2_3
    
    ADD AL, 30H
    MOV DL, AL
    INT 21h
    RET
    EMPTY_P2_3:
    MOV DL, '_'
    INT 21h
    RET
    
    PRINT_PLAYER2_ROW2:
    MOV AH, 2
    MOV DL, 0DH
    INT 21h
    MOV DL, 0AH
    INT 21h
    MOV DL, ' '
    INT 21h
    
    MOV AL, MEMP2[3]
    CMP AL, 0
    JE EMPTY_P2_4
    
    ADD AL, 30H
    MOV DL, AL
    INT 21h
    JMP CONT_P2_4
    EMPTY_P2_4:
    MOV DL, '_'
    INT 21h
    CONT_P2_4:
    MOV DL, ' '
    INT 21h
    MOV DL, '|'
    INT 21h
    MOV DL, ' '
    INT 21h
    
    MOV AL, MEMP2[4]
    CMP AL, 0
    JE EMPTY_P2_5
    
    ADD AL, 30H
    MOV DL, AL
    INT 21h
    JMP CONT_P2_5
    EMPTY_P2_5:
    MOV DL, '_'
    INT 21h
    CONT_P2_5:
    MOV DL, ' '
    INT 21h
    MOV DL, '|'
    INT 21h
    MOV DL, ' '
    INT 21h
    
    MOV AL, MEMP2[5]
    CMP AL, 0
    JE EMPTY_P2_6
    
    ADD AL, 30H
    MOV DL, AL
    INT 21h
    RET
    EMPTY_P2_6:
    MOV DL, '_'
    INT 21h
    RET
    
    PRINT_PLAYER2_ROW3:
    MOV AH, 2
    MOV DL, 0DH
    INT 21h
    MOV DL, 0AH
    INT 21h
    MOV DL, ' '
    INT 21h
    
    MOV AL, MEMP2[6]
    CMP AL, 0
    JE EMPTY_P2_7
    ADD AL, '0'
    MOV DL, AL
    INT 21h
    JMP CONT_P2_7
    EMPTY_P2_7:
    MOV DL, '_'
    INT 21h
    CONT_P2_7:
    MOV DL, ' '
    INT 21h
    MOV DL, '|'
    INT 21h
    MOV DL, ' '
    INT 21h
    
    MOV AL, MEMP2[7]
    CMP AL, 0
    JE EMPTY_P2_8
    ADD AL, '0'
    MOV DL, AL
    INT 21h
    JMP CONT_P2_8
    EMPTY_P2_8:
    MOV DL, '_'
    INT 21h
    CONT_P2_8:
    MOV DL, ' '
    INT 21h
    MOV DL, '|'
    INT 21h
    MOV DL, ' '
    INT 21h
    
    MOV AL, MEMP2[8]
    CMP AL, 0
    JE EMPTY_P2_9
    
    ADD AL, 30H
    MOV DL, AL
    INT 21h
    RET
    EMPTY_P2_9:
    MOV DL, '_'
    INT 21h
    RET
    
    ;MAGIC BOX - GRID PRINT FROM HERE
    PRINT_MAG_ROW1:
    MOV AH, 2
    MOV DL, 0DH
    INT 21h
    MOV DL, 0AH
    INT 21h
    MOV DL, ' '
    INT 21h
    
    MOV AL, BOX[0]
    CMP AL, 0
    JE EMPTY_M1
    
    ADD AL, 30H
    MOV DL, AL
    INT 21h
    JMP CONT_M1
    EMPTY_M1:
    MOV DL, '_'
    INT 21h
    CONT_M1:
    MOV DL, ' '
    INT 21h
    MOV DL, '|'
    INT 21h
    MOV DL, ' '
    INT 21h
    
    MOV AL, BOX[1]
    CMP AL, 0
    JE EMPTY_M2
    ADD AL, '0'
    MOV DL, AL
    INT 21h
    JMP CONT_M2
    EMPTY_M2:
    MOV DL, '_'
    INT 21h
    CONT_M2:
    MOV DL, ' '
    INT 21h
    MOV DL, '|'
    INT 21h
    MOV DL, ' '
    INT 21h
    
    MOV AL, BOX[2]
    CMP AL, 0
    JE EMPTY_M3
    
    ADD AL, 30H
    MOV DL, AL
    INT 21h
    RET
    EMPTY_M3:
    MOV DL, '_'
    INT 21h
    RET
    
    PRINT_MAG_ROW2:
    MOV AH, 2
    MOV DL, 0DH
    INT 21h
    MOV DL, 0AH
    INT 21h
    MOV DL, ' '
    INT 21h
    
    MOV AL, BOX[3]
    CMP AL, 0
    JE EMPTY_M4
    ADD AL, 30H
    MOV DL, AL
    INT 21h
    JMP CONT_M4
    EMPTY_M4:
    MOV DL, '_'
    INT 21h
    CONT_M4:
    MOV DL, ' '
    INT 21h
    MOV DL, '|'
    INT 21h
    MOV DL, ' '
    INT 21h
    
    MOV AL, BOX[4]
    CMP AL, 0
    JE EMPTY_M5
    
    ADD AL, 30H
    MOV DL, AL
    INT 21h
    JMP CONT_M5
    EMPTY_M5:
    MOV DL, '_'
    INT 21h
    CONT_M5:
    MOV DL, ' '
    INT 21h
    MOV DL, '|'
    INT 21h
    MOV DL, ' '
    INT 21h
    
    MOV AL, BOX[5]
    CMP AL, 0
    JE EMPTY_M6
    
    ADD AL, 30H
    MOV DL, AL
    INT 21h
    RET
    EMPTY_M6:
    MOV DL, '_'
    INT 21h
    RET
    
    PRINT_MAG_ROW3:
    MOV AH, 2
    MOV DL, 0DH
    INT 21h
    MOV DL, 0AH
    INT 21h
    MOV DL, ' '
    INT 21h
    
    MOV AL, BOX[6]
    CMP AL, 0
    JE EMPTY_M7
    
    ADD AL, 30H
    MOV DL, AL
    INT 21h
    JMP CONT_M7
    EMPTY_M7:
    MOV DL, '_'
    INT 21h
    CONT_M7:
    MOV DL, ' '
    INT 21h
    MOV DL, '|'
    INT 21h
    MOV DL, ' '
    INT 21h
    
    MOV AL, BOX[7]
    CMP AL, 0
    JE EMPTY_M8
    
    ADD AL, 30H
    MOV DL, AL
    INT 21h
    JMP CONT_M8
    EMPTY_M8:
    MOV DL, '_'
    INT 21h
    CONT_M8:
    MOV DL, ' '
    INT 21h
    MOV DL, '|'
    INT 21h
    MOV DL, ' '
    INT 21h
    
    MOV AL, BOX[8]
    CMP AL, 0
    JE EMPTY_M9
    
    ADD AL, 30H
    MOV DL, AL
    INT 21h
    RET
    EMPTY_M9:
    MOV DL, '_'
    INT 21h
    RET
    
    PRINT_SEP:
    MOV AH, 2
    MOV DL, 0DH
    INT 21h
    MOV DL, 0AH
    INT 21h
    
    MOV AH, 9
    LEA DX, ROWLINE
    INT 21h
    RET
    
    EXIT: 
    LEA DX, M_THANK
    MOV AH, 9
    INT 21H
    
    
    MOV AH, 4CH
    INT 21h
    MAIN ENDP
END MAIN
