

;  PATH  D:\Microsoft VS Code\Irvine Library\irvine;%(AdditionalLibraryDirectories)
.386
.model flat,stdcall
.stack 4096



INCLUDE Irvine32.inc
INCLUDE macros.inc

includelib Winmm.lib

PlaySound PROTO,
        pszSound:PTR BYTE, 
        hmod:DWORD, 
        fdwSound:DWORD


ExitProcess PROTO, dwExitCode: DWORD


.data

gameTitle byte "                                                                                                                        ", 0ah, 0
         byte " .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .-----------------.", 0ah, 0
         byte "| .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |", 0ah, 0
         byte "| |   ______     | || |      __      | || |     ______   | || | ____    ____ | || |      __      | || | ____  _____  | |", 0ah, 0
         byte "| |  |_   __ \   | || |     /  \     | || |   .' ___  |  | || ||_   \  /   _|| || |     /  \     | || ||_   \|_   _| | |", 0ah, 0
         byte "| |    | |__) |  | || |    / /\ \    | || |  / .'   \_|  | || |  |   \/   |  | || |    / /\ \    | || |  |   \ | |   | |", 0ah, 0
         byte "| |    |  ___/   | || |   / ____ \   | || |  | |         | || |  | |\  /| |  | || |   / ____ \   | || |  | |\ \| |   | |", 0ah, 0
         byte "| |   _| |_      | || | _/ /    \ \_ | || |  \ `.___.'\  | || | _| |_\/_| |_ | || | _/ /    \ \_ | || | _| |_\   |_  | |", 0ah, 0
         byte "| |  |_____|     | || ||____|  |____|| || |   `._____.'  | || ||_____||_____|| || ||____|  |____|| || ||_____|\____| | |", 0ah, 0
         byte "| |              | || |              | || |              | || |              | || |              | || |              | |", 0ah, 0
         byte "| '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |", 0ah, 0
         byte " '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------' ", 0ah, 0


menuTitle byte "                                   __  __       _         __  __                   ",0ah,0
          byte "                                  |  \/  |     (_)       |  \/  |                  ",0ah,0
          byte "                                  | \  / | __ _ _ _ __   | \  / | ___ _ __  _   _  ",0ah,0
          byte "                                  | |\/| |/ _` | | '_ \  | |\/| |/ _ \ '_ \| | | | ",0ah,0
          byte "                                  | |  | | (_| | | | | | | |  | |  __/ | | | |_| | ",0ah,0
          byte "                                  |_|  |_|\__,_|_|_| |_| |_|  |_|\___|_| |_|\__,_| ",0ah,0
                                                 

instrucTitle    byte"                          _____           _                   _   _                 ",0ah,0 
                byte"                         |_   _|         | |                 | | (_)                ",0ah,0
                byte"                           | |  _ __  ___| |_ _ __ _   _  ___| |_ _  ___  _ __  ___ ",0ah,0
                byte"                           | | | '_ \/ __| __| '__| | | |/ __| __| |/ _ \| '_ \/ __|",0ah,0
                byte"                          _| |_| | | \__ \ |_| |  | |_| | (__| |_| | (_) | | | \__ \",0ah,0
                byte"                         |_____|_| |_|___/\__|_|   \__,_|\___|\__|_|\___/|_| |_|___/",0ah,0
                                                            


levelComp byte"                                    _                    _                              ",0ah   
          byte"                                   | |                  | |                             ",0ah
          byte"                                   | |     _____   _____| |                             ",0ah
          byte"                                   | |    / _ \ \ / / _ \ |                             ",0ah
          byte"                                   | |___|  __/\ V /  __/ |                             ",0ah
          byte"                                   |______\___| \_/ \___|_|     _      _           _ _  ",0ah
          byte"                                    / ____|                    | |    | |         | | | ",0ah
          byte"                                   | |     ___  _ __ ___  _ __ | | ___| |_ ___  __| | | ",0ah
          byte"                                   | |    / _ \| '_ ` _ \| '_ \| |/ _ \ __/ _ \/ _` | | ",0ah
          byte"                                   | |___| (_) | | | | | | |_) | |  __/ ||  __/ (_| |_| ",0ah
          byte"                                    \_____\___/|_| |_| |_| .__/|_|\___|\__\___|\__,_(_) ",0ah
          byte"                                                         | |                            ",0ah
          byte"                                                         |_|                            ",0ah,0
                                                                                                     


OverTitle byte"                                        _____                      ",0ah
        byte"                                       / ____|                      ",0ah
        byte"                                      | |  __  __ _ _ __ ___   ___  ",0ah
        byte"                                      | | |_ |/ _` | '_ ` _ \ / _ \ ",0ah
        byte"                                      | |__| | (_| | | | | | |  __/ ",0ah
        byte"                                       \_____|\__,_|_| |_| |_|\___| ",0ah
        byte"                                       / __ \               | |     ",0ah
        byte"                                      | |  | |_   _____ _ __| |     ",0ah
        byte"                                      | |  | \ \ / / _ \ '__| |     ",0ah
        byte"                                      | |__| |\ V /  __/ |  |_|     ",0ah
        byte"                                       \____/  \_/ \___|_|  (_)     ",0ah,0
                         

CompletedTitle byte"                                     _____                                              ",0ah
 byte"                                    |  __ \                                             ",0ah
 byte"                                    | |  \/ __ _ _ __ ___   ___                         ",0ah
 byte"                                    | | __ / _` | '_ ` _ \ / _ \                        ",0ah
 byte"                                    | |_\ \ (_| | | | | | |  __/                        ",0ah
 byte"                                     \____/\__,_|_| |_| |_|\___|                        ",0ah
 byte"                                                                                        ",0ah
 byte"                                                                                        ",0ah
 byte"                                     _____                       _      _           _ _ ",0ah
 byte"                                    /  __ \                     | |    | |         | | |",0ah
 byte"                                    | /  \/ ___  _ __ ___  _ __ | | ___| |_ ___  __| | |",0ah
 byte"                                    | |    / _ \| '_ ` _ \| '_ \| |/ _ \ __/ _ \/ _` | |",0ah
 byte"                                    | \__/\ (_) | | | | | | |_) | |  __/ ||  __/ (_| |_|",0ah
 byte"                                     \____/\___/|_| |_| |_| .__/|_|\___|\__\___|\__,_(_)",0ah
 byte"                                                          | |                           ",0ah
 byte"                                                          |_|                           ",0ah,0




highScoreTitle byte"                                    _    _ _____ _____ _    _  _____  _____ ____  _____  ______  _____ ",0ah
 byte"                                   | |  | |_   _/ ____| |  | |/ ____|/ ____/ __ \|  __ \|  ____|/ ____|              ",0ah
 byte"                                   | |__| | | || |  __| |__| | (___ | |   | |  | | |__) | |__  | (___                ",0ah
 byte"                                   |  __  | | || | |_ |  __  |\___ \| |   | |  | |  _  /|  __|  \___ \               ",0ah
 byte"                                   | |  | |_| || |__| | |  | |____) | |___| |__| | | \ \| |____ ____) |              ",0ah
 byte"                                   |_|  |_|_____\_____|_|  |_|_____/ \_____\____/|_|  \_\______|_____/               ",0ah,0
                                                                     



map1 byte "------------------------------------------------------------------------------------------------------------------------", 0ah, 0
    byte  "|                                                                                                                      |", 0ah, 0     
    byte  "|                                                                                                                      |", 0ah, 0 
    byte  "|               .    |                             .    |    .                                     |    .              |", 0ah, 0         
    byte  "|               .    |                             .    |    .                                     |    .              |", 0ah, 0             
    byte  "|               .    |                             .    |    .                                     |    .              |", 0ah, 0                           
    byte  "|               .    |                             .    |    .                                     |    .              |", 0ah, 0                                     
    byte  "|               .    |                             .    |    .                                     |    .              |", 0ah, 0  
    byte  "|               .    |                             .    |    .                                     |    .              |", 0ah, 0 
    byte  "|               .    |                             .    |    .                                     |    .              |", 0ah, 0              
    byte  "|               .    |                             .    |    .                                     |    .              |", 0ah, 0  
    byte  "| . . . . . . . .    |             . . . . . . . . .    |    . . . . . . . . . . .                 |    . . . . . . . .|", 0ah, 0      
    byte  "| .                  |                                  |                                          |                  .|", 0ah, 0           
    byte  "| .   ---------------|            ------------------------------------------------                 |---------------   .|", 0ah, 0             
    byte  "| .                  |                                  |                                          |                  .|", 0ah, 0     
    byte  "| . . . . . . . .    |            . . . . . . . . . .   |    . . . . . . . . . . .                 |    . . . . . . . .|", 0ah, 0 
    byte  "|               .    |                              .   |    .                                     |    .              |", 0ah, 0 
    byte  "|               .    |                              .   |    .                                     |    .              |", 0ah, 0 
    byte  "|               .    |                              .   |    .                                     |    .              |", 0ah, 0 
    byte  "|               .    |                              .   |    .                                     |    .              |", 0ah, 0 
    byte  "|               .    |                              .   |    .                                     |    .              |", 0ah, 0    
    byte  "|               .    |                              .   |    .                                     |    .              |", 0ah, 0  
    byte  "|               .    |                              .   |    .                                     |    .              |", 0ah, 0 
    byte  "|               .    |                              .   |    .                                     |    .              |", 0ah, 0             
    byte  "|                                                                                                                      |", 0ah, 0  
    byte  "|                                                                                                                      |", 0ah, 0  
    byte  "|                                                                                                                      |", 0ah, 0 
    byte  "------------------------------------------------------------------------------------------------------------------------", 0ah, 0             



map2 byte "------------------------------------------------------------------------------------------------------------------------", 0ah, 0
    byte  "|  . . . . . . . . . .   |       . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .   |  . . . . . . . . . .  |", 0ah, 0     
    byte  "|  .                 .   |       .                                                         .   |  .                 .  |", 0ah, 0
    byte  "|  .             |   .   |       .      -------------------------------------------------  .   |  .        |        .  |", 0ah, 0     
    byte  "|  .             |   .   |       .      |    . . . . . .                 . . . . .  .   |  .   |  .        |        .  |", 0ah, 0
    byte  "|  .             |   .   |       .      |    .         .                 .          .   |  .   |  .        |        .  |", 0ah, 0     
    byte  "|  . . . . . .   |   .   |       .      |    .         .                 .          .   |  .   |  .        |        .  |", 0ah, 0
    byte  "|---------   .   |   .   |       .      |    .         .     -------     .          .   |  .   |  .        |        .  |", 0ah, 0     
    byte  "|  . . . . . .   |   .   |       .      |    .         .                 .          .   |  .   |  .        |        .  |", 0ah, 0
    byte  "|  .             |   .           .      |    .         .                 .          .   |  .   |  .        |        .  |", 0ah, 0     
    byte  "|  .             |   . . . . . . .      |    .         . . . . . . . . . .          .      .   |  .        |        .  |", 0ah, 0
    byte  "|  . . . . . .   |   .   ----------------    .  -------------       -------------   . . .  .   |  .                 .  |", 0ah, 0     
    byte  "|---------   .   |   .   |       . . . . . . .  |                               |              |  . . . . . . . . . .  |", 0ah, 0     
    byte  "|  . . . . . .   |   .   |       .              |                               |              -----------    ---------|", 0ah, 0     
    byte  "|  .             |   .   |       .      |       |                               |                        |    |        |", 0ah, 0     
    byte  "|  .             |   .   |       .      |       ---------------------------------                        |    |        |", 0ah, 0     
    byte  "|  . . . . . .   |   .           .      |                   |       |                                    |    |        |", 0ah, 0     
    byte  "|---------   .   |   . . . . . . .      |                   |   .   |                                                  |", 0ah, 0     
    byte  "|  . . . . . .   |   .                  |         |         |   .   |                                                  |", 0ah, 0     
    byte  "|  .             |   .   ----------------         |         |   .   |                                                  |", 0ah, 0    
    byte  "|  .             |   .   |                        |         |   .   |      ----------------    |                       |", 0ah, 0     
    byte  "|  . . . . .     |   .   |  . . . . . . .         |             .                              |                       |", 0ah, 0     
    byte  "|---------       |   .   |  . . . . . . .         |                                            | . . . . . . . . . . . |", 0ah, 0     
    byte  "|                |   .   |                                                                     | .   --------------  . |", 0ah, 0     
    byte  "|   . .          --------------------------------------------       ---------------------------| . . . . . . . . . . . |", 0ah, 0     
    byte  "|   . .          . .  . .  . .                                                  . .  . .  . .  |                       |", 0ah, 0     
    byte  "|                . .  . .  . .                                                  . .  . .  . .  |                       |", 0ah, 0     
    byte  "------------------------------------------------------------------------------------------------------------------------", 0ah, 0
       



map3 byte "------------------------------------------------------------------------------------------------------------------------", 0ah, 0
    byte  "|  . . . . . . . . . .   |       . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .   |  . . . . . . . .  .   |", 0ah, 0     
    byte  "|  .                 .   |       .                                                         .   |  .                .   |", 0ah, 0
    byte  "|  .   -----------   .   |       .      ---------------------       ----------------    |  .   |  .   -----------  .   |", 0ah, 0     
    byte  "|  .             |   .   |       .      |    . . . . . .    |       |    .  . . .  .    |  .   |  .             |  .   |", 0ah, 0
    byte  "|  .             |   .   |       .      |    .         .    |       |    .         .    |  .   |  . . . .  .    |  .   |", 0ah, 0     
    byte  "|  . . . . . .   |   .   |       .      |    .    |    .    |       |    .    |    .    |  .   |           .    |  .   |", 0ah, 0
    byte  "|----------  .   |   .   |       .      |    .    |    .    |       |    .    |    .    |  .   ---------   .       .   |", 0ah, 0     
    byte  "|  . . . . . .   |   .   |       .      |    .    |    .    ---------    .    |    .    |  .           |   . . . . .   |", 0ah, 0
    byte  "|  .             |   .   |       .      |    .    |    .                 .    |    .    |              |               |", 0ah, 0     
    byte  "|  .    ---------|   . . . . . . .      |    .    |    . . . . . . . . . .    |                        ----------      |", 0ah, 0
    byte  "|  . . . . . .   |   .   ----------------    .  -------------       -------------   .                                  |", 0ah, 0     
    byte  "|            .   |   .   |  .  . . . . . . . .  |                               |   .   ----------------   .   |   .   |", 0ah, 0     
    byte  "|---------   .   |   .   |  .                .  |                               |   .   |   . . . . .  |   .   |   .   |", 0ah, 0     
    byte  "|  . . . . . .   |   .   |  .  -----     |   .  |                               |   .   |   .       .  |   .   |   .   |", 0ah, 0     
    byte  "|  .             |   .   |  .    |       |   .  ---------------------------------   .   |   .   |   .  |   .   |   .   |", 0ah, 0     
    byte  "|  .    ---------|   .      .    |       |   .              |       |               .   |   .   |   .  |   .   |   .   |", 0ah, 0     
    byte  "|  . . . . . .   |   .  . . .    |           . . .          |   .   |      .  . . . .   |   .   |   .      .   |   .   |", 0ah, 0     
    byte  "|  .             |               |                .  |      |   .   |    | .            |   .   |   . . . .    |   .   |", 0ah, 0     
    byte  "|  . ---------------------       --------------   .  |      |   .   |    | .  -----------       ----------------   .   |", 0ah, 0    
    byte  "|  .                                | . . . . . . .  |      |   .   |    | .                                       .   |", 0ah, 0     
    byte  "|  . . . . . . . . . . . . . . .    | .              |          .        | . . . . . . . . . . . . . . . . . . . . .   |", 0ah, 0     
    byte  "|  .                                | . . . . . . . . . . . . . .        |                                         .   |", 0ah, 0     
    byte  "|  .  -----------------------------------------------------------------------------------------------------------  .   |", 0ah, 0     
    byte  "|  .      |                   |                   |                   |                   |                   |    .   |", 0ah, 0     
    byte  "|  .  . . | . . . . | . . . . | . . . . | . . . . | . . . . | . . . . | . . . . | . . . . | . . . . | . . . . | .  .   |", 0ah, 0     
    byte  "|                   |                   |                   |                   |                   |                  |", 0ah, 0     
    byte  "------------------------------------------------------------------------------------------------------------------------", 0ah, 0
                                                       
    



mapWidth=122

CurrentMap DB 1  ;by defualt current map is 1

playerNAME DB 25 DUP(?)
playerNAMEWidth=25
sizeOfPlayer BYTE 0

tempLoops DB ?

strScore BYTE " Score: ",0
score BYTE 0
FinalScore BYTE 0

reuiredScore1 DB 15   ;146 total     ;Here i've kept this as a lower number for levels to end quiclkly XD, you can increase it
reuiredScore2 DB 15   ;316
reuiredScore3 DB 15   ;380

PacmanLives DB 3

strName BYTE " Name: ",0
strLives BYTE " Lives: ",0

xPos BYTE 64
yPos BYTE 19

xPosFruit BYTE 64
yPosFruit BYTE 19
isFruitCollected BYTE 0

counter DB 0

xPosGhost BYTE 62,64,66
yPosGhost BYTE 13,13,13

GhostCount DB 3

bool1 DB 0
boolG1 DB 1,0,0,0     ;[0] for UP, [1] for DOWN, [2] for right, [3] for left
boolG2 DB 1,0,0,0     ;[0] for UP, [1] for DOWN, [2] for right, [3] for left
boolG3 DB 1,0,0,0     ;[0] for UP, [1] for DOWN, [2] for right, [3] for left
boolG4 DB 1,0,0,0     ;[0] for UP, [1] for DOWN, [2] for right, [3] for left

inputChar BYTE ?
previousinput BYTE ?

PacManSpeed DD 5
GhostSpeed DD 20

	pacman_beginning db 'assets/pacman_beginning.wav',0 
	pacman_theme	db 'assets/Pac-man theme remix.wav',0  
	pacman_eating	db 'assets/PacMan Eating.wav',0  
	pacman_winning db 'assets/PacMan Winning.wav',0  
	pacman_death db 'assets/pacman-Dying.wav',0  
	pacman_outro db 'assets/GameOutro.wav',0  
	suspense db 'assets/Suspense.wav',0  

filename BYTE "HighScores.txt",0
filesize DD 500
fileHandle HANDLE ?

storeThemNames DB 800 DUP(?)
SizeTemp DD ?

.code
main PROC

    mov eax, 20
    call WriteDec
    call Clrscr

    call startScreen
    call Clrscr

    call Level1
    call LevelCompleted

out1::
    mov score,0
    call clrscr
    call ResetPlayerGhost

    call Level2
    call LevelCompleted
out2::
     mov score,0
     call clrscr
     call ResetPlayerGhost
     call Level3
out3::
    call GameCompleted

INVOKE ExitProcess,0

main ENDP
;///////////////////////////////////////////////////////////////////////////////////////////////////

Level1 PROC
    mov CurrentMap,1
    call DrawMap
    call DrawPlayer
    call DrawGhosts

    mov eax, white
    call SetTextColor
        mov dl,30
        mov dh,0
        call Gotoxy
        mov edx,OFFSET strName
        call WriteString
         mov eax, blue
            call SetTextColor
        mov edx,OFFSET playerNAME
        call WriteString

INVOKE PlaySound,NULL, NULL, 0
INVOKE PlaySound, OFFSET pacman_theme, NULL,11h

    gameLoop1::

        call PlayerGhostCollision

        call GhostMovement
        backToMain1::

        call checkScore

        mov bl,score
        cmp bl, reuiredScore1
            jge LevelCompleted


        mov eax,white (black * 16)
        call SetTextColor

;//////////////////////////////////////

        ; draw score:
        mov dl,0
        mov dh,0
        call Gotoxy
        mov edx,OFFSET strScore
        call WriteString
        mov al,score
        call WriteDec

        mov eax, lightred
        call SetTextColor
        mov dl,55
        mov dh,0
        call Gotoxy
        mov edx,OFFSET strLives
        call WriteString
        mov eax, white
        call SetTextColor    
    
        mov al,PacmanLives
        call WriteDec

;//////////////////////////////////////

        ; get user key input:
        call ReadKey
        ;mov inputChar,al
        jz NoInput

		mov bl, inputChar
		mov previousinput, bl
		mov inputChar,al

        NoInput:
        ; exit game if user types 'x':
        cmp inputChar,"x"
        je exitGame

        cmp inputChar,"p"
            je pauseScreen

        cmp inputChar,"w"
        je moveUp

        cmp inputChar,"s"
        je moveDown

        cmp inputChar,"a"
        je moveLeft

        cmp inputChar,"d"
        je moveRight

        jne gameLoop1

        moveUp:
            mov bl,yPos
            cmp bl,2
            jle gameLoop1
            
            call checkUPCollision

        mov eax, PacManSpeed		;slow down the moving
		add eax, PacManSpeed
		call delay
		call UpdatePlayer	
		mov ah, yPos
		mov al, xPos  	;al ah stores the pos of Pacman 
 
        call UpdatePlayer
        dec yPos
        call DrawPlayer
        mov eax,70
        call Delay
        
        jmp gameLoop1

        moveDown:
            mov bl,yPos
            cmp bl,27
            je gameLoop1
            call checkDOWNCollision


        mov eax, PacManSpeed		;slow down the moving
		add eax, PacManSpeed
		call delay
		call UpdatePlayer	
		mov ah, yPos
		mov al, xPos  	;al ah stores the pos of pacman 
		inc yPos	
		call DrawPlayer

        jmp gameLoop1
       
        moveLeft:
            mov bl,xPos
            cmp bl,1
            je gameLoop1
            call checkLEFTCollision
           
        
        mov eax, PacManSpeed		;slow down the moving
		add eax, PacManSpeed
		call delay
		call UpdatePlayer	
		mov ah, yPos
		mov al, xPos  	;al ah stores the pos of pacman 
		dec xPos
		call DrawPlayer


        jmp gameLoop1


        moveRight:
            mov bl,xPos
            cmp bl,118
            je gameLoop
            call checkRIGHTCollision
            

        mov eax, PacManSpeed		;slow down the moving
		add eax, PacManSpeed
		call delay
		call UpdatePlayer	
		mov ah, yPos
		mov al, xPos  	;al ah stores the pos of pacman 
		inc xPos
		call DrawPlayer

        jmp gameLoop1

    jmp gameLoop1


    pauseScreen:
       call PauseGame
       jmp gameLoop1


    exitGame:
    exit

LevelCompleted:
ret
Level1 ENDP

;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Level2 PROC    
    mov CurrentMap,2

    call DrawMap

    call DrawPlayer

    call DrawGhosts

    mov eax, white
    call SetTextColor
        mov dl,30
        mov dh,0
        call Gotoxy
        mov edx,OFFSET strName
        call WriteString
         mov eax, blue
            call SetTextColor
        mov edx,OFFSET playerNAME
        call WriteString

INVOKE PlaySound,NULL, NULL, 0
INVOKE PlaySound, OFFSET pacman_theme, NULL,11h


mov counter,0
mov isFruitCollected,0

    gameLoop2::

        call PlayerGhostCollision


    cmp isFruitCollected,1
        je continu

        inc counter
        mov dl, counter

        cmp dl, 50
            jb continu
        cmp dl, 180
            ja continu

    mov bl, xPos
    mov bh, yPos
   
    cmp bl, xPosfruit
       jne conti3
    cmp bh, yPosfruit
       jne conti3

    mov dl, 70
    mov dh, 0
    call gotoxy


    mwrite "       Fruit Collected! +25 in Score!"
    mov isFruitCollected,1
    mov bl,25
    add score,bl
    add reuiredScore2,bl
    jmp continu

conti3:

        mov dl,xposfruit
        mov dh,yposfruit
        call Gotoxy

        mov eax,green
        call SetTextColor

        mov al, "*"
        call WriteCHAR


continu:

        call GhostMovement
        backToMain2::

        call checkScore




        mov bl,score
        cmp bl, reuiredScore2
            jge LevelCompleted

        mov eax,white (black * 16)
        call SetTextColor


        ; draw score:
        mov dl,0
        mov dh,0
        call Gotoxy
        mov edx,OFFSET strScore
        call WriteString
        mov al,score
        call WriteInt

        mov eax, lightred
        call SetTextColor
        mov dl,55
        mov dh,0
        call Gotoxy
        mov edx,OFFSET strLives
        call WriteString
        mov eax, white
        call SetTextColor    
    
        mov al,PacmanLives
        call WriteDec


        ; get user key input:
        call ReadKey
        ;mov inputChar,al
        jz NoInput

		mov bl, inputChar
		mov previousinput, bl
		mov inputChar,al

        NoInput:

        ; exit game if user types 'x':
        cmp inputChar,"x"
        je exitGame

        cmp inputChar,"p"
            je pauseScreen

        cmp inputChar,"w"
        je moveUp

        cmp inputChar,"s"
        je moveDown

        cmp inputChar,"a"
        je moveLeft

        cmp inputChar,"d"
        je moveRight

        jne gameLoop2


        moveUp:
            mov bl,yPos
            cmp bl,2
            jle gameLoop
            
            call checkUPCollision


        mov eax, PacManSpeed		;slow down the moving
		add eax, PacManSpeed
		call delay
		call UpdatePlayer	
		mov ah, yPos
		mov al, xPos  	;al ah stores the pos of pacman 

        mov ecx,1

        jumpLoop:
 
            call UpdatePlayer
            dec yPos
            call DrawPlayer
            mov eax,70
            call Delay
        
        loop jumpLoop
        jmp gameLoop2


        moveDown:
            mov bl,yPos
            cmp bl,27
            je gameLoop2
            call checkDOWNCollision


        mov eax, PacManSpeed		;slow down the moving
		add eax, PacManSpeed
		call delay
		call UpdatePlayer	
		mov ah, yPos
		mov al, xPos  	;al ah stores the pos of pacman 
		inc yPos	
		call DrawPlayer

        jmp gameLoop2

       
        moveLeft:
            mov bl,xPos
            cmp bl,1
            je gameLoop2
            call checkLEFTCollision

        
        mov eax, PacManSpeed		;slow down the moving
		add eax, PacManSpeed
		call delay
		call UpdatePlayer	
		mov ah, yPos
		mov al, xPos  	;al ah stores the pos of pacman 
		dec xPos
		call DrawPlayer


        jmp gameLoop2


        moveRight:
            mov bl,xPos
            cmp bl,118
            je gameLoop
            call checkRIGHTCollision
            

        mov eax, PacManSpeed		;slow down the moving
		add eax, PacManSpeed
		call delay
		call UpdatePlayer	
		mov ah, yPos
		mov al, xPos  	;al ah stores the pos of pacman 
		inc xPos
		call DrawPlayer

        jmp gameLoop2

    jmp gameLoop2


    pauseScreen:
       call PauseGame
       jmp gameLoop2


    exitGame:
    exit
LevelCompleted:
ret
Level2 ENDP



;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////


Level3 PROC
    mov bl,3
    mov CurrentMap,bl
    call DrawMap
    call DrawPlayer
    call DrawGhosts

    mov eax, white
    call SetTextColor
        mov dl,30
        mov dh,0
        call Gotoxy
        mov edx,OFFSET strName
        call WriteString
         mov eax, blue
            call SetTextColor
        mov edx,OFFSET playerNAME
        call WriteString


INVOKE PlaySound,NULL, NULL, 0
INVOKE PlaySound, OFFSET pacman_theme, NULL,11h


mov isFruitCollected,0
mov counter,0
    gameLoop::

        call PlayerGhostCollision

    cmp isFruitCollected,1
        je continu

        inc counter
        mov dl, counter

        cmp dl, 50
            jb continu
        cmp dl, 180
            ja continu

    mov bl, xPos
    mov bh, yPos
   
    cmp bl, xPosfruit
       jne conti3
    cmp bh, yPosfruit
       jne conti3

    mov dl, 70
    mov dh, 0
    call gotoxy


    mwrite "       Fruit Collected! +25 in Score!"
    mov isFruitCollected,1
    mov bl,25
    add score,bl
    add reuiredScore3,bl
    jmp continu

conti3:
            
        mov dl,xposfruit
        mov dh,yposfruit
        call Gotoxy

        mov eax,green
        call SetTextColor

        mov al, "*"
        call WriteCHAR


continu:



        call GhostMovement
        backToMain::

        call checkScore

        mov bl,score
        cmp bl, reuiredScore3
            jge LevelCompleted01

        mov eax,white (black * 16)
        call SetTextColor


        ; draw score:
        mov dl,0
        mov dh,0
        call Gotoxy
        mov edx,OFFSET strScore
        call WriteString
        mov al,score
        call WriteInt


        mov eax, lightred
        call SetTextColor
        mov dl,55
        mov dh,0
        call Gotoxy
        mov edx,OFFSET strLives
        call WriteString
        mov eax, white
        call SetTextColor    
    
        mov al,PacmanLives
        call WriteDec


        ; get user key input:
        call ReadKey
        ;mov inputChar,al
        jz NoInput

		mov bl, inputChar
		mov previousinput, bl
		mov inputChar,al

        NoInput:

        ; exit game if user types 'x':
        cmp inputChar,"x"
        je exitGame

        cmp inputChar,"p"
            je pauseScreen

        cmp inputChar,"w"
        je moveUp

        cmp inputChar,"s"
        je moveDown

        cmp inputChar,"a"
        je moveLeft

        cmp inputChar,"d"
        je moveRight

        jne gameLoop


        moveUp:
            mov bl,yPos
            cmp bl,2
            jle gameLoop
            
            call checkUPCollision


        mov eax, PacManSpeed		;slow down the moving
		add eax, PacManSpeed
		call delay
		call UpdatePlayer	
		mov ah, yPos
		mov al, xPos  	;al ah stores the pos of pacman 

        mov ecx,1


        jumpLoop:
 
            call UpdatePlayer
            dec yPos
            call DrawPlayer
            mov eax,70
            call Delay
        
        loop jumpLoop
        jmp gameLoop


        moveDown:
            mov bl,yPos
            cmp bl,27
            je gameLoop
            call checkDOWNCollision


        mov eax, PacManSpeed		;slow down the moving
		add eax, PacManSpeed
		call delay
		call UpdatePlayer	
		mov ah, yPos
		mov al, xPos  	;al ah stores the pos of pacman 
		inc yPos	
		call DrawPlayer

        jmp gameLoop

       
        moveLeft:
            mov bl,xPos
            cmp bl,1
            je gameLoop
            call checkLEFTCollision
                    
        mov eax, PacManSpeed		;slow down the moving
		add eax, PacManSpeed
		call delay
		call UpdatePlayer	
		mov ah, yPos
		mov al, xPos  	;al ah stores the pos of pacman 
		dec xPos
		call DrawPlayer


        jmp gameLoop


        moveRight:
            mov bl,xPos
            cmp bl,118
            je gameLoop
            call checkRIGHTCollision
            

        mov eax, PacManSpeed		;slow down the moving
		add eax, PacManSpeed
		call delay
		call UpdatePlayer	
		mov ah, yPos
		mov al, xPos  	;al ah stores the pos of pacman 
		inc xPos
		call DrawPlayer

        jmp gameLoop

    jmp gameLoop


    pauseScreen:
       call PauseGame
       jmp gameLoop


    exitGame:
    exit
LevelCompleted01:
call GameCompleted

ret
Level3 ENDP




;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////


PlayerGhostCollision PROC

    cmp PacmanLives,0
        jne conti
    CALL GameOver


conti:
    mov esi,-1
    
    mov bl, xPos
    mov bh, yPos
   
    mov ecx,0
    mov cl,GhostCount
    CheckGhosts:
        inc esi
        cmp bl, xPosGhost[esi]
            jne checkAgain
        cmp bh, yPosGhost[esi]
            jne checkAgain
        
        dec PacmanLives

checkAgain:
    loop CheckGhosts
            
ret
PlayerGhostCollision ENDP


;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////


ResetPlayerGhost PROC

    mov xpos,64
    mov ypos,19

    mov esi,-1


    mov bl, 62
    mov bh, 14
   
    mov ecx,0
    mov cl,GhostCount
    ResetGhosts:
        inc esi
        mov xPosGhost[esi], bl
        mov yPosGhost[esi],bh
        add bl,2 
    loop ResetGhosts
            
ret
ResetPlayerGhost ENDP


;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////




GhostMovement PROC
;xPosGhost BYTE 62,64,66
;yPosGhost BYTE 14,14,14
    
    mov esi,-1

    moveGhosts::
           add esi,1

        cmp esi,3
            je exitt

        mov eax, GhostSpeed		;slow down the moving
		add eax, GhostSpeed
		call delay
        

        mov bl,yPosGhost[esi]


        ;//-----------------//

    cmp esi,0
        jne NextCheck1

        cmp boolG1[0],1
            jne dontCheckUP1
            call checkUPGhostCollision
            jmp moveUp


dontCheckUP1:       
        cmp boolG1[1],1
            jne dontCheckDOWN1
            call checkDOWNGhostCollision
            jmp moveDown

dontCheckDOWN1:
        cmp boolG1[2],1
            jne dontCheckRIGHT1
            call checkRIGHTGhostCollision
            jmp moveRight
           
dontCheckRIGHT1:
        cmp boolG1[3],1
            jne dontCheck ; NextCheck1
            call checkLEFTGhostCollision
            jmp moveLeft

       ;//-----------------//

NextCheck1:

    cmp esi,1
        jne NextCheck2

        cmp boolG2[0],1
            jne dontCheckUP2
            call checkUPGhostCollision
            jmp moveUp

dontCheckUP2:       
        cmp boolG2[1],1
            jne dontCheckDOWN2
            call checkDOWNGhostCollision
            jmp moveDown

dontCheckDOWN2:
        cmp boolG2[2],1
            jne dontCheckRIGHT2
            call checkRIGHTGhostCollision
            jmp moveRight
           
dontCheckRIGHT2:
        cmp boolG2[3],1
            jne NextCheck2
            call checkLEFTGhostCollision
            jmp moveLeft


;//-----------------//

NextCheck2:

    cmp esi,2
        jne dontCheck

        cmp boolG3[0],1
            jne dontCheckUP3
            call checkUPGhostCollision
            jmp moveUp

dontCheckUP3:       
        cmp boolG3[1],1
            jne dontCheckDOWN3
            call checkDOWNGhostCollision
            jmp moveDown

dontCheckDOWN3:
        cmp boolG3[2],1
            jne dontCheckRIGHT3
            call checkRIGHTGhostCollision
            jmp moveRight
           
dontCheckRIGHT3:
        cmp boolG3[3],1
            jne dontCheck
            call checkLEFTGhostCollision
            jmp moveLeft



moveUp:
        call UpdateGhosts

		mov ah, yPosGhost[esi]
		mov al, xPosGhost[esi]  	;al ah stores the pos of the ghost's next unit 
        cmp ah,2
          ;  jle conti1
		dec yPosGhost[esi]
conti1:
        call DrawGhosts

        jmp leavee
     
moveDown:
        call UpdateGhosts

		mov ah, yPosGhost[esi]
		mov al, xPosGhost[esi]  	;al ah stores the pos of the ghost's next unit 
	    cmp ah,24
         ;   jge conti2
        
        inc yPosGhost[esi]
conti2:
        call DrawGhosts

        jmp leavee
moveRight:
        call UpdateGhosts

		mov ah, yPosGhost[esi]
		mov al, xPosGhost[esi]  	
        cmp al,117
          ;  jge conti3
        
        inc xPosGhost[esi]
conti3:
        call DrawGhosts

        jmp leavee
moveLeft:
        call UpdateGhosts

		mov ah, yPosGhost[esi]
		mov al, xPosGhost[esi]  	;al ah stores the pos of the ghost's next unit 
        cmp al,1
          ;  jle conti4       
       
        dec xPosGhost[esi]
conti4:
        call DrawGhosts

    dontCheck:

    leavee:   

    jmp moveGhosts

exitt:        
    mov dl, CurrentMap

    cmp dl,1
        je level001  
    cmp dl,2
        je level002
    cmp dl,3
        je level003
level001:
    add esp,4
    jmp backToMain1
level002:
    add esp,4
    jmp backToMain2
level003:
    add esp,4
    jmp backToMain
    
    ret
GhostMovement ENDP


checkUPGhostCollision PROC

    cmp yPosGhost[esi],2
        jle check1

    movzx eax, yPosGhost[esi]
    dec eax

    mov ebx,0
    mov bl, mapWidth
    
    mul bl

    mov ebx,0
    mov bl,xPosGhost[esi]
    add eax, ebx
    dec eax    

    mov dl,CurrentMap
    cmp dl,1
        je level01  
    cmp dl,2
        je level02
    cmp dl,3
        je level03
level01:
    mov edi, offset map1
    jmp conti
level02:
    mov edi, offset map2
    jmp conti
level03:
    mov edi, offset map3
    jmp conti

conti:


    add edi, eax
    mov ebx, mapWidth
    sub edi,ebx 
    sub edi,ebx 

    mov ebx, [edi]

    cmp bl, "-"
       je check1
    cmp bl, "|"
       je check1     
    jmp exitt
check1: 


     mov eax, 2    ; Means two possiblilties, either go right or left
     call Randomize
     call RandomRange


     cmp eax,0
        je goRight
     jmp goLeft


     goRight:

        cmp esi, 0
            jne next2
        mov boolG1[0],0
        mov boolG1[2],1

    next2:
        cmp esi, 1
            jne next3
        mov boolG2[0],0
        mov boolG2[2],1

    next3:
        cmp esi, 2
            jne next4
        mov boolG3[0],0
        mov boolG3[2],1

    next4:
        call UpdateGhosts

		mov ah, yPosGhost[esi]
		mov al, xPosGhost[esi]  	;al ah stores the pos of the ghost's next unit 
        inc xPosGhost[esi]

        call DrawGhosts

        jmp goOut


     goLeft:

        cmp esi, 0
            jne next12
        mov boolG1[0],0
        mov boolG1[3],1

    next12:
        cmp esi, 1
            jne next13
        mov boolG2[0],0
        mov boolG2[3],1

    next13:
        cmp esi, 2
            jne next14
        mov boolG3[0],0
        mov boolG3[3],1

    next14:

        call UpdateGhosts

		mov ah, yPosGhost[esi]
		mov al, xPosGhost[esi]  	;al ah stores the pos of the ghost's next unit 
		dec xPosGhost[esi]

        call DrawGhosts

goOut:
        ;jmp moveGhosts
    mov dl, CurrentMap

    cmp dl,1
        je level001  
    cmp dl,2
        je level002
    cmp dl,3
        je level003
level001:
    add esp,4
    jmp gameLoop1
level002:
    add esp,4
    jmp gameLoop2
level003:
    add esp,4
    jmp gameLoop

exitt:


ret
checkUPGhostCollision ENDP



checkDOWNGhostCollision PROC
    cmp yPosGhost[esi],25
        jge check1

    movzx eax, yPosGhost[esi]
    dec eax

    mov ebx,0
    mov bl, mapWidth
    
    mul bl

    mov ebx,0
    mov bl,xPosGhost[esi]
    add eax, ebx
    dec eax    

    mov dl,CurrentMap
    cmp dl,1
        je level01  
    cmp dl,2
        je level02
    cmp dl,3
        je level03
level01:
    mov edi, offset map1
    jmp conti
level02:
    mov edi, offset map2
    jmp conti
level03:
    mov edi, offset map3
    jmp conti

conti:

add edi, eax
    mov ebx, mapWidth
    add edi, ebx 
   ; add edi, ebx

    mov ebx, [edi]

    cmp bl, "-"
       je check1;je gameLoop
    cmp bl, "|"
       je check1      
    jmp exitt
    
    check1: 


     mov eax, 2    ; Means two possiblilties, either go right or left
       call Randomize
       call RandomRange

     cmp eax,0
        je goRight
     jmp goLeft



    goRight:
        cmp esi, 0
            jne next2
        mov boolG1[1],0
        mov boolG1[2],1

    next2:
        cmp esi, 1
            jne next3
        mov boolG2[1],0
        mov boolG2[2],1

    next3:
        cmp esi, 2
            jne next4
        mov boolG3[1],0
        mov boolG3[2],1

    next4:
        call UpdateGhosts

		mov ah, yPosGhost[esi]
		mov al, xPosGhost[esi]  	;al ah stores the pos of the ghost's next unit 
		;inc xPosGhost[esi]
        inc xPosGhost[esi]

        call DrawGhosts

        jmp goOut


     goLeft:

        cmp esi, 0
            jne next12
        mov boolG1[1],0
        mov boolG1[3],1

    next12:
        cmp esi, 1
            jne next13
        mov boolG2[1],0
        mov boolG2[3],1

    next13:
        cmp esi, 2
            jne next14
        mov boolG3[1],0
        mov boolG3[3],1

    next14:

        call UpdateGhosts

		mov ah, yPosGhost[esi]
		mov al, xPosGhost[esi]  	;al ah stores the pos of the ghost's next unit 
		dec xPosGhost[esi]

        call DrawGhosts

goOut:
    mov dl, CurrentMap

    cmp dl,1
        je level001  
    cmp dl,2
        je level002
    cmp dl,3
        je level003
level001:
    add esp,4

    jmp gameLoop1
level002:
    add esp,4

    jmp gameLoop2
level003:
    add esp,4

    jmp gameLoop

exitt:



ret
checkDOWNGhostCollision ENDP



checkRIGHTGhostCollision PROC
    cmp xPosGhost[esi],119
        jge check1


    movzx eax, yPosGhost[esi]
    dec eax

    mov ebx,0
    mov bl, mapWidth
    
    mul bl

    mov ebx,0
    mov bl,xPosGhost[esi]
    add eax, ebx
    dec eax    

    mov dl,CurrentMap
    cmp dl,1
        je level01  
    cmp dl,2
        je level02
    cmp dl,3
        je level03
level01:
    mov edi, offset map1
    jmp conti
level02:
    mov edi, offset map2
    jmp conti
level03:
    mov edi, offset map3
    jmp conti

conti:
add edi, eax
    add edi,2

    mov ebx, [edi]

    cmp bl, "-"
       je check1;je gameLoop
    cmp bl, "|"
       je check1      
    jmp exitt
check1: 
     

     mov eax, 2    ; Means two possiblilties, either go up or down
          call Randomize
          call RandomRange
     cmp eax,0
        je goUp
     jmp goDown


     goUp:
        cmp esi, 0
            jne next2
        mov boolG1[2],0
        mov boolG1[0],1

    next2:
        cmp esi, 1
            jne next3
        mov boolG2[2],0
        mov boolG2[0],1

    next3:
        cmp esi, 2
            jne next4
        mov boolG3[2],0
        mov boolG3[0],1

    next4:
        call UpdateGhosts

		mov ah, yPosGhost[esi]
		mov al, xPosGhost[esi]  	;al ah stores the pos of the ghost's next unit 
		;inc xPosGhost[esi]
        dec yPosGhost[esi]

        call DrawGhosts

        jmp goOut


     goDown:

        cmp esi, 0
            jne next12
        mov boolG1[2],0
        mov boolG1[1],1

    next12:
        cmp esi, 1
            jne next13
        mov boolG2[2],0
        mov boolG2[1],1

    next13:
        cmp esi, 2
            jne next14
        mov boolG3[2],0
        mov boolG3[1],1

    next14:
        call UpdateGhosts

		mov ah, yPosGhost[esi]
		mov al, xPosGhost[esi]  	;al ah stores the pos of the ghost's next unit 
		;inc xPosGhost[esi]
        inc yPosGhost[esi]

        call DrawGhosts

goOut:
    mov dl, CurrentMap

    cmp dl,1
        je level001  
    cmp dl,2
        je level002
    cmp dl,3
        je level003
level001:
    add esp,4

    jmp gameLoop1
level002:
    add esp,4

    jmp gameLoop2
level003:
    add esp,4

    jmp gameLoop

exitt:


ret
checkRIGHTGhostCollision ENDP


checkLEFTGhostCollision PROC
    cmp xPosGhost[esi],1
        jle check1



    movzx eax, yPosGhost[esi]
    dec eax

    mov ebx,0
    mov bl, mapWidth
    
    mul bl

    mov ebx,0
    mov bl,xPosGhost[esi]
    add eax, ebx
    dec eax    

    mov dl,CurrentMap
    cmp dl,1
        je level01  
    cmp dl,2
        je level02
    cmp dl,3
        je level03
level01:
    mov edi, offset map1
    jmp conti
level02:
    mov edi, offset map2
    jmp conti
level03:
    mov edi, offset map3
    jmp conti

conti:
add edi, eax
    sub edi,1
    ;mov ebx, mapWidth
    ;sub edi,ebx 

    mov ebx, [edi]

    cmp bl, "-"
       je check1;je gameLoop
    cmp bl, "|"
       je check1      
    jmp exitt
check1: 



     mov eax, 2    ; Means two possiblilties, either go up or down
     call Randomize
          call RandomRange

     cmp eax,0
        je goUp
     jmp goDown


     goUp:
        cmp esi, 0
            jne next2
        mov boolG1[3],0
        mov boolG1[0],1

    next2:
        cmp esi, 1
            jne next3
        mov boolG2[3],0
        mov boolG2[0],1

    next3:
        cmp esi, 2
            jne next4
        mov boolG3[3],0
        mov boolG3[0],1

    next4:
        call UpdateGhosts

		mov ah, yPosGhost[esi]
		mov al, xPosGhost[esi]  	;al ah stores the pos of the ghost's next unit 
		;inc xPosGhost[esi]
        dec yPosGhost[esi]

        call DrawGhosts

        jmp goOut


     goDown:

        cmp esi, 0
            jne next12
        mov boolG1[3],0
        mov boolG1[1],1

    next12:
        cmp esi, 1
            jne next13
        mov boolG2[3],0
        mov boolG2[1],1

    next13:
        cmp esi, 2
            jne next14
        mov boolG3[3],0
        mov boolG3[1],1

    next14:
        call UpdateGhosts

		mov ah, yPosGhost[esi]
		mov al, xPosGhost[esi]  	;al ah stores the pos of the ghost's next unit 
        inc yPosGhost[esi]

        call DrawGhosts

goOut:
    mov dl, CurrentMap

    cmp dl,1
        je level001  
    cmp dl,2
        je level002
    cmp dl,3
        je level003
level001:
    add esp,4

    jmp gameLoop1
level002:
    add esp,4

    jmp gameLoop2
level003:
    add esp,4

    jmp gameLoop

exitt:

ret
checkLEFTGhostCollision ENDP





DrawGhosts PROC

    mov edi,0
    mov ecx,3

    spawnGhosts:

    cmp edi,0
        jne color2

    mov eax,magenta
    call SetTextColor   
    jmp printt

    color2:
        cmp edi,1
        jne color3

    mov eax,green
    call SetTextColor   
    jmp printt

    color3:

    mov eax,lightblue
    call SetTextColor   
    


    printt:   
        mov dl,xPosGhost[edi]
        mov dh,yPosGhost[edi]
        call Gotoxy

        mov al,"G"
        call WriteChar
        inc edi
    loop spawnGhosts


    ret
DrawGhosts ENDP


UpdateGhosts PROC

    mov dl,xPosGhost[esi]
    mov dh,yPosGhost[esi]
    call Gotoxy
    
    mov al," "
    call WriteChar

    ret
UpdateGhosts ENDP



DrawMap PROC

    mov eax, blue;(blue*16)
    call SetTextColor

    mov dl,0
    mov dh,1
    call Gotoxy


    mov bl,CurrentMap
    
    cmp bl,1
        je level01  
    cmp bl,2
        je level02
    cmp bl,3
        je level03
level01:
    mov edx, offset map1
    jmp conti
level02:
    mov edx, offset map2
    jmp conti
level03:
    mov edx, offset map3
    jmp conti

conti:

    mov esi,0
    mov edi,0
    printMap:
        cmp esi, 3416
            je exitt

        cmp edi, 122
            jl conti2
        mov eax,50
        CALL Delay
        mov edi,0
conti2:
        mov al, [edx +esi]
        
        cmp al, "."
            jne conti3

    mov eax, yellow
    call SetTextColor
        mov al, [edx +esi]

conti3:
        call WriteChar

    mov eax, blue;(blue*16)
    call SetTextColor

        inc esi
        inc edi
    jmp printMap
exitt:

ret
DrawMap ENDP


checkScore PROC

    movzx eax, yPos
    dec eax

    mov ebx,0
    mov bl, mapWidth
    
    mul bl

    mov ebx,0
    mov bl,xPos
    add eax, ebx
    ;dec eax    

    ;mov esi, offset map3


    mov dl,CurrentMap
    
    cmp dl,1
        je level01  
    cmp dl,2
        je level02
    cmp dl,3
        je level03
level01:
    mov esi, offset map1
    jmp conti
level02:
    mov esi, offset map2
    jmp conti
level03:
    mov esi, offset map3
    jmp conti

conti:
    
    
    add esi, eax

    mov ebx, [esi]

    cmp bl, "."
        jne exitt     
   ; INVOKE PlaySound, OFFSET pacman_eating, NULL,11h
    inc score

    mov bl," "
    mov [esi],bl


exitt:
ret
checkScore ENDP




checkUPCollision PROC

    movzx eax, yPos
    dec eax

    mov ebx,0
    mov bl, mapWidth
    
    mul bl

    mov ebx,0
    mov bl,xPos
    add eax, ebx
    ;dec eax    

    ;mov esi, offset map3
    
    mov dl,CurrentMap
    
    cmp dl,1
        je level01  
    cmp dl,2
        je level02
    cmp dl,3
        je level03
level01:
    mov esi, offset map1
    jmp conti
level02:
    mov esi, offset map2
    jmp conti
level03:
    mov esi, offset map3
    jmp conti

conti:

    add esi, eax
    
    mov ebx, mapWidth
    sub esi,ebx 

    mov ebx, [esi]

    cmp bl, "-"
       je check1;je gameLoop
    cmp bl, "|"
       je check1      
    jmp exitt
check1:   
    cmp dl,1
        je level001  
    cmp dl,2
        je level002
    cmp dl,3
        je level003
level001:
    add esp,4

    jmp gameLoop1
level002:
    add esp,4

    jmp gameLoop2
level003:
    add esp,4

    jmp gameLoop

exitt:

ret
checkUPCollision ENDP


checkDOWNCollision PROC

    movzx eax, yPos
    dec eax

    mov ebx,0
    mov bl, mapWidth
    
    mul bl

    mov ebx,0
    mov bl,xPos
    add eax, ebx
    ;dec eax    

   ; mov esi, offset map3
    
    mov dl,CurrentMap
    
    cmp dl,1
        je level01  
    cmp dl,2
        je level02
    cmp dl,3
        je level03
level01:
    mov esi, offset map1
    jmp conti
level02:
    mov esi, offset map2
    jmp conti
level03:
    mov esi, offset map3
    jmp conti

conti:    
    add esi, eax
    
    mov ebx, mapWidth
    add esi,ebx 

    mov ebx, [esi]

    cmp bl, "-"
       je check1;je gameLoop
    cmp bl, "|"
       je check1      
    jmp exitt

check1:   
    cmp dl,1
        je level001  
    cmp dl,2
        je level002
    cmp dl,3
        je level003
level001:
    add esp,4

    jmp gameLoop1
level002:
    add esp,4

    jmp gameLoop2
level003:
    add esp,4

    jmp gameLoop

    exitt:
ret
checkDOWNCollision ENDP



checkRIGHTCollision PROC

    movzx eax, yPos
    dec eax

    mov ebx,0
    mov bl, mapWidth
    
    mul bl

    mov ebx,0
    mov bl,xPos
    add eax, ebx
    ;dec eax    

    ;mov esi, offset map3
    
    mov dl,CurrentMap
    
    cmp dl,1
        je level01  
    cmp dl,2
        je level02
    cmp dl,3
        je level03
level01:
    mov esi, offset map1
    jmp conti
level02:
    mov esi, offset map2
    jmp conti
level03:
    mov esi, offset map3
    jmp conti

conti:

    add esi, eax
    
    add esi,1

    mov ebx, [esi]

    cmp bl, "-"
       je check1;je gameLoop
    cmp bl, "|"
       je check1      
    jmp exitt
check1:   
    cmp dl,1
        je level001  
    cmp dl,2
        je level002
    cmp dl,3
        je level003
level001:
    add esp,4

    jmp gameLoop1
level002:
    add esp,4

    jmp gameLoop2
level003:
    add esp,4

    jmp gameLoop
    exitt:

ret
checkRIGHTCollision ENDP


checkLEFTCollision PROC

    movzx eax, yPos
    dec eax

    mov ebx,0
    mov bl, mapWidth
    
    mul bl

    mov ebx,0
    mov bl,xPos
    add eax, ebx
    ;dec eax    

    ;mov esi, offset map3
    mov dl,CurrentMap
    
    cmp dl,1
        je level01  
    cmp dl,2
        je level02
    cmp dl,3
        je level03
level01:
    mov esi, offset map1
    jmp conti
level02:
    mov esi, offset map2
    jmp conti
level03:
    mov esi, offset map3
    jmp conti

conti:    
    
    
    add esi, eax
    
    sub esi,1


    mov ebx, [esi]

    cmp bl, "-"
       je check1;je gameLoop
    cmp bl, "|"
       je check1      
    jmp exitt
check1:   
    cmp dl,1
        je level001  
    cmp dl,2
        je level002
    cmp dl,3
        je level003
level001:
    add esp,4

    jmp gameLoop1
level002:
    add esp,4

    jmp gameLoop2
level003:
    add esp,4

    jmp gameLoop
    exitt:

ret
checkLEFTCollision ENDP


startScreen PROC

    mov eax, lightblue
    call settextcolor

    INVOKE PlaySound, OFFSET pacman_beginning, NULL,11h

    mov eax, 40
    mov edx,OFFSET gameTitle

    mov ecx, 12

    printTitle:
        call WriteString
        call Delay
        add edx, 122
    loop printTitle
    
    call crlf
    call crlf

    mwrite "   Enter Your Name: "
    mov edx, offset playerNAME
    mov ecx, playerNAMEWidth
    call ReadString
    mov sizeOfPlayer,al
    call mainMenu

ret
startScreen ENDP



LevelCompleted PROC

INVOKE PlaySound,NULL, NULL, 0

    call clrscr
 INVOKE PlaySound, OFFSET pacman_winning, NULL,11h

     mov eax, yellow
    call SetTextColor
    mov edx, offset levelComp
    call writestring

    call crlf
    call crlf
    call crlf

    mov eax, lightred
    call SetTextColor

    mwrite"     In the mystical tapestry of challenges, you have conquered this level with finesse. As the ethereal echoes "
    call crlf
    
    mwrite"         celebrate your triumph, a more intricate labyrinth awaits your courage. Are you prepared "
    call crlf
    mwrite "                              to navigate the shadows of greater mysteries?"

    call crlf
    call crlf
    call crlf

    mov eax, lightred
    call SetTextColor

    mwrite "                                      Name: "
    mov edx, offset PlayerName
   
    mov eax, white
    call SetTextColor
  
   call WriteString
    call crlf

    mov eax, lightred
    call SetTextColor
    mwrite "                                      Score(This Level): "

    mov eax, white
    call SetTextColor
    mov al, score
    call WriteDec

        call crlf

    mov eax, lightred
    call SetTextColor

    mwrite "                                      Total Score: "

    mov eax, white
    call SetTextColor
    
    mov al,score
    add FinalScore, al

    mov al, finalScore
    call WriteDec

    mov eax, yellow
    call SetTextColor


call crlf
call crlf
call crlf


    
    mov eax, yellow
    call SetTextColor

    mwrite "                                             Press C to Continue!" 

check1:
    call ReadChar

    cmp al, "c"
    je exitt

    jmp check1
exitt:

INVOKE PlaySound,NULL, NULL, 0
INVOKE PlaySound, OFFSET suspense, NULL,0


add esp,4
mov dl, CurrentMap

    cmp dl,1
        je level001  
    cmp dl,2
        je level002
    cmp dl,3
        je level003
level001:
    jmp out1
level002:
    jmp out2
level003:
   call GameCompleted

ret
LevelCompleted ENDP






GameOver PROC

INVOKE PlaySound,NULL, NULL, 0

    call clrscr
 INVOKE PlaySound, OFFSET pacman_death, NULL,11h

     mov eax, lightred
    call SetTextColor

    mov edx, offset OverTitle
    call writestring

    call crlf
    call crlf
    call crlf

    mov eax, lightblue
    call SetTextColor

    mwrite"    In the cosmic saga of play, your journey in this realm ends. Fear not, for defeat echoes with lessons. "
    call crlf
    
    mwrite"              Will you rise again, ready to unravel the mysteries of another game over? "
    call crlf
    call crlf
    call crlf

    mov eax, lightred
    call SetTextColor

    mwrite "                                      Name: "
    mov edx, offset PlayerName
   
    mov eax, white
    call SetTextColor
  
   call WriteString
    call crlf

    mov eax, lightred
    call SetTextColor
    
    mov al,score
    add FinalScore, al

    mwrite "                                      FinalScore: "

    mov eax, white
    call SetTextColor
    mov al, FinalScore
    call WriteDec

    mov eax, yellow
    call SetTextColor


        call crlf
        call crlf
        call crlf
            mwrite "                                             Press E to Exit!" 

check1:
    call ReadChar

    cmp al, "e"
    je exitt

    jmp check1

exitt:

    mov edx , offset fileName 
    call openInputFile 
    mov FileHandle , eax 

    mov eax , FileHandle 
    mov edx , offset storeThemNames 
    mov ecx ,  800 
    call ReadFromFile
    mov SizeTemp , eax 

    mov eax , FileHandle
    call CloseFile 


    mov esi , offset storeThemNames 
    add esi , SizeTemp 

    mov bl , 0ah 
    mov [esi] , bl 
    add esi , 1 
    inc SizeTemp 
        
    movzx ecx , sizeOfPlayer
    mov edi, 0


    loooops: 
    mov bl , playerNAME[edi]
    mov [esi] , bl 

    inc esi 
    inc edi 
    inc SizeTemp 

    loop loooops


    mov  edx, OFFSET FileName
    call CreateOutputFile
    mov FileHandle, eax


    mov  eax, FileHandle
    mov  edx, OFFSET storeThemNames
    mov  ecx, SizeTemp
    call WriteToFile

    mov  eax, FileHandle
    call CloseFile


INVOKE PlaySound,NULL, NULL, 0
INVOKE PlaySound, OFFSET suspense, NULL,0


exit

ret
GameOver ENDP




GameCompleted PROC

INVOKE PlaySound,NULL, NULL, 0
 INVOKE PlaySound, OFFSET pacman_outro, NULL,11h

    call clrscr

     mov eax, lightblue
    call SetTextColor

    mov edx, offset CompletedTitle
    call writestring

    call crlf
    call crlf
    call crlf

    mov eax, yellow
    call SetTextColor

    mwrite"   As the final pixels align, congratulations on completing the game. Your triumph echoes into the cosmic void,"
    call crlf
    
    mwrite"                              anticipating the dawn of new challenges."
    call crlf
    call crlf
    call crlf

    mov eax, lightred
    call SetTextColor

    mwrite "                                      Name: "
    mov edx, offset PlayerName
   
    mov eax, white
    call SetTextColor
  
   call WriteString
    call crlf

    mov eax, lightred
    call SetTextColor
    mwrite "                                      Final Score: "

    mov eax, white
    call SetTextColor

    mov al,score
    add FinalScore, al

    mov al, FinalScore
    call WriteDec

    mov eax, yellow
    call SetTextColor


        call crlf
        call crlf
        call crlf
            mwrite "                                             Press E to Exit!" 

 ;INVOKE PlaySound, OFFSET pacman_winning, NULL,0

check1:
    call ReadChar

    cmp al, "e"
    je exitt

    jmp check1
exitt:

    mov edx , offset fileName 
    call openInputFile 
    mov FileHandle , eax 

    mov eax , FileHandle 
    mov edx , offset storeThemNames 
    mov ecx ,  800 
    call ReadFromFile
    mov SizeTemp , eax 

    mov eax , FileHandle
    call CloseFile 


    mov esi , offset storeThemNames 
    add esi , SizeTemp 

    mov bl , 0ah 
    mov [esi] , bl 
    add esi , 1 
    inc SizeTemp 
        
    movzx ecx , sizeOfPlayer
    mov edi, 0


    loooops: 
    mov bl , playerNAME[edi]
    mov [esi] , bl 

    inc esi 
    inc edi 
    inc SizeTemp 

    loop loooops


    mov  edx, OFFSET FileName
    call CreateOutputFile
    mov FileHandle, eax


    mov  eax, FileHandle
    mov  edx, OFFSET storeThemNames
    mov  ecx, SizeTemp
    call WriteToFile

    mov  eax, FileHandle
    call CloseFile


exit

ret
GameCompleted ENDP




mainMenu PROC
   
mainmenuu:
    call clrscr


    mov eax, lightblue
    call settextcolor
    

    mov eax, 40

    mov ecx, 6

    mov edx,OFFSET menuTitle

    printTitle:


        call WriteString
        call Delay
        add edx, 85
    loop printTitle

    call crlf
    call crlf
    call crlf

    mov eax, lightred
    call settextcolor


    mwrite "       Enter the realm of Pac-Man, where mazes beckon and ghosts lurk in the pixelated shadows. Let the adventure"
    call crlf
    mwrite "                         unfold with every waka-waka - a symphony of classic gaming awaits!"
    call crlf
    call crlf
    call crlf

    mov eax, yellow
    call settextcolor

    mwrite "                                        Press S to Start Game"
    call crlf
    call crlf

    mwrite "                                        Press I for Instructions"
    call crlf
    call crlf

    mwrite "                                        Press H To Check HighScores"
    call crlf
    call crlf

    mwrite "                                        Press X To Exit"
    call crlf
    call crlf

readAgain:
     call ReadChar
     mov inputChar,al

     cmp inputChar,"x"
     je exitt

     cmp inputChar, "h"
     jne nextt2
     call HighScoreDisplay
     jmp mainmenuu

nextt2:
     cmp inputChar,"i"
     jne nextt3
     
     call instructionScreen
     jmp mainmenuu

nextt3:
     cmp inputChar,"s"
     jne readAgain

     jmp closeMenu

exitt:
    exit
     
closeMenu:
ret
mainMenu ENDP



PauseGame PROC
    
    mov dl, 70
    mov dh, 0
    call gotoxy

    mwrite "       Game is Paused!, Press E to Continue!"

check1:
    call ReadChar

    mov inputChar, al

    cmp inputChar, "e"
    je exitt

    jmp check1

    exitt:

        call gotoxy
        mwrite "                                                    "



ret
PauseGame ENDP



HighScoreDisplay PROC

    call clrscr

mov edx, offset highScoreTitle
call writestring


    mov edx , offset fileName 
    call openInputFile 
    mov FileHandle , eax 


    mov eax , FileHandle 
    mov edx , offset storeThemNames 
    mov ecx ,  800 

    call ReadFromFile
    mov SizeTemp , eax 

    
    mov eax , FileHandle
    call CloseFile 

     mov ecx ,  800 
    mov edx , offset storeThemNames 
    call WriteString 

    call crlf
    call crlf
    call crlf

   
    call ReadChar


ret
HighScoreDisplay endp


instructionScreen PROC 
    
    call clrscr
    mov eax, yellow
    call settextcolor


    mov eax, 40
    mov ecx, 6

   
    mov edx,OFFSET instrucTitle

    printTitle:


        call WriteString
        call Delay
        add edx, 86
    loop printTitle
    
    call crlf
    call crlf
    call crlf


    mov eax, lightblue
    call settextcolor
    mwrite "        In the labyrinth of cosmic echoes, where time dances with shadows, emerges a spectral hero, Pac-Man,"
    call crlf
    mwrite "                destined to devour the mysteries that weave the fabric of the ethereal realm."
    call crlf
    call crlf
  
    
    mov eax, lightred
    call settextcolor

    mwrite "                        WASD FOR movement. Press P to Pause. Press E To Exit In-Game  "
    call crlf
    call crlf

    mov eax, yellow
    call settextcolor
    mwrite "                                    Press any key to Continue!"
    
    call ReadChar

ret
instructionScreen ENDP


DrawPlayer PROC
    ; draw player at (xPos,yPos):
    mov eax,yellow;(yellow*16)
    call SetTextColor
    mov dl,xPos
    mov dh,yPos
    call Gotoxy
    mov al,"X"
    call WriteChar

    ret
DrawPlayer ENDP


UpdatePlayer PROC
    
    mov dl,xPos
    mov dh,yPos
    call Gotoxy
    mov al," "
    call WriteChar
    
    ret
UpdatePlayer ENDP


END main