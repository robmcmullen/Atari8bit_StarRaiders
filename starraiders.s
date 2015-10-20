; .RADIX 10 
;
;
;               GAME COMPLETE 17-JUN-79
;
;               NOTES
;       RAM     0-1FFF
;       ROM     A000-BFFF
;       SPILL OVER ROM  9800-9FFF
;       E477G           ; PROG START
;
;       ALPHA CHARACTERS  IN DMA ASCII
;
;       *CAPS = ASCII EOR $20
;       NUMBERS = ASCII
;
;       40 CHAR = $CC00
;       20 CHAR (*CAPS, NUMBERS), = $CC00
;       20 CHAR (CAPS, LOWR CASE), = $CE00
;
;
;
;       UNIVERSE LOOKS LIKE     SIGN    HI BYTE         LOW:
;       -INFINITY       =       00      00              00
;               0       =       01      00              00
;       +INFINITY       =       01      FF              FF
;              -1       =       00      FF              FF
;
;
;
;       KEYCODE IS ORED WITH $C0
;
;
;
;
;
;       STRRAM MEMORY DEFINED      STRRAM+      TYPE    NOT:
;                                       0       OBJ0    ZYL:
;                                       1       OBJ1    ZYL:
;                                       2       OBJ2    PHO:
;                                       3       OBJ3    PHO:
;                                       4       MISSLE  PHO:
;                                       5-N     PLAY.   STA:
;                                    N+1-M      PLAY.   EXP:
;
;
;
;
.segment  "BSS"
        .ORG     $0062
;       ******************  POWER UP CLEARED RAM  *********:
MISDIF:                         ; MISSION DIFFICULTY 
		.res	1
RESET:                          ; ONE SHOT CONSOL KEY 
		.res	1
ATRACT:                         ; GAME OVER FLAG =FF, ATRAC:
		.res	1
REPMSG:                         ; REPEAT MESSAGE BYTE 
		.res	1
TIMOUT:                         ; ATRACT MODE TIMEOUT REG 
		.res	1
;       ***************************************************:
PAGE0:          
PROGST:                         ; WAIT FOR VBLANK= 00 
		.res	1
;       **********************  TEMP REG RAM  *************:
PNTR:                           ; 2 BYTE MISC. TEMPOARY REG:
		.res	2
TEMP:                           ; TEMPOARY REGISTER 
		.res	1
TEMP1:                          ; TEMP REG 
		.res	1
TEMP2:          
		.res	1
TEMP3:          
		.res	1
TEMP4:          
		.res	1
NTEMP:                          ; NMI TEMP REG 
		.res	1
;       ***************************************************:
;       ********************  SHIP SPEED RAM  *************:
SPEED:                          ; SPEED O CURISER 
		.res	1
WARP:                           ; SPEED DESIRED AS OPPOSED :
		.res	1
;       ***************************************************:
;       *******************  TIMERS RAM  ******************:
TIMERX:                         ; USED FO STAR INTENSITY 
		.res	1
ETIMER:                         ; EXPLOSION TIMEOUT 
		.res	1
SECOND:                         ; SECOND TIMEOUT 
		.res	1
BSEQTM:                         ; STARBASE SEQUENCER 
		.res	1
BINTIM:                         ; BINARY TIMER 
		.res	1
BINNMI:                         ; BINARY TIMER IN NMI 
		.res	1
JMPTIM:                         ; TIME TO JUMP RAM LOC 
		.res	1
;       ***************************************************:
;       ********************  STAR POINTER RAM  ***********:
NSTARS:                         ; LAST BYTE OF STAR RAM TO :
		.res	1
CNSTAR:                         ; LAST BYTE OF STAR RAM TO :
		.res	1
;       ***************************************************:
;       ******************  CONTROL FLAGS AND ENERGY RAM  *:
BASFLG:                         ; STARBASE FLAG 
		.res	1
TRKFLG:                         ; AUTO TRACKING = FF 
		.res	1
SHENER:                         ; SHIELD ENERGY 0 OR 8 
		.res	1
ATENER:                         ; ATTACK COMPUTER ENERGY 
		.res	1
ENFLAG:                         ; LS BYTE OF ENERGY , TELLS:
		.res	1
WPENER:                         ; WARP ENRGY DEPENDS ON WAR:
		.res	1
;       ***************************************************:
;       **************  MISC RAM  *************************:
SPABAK:                         ; SPACE BACKGROUND COLOR 
		.res	1
PHITS:                          ; PHOTON HIT DETECT REGS 
		.res	2
PHOFLG:                         ; ONE SHOT PHOTON 
		.res	1
PHOTIM:                         ; REPEAT TIMEOUT 
		.res	1
LOKLOC:                         ; PHOTON LOCK VECTOR PNTR 
		.res	1
PHOTOG:                         ; PHOTON TOGGLE FLAG 
		.res	1
LOKWAT:                         ; TIME BEFORE CAN LOCK AGAI:
		.res	1
LOKTAR:                         ; INDEX OF LOCK ON TARGET 
		.res	1
HITME:                          ;  SHIP HIT FLAG 
		.res	1
REDFLG:                         ; RED ALERT FLAG 
		.res	1
;               *******************************************:
;       **********************  GALACTIC CHART RAM  *******:
GVPOS:                          ; CRUISER VPOS ON CHART 
		.res	1
GHPOS:                          ; CRUSIER HPOS ON CHART 
		.res	1
HYVPOS:                         ; CURSOR VPOS ON CHART 
		.res	1
HYHPOS:                         ; CURSOR HPOS ON CHART 
		.res	1
QUADRT:                         ; QUADRANT STAR RAIDER IS I:
		.res	1
HYPENG:                         ; HYPERWARP ENERGY USED 
		.res	1
HYPQAD:                         ; HYPERWARP QUADRANT 
		.res	1
KILBAS:                         ; QUAD OF STARBASE, ZYLONS :
		.res	1
KILOCH:                         ; KILL LOC HPOS 
		.res	1
KILOCV:                         ; KILL LOC VPOS 
		.res	1
JMPPTS:                         ; GRADIENT VALUES 
		.res	9
JMPOUT:                         ; JUMP TIMEOUT REG 
		.res	1
;               *******************************************:
;       *******************  SCREEN MAP DRAWING RAM  ******:
                                

HTARGT:                         ; HORIZ TARGET POSIT 
		.res	1
VTARGT:                         ; VERT TARGET POSIT 
		.res	1
TARPTR:                         ; TARGET SEQUENCER 
		.res	1
LOKFLG:                         ; COMPUTER LOCKON 
		.res	1
NUMPTS:                         ; NUMBER OF POINTS TO DRAW 
		.res	1
VDRAW:                          ; VERT POS OF DRAW CURSOR 
		.res	1
HDRAW:                          ; HOR POS OF DRAW CURSOR 
		.res	1
;       ***************************************************:
;       ******************  THINK RAM  ********************:
ZYTOGG:                         ; WHICH ZYLON 
		.res	1
SEQEN:                          ; SEQUENCER PNTR RAM 
		.res	2
SEQTIM:                         ; SEQUENCER TIMEOUT RAM 
		.res	2
XINDES:                         ; DESIRED XINCRE 
		.res	2
YINDES:                         ; DESIRED YINCRE 
		.res	2
ZINDES:                         ; DESIRED ZINCRE 
		.res	2
XINPRS:                         ;  PRESENT POINTER TO ZYWAR:
		.res	6
BSTRAF:                         ; STRAF BACK 0,OR 1 
		.res	2
ROTTIM:                         ; ROTATION TIMEOUT 
		.res	4
PHEXWT:                         ; PHOTON EXPLOSION WAIT 
		.res	1
ATTARG:                         ; WHICH ZYLON FIRED 
		.res	1
;       ***************************************************:
;       *************************  HYPERWARP RAM  *********:
HFLAG:                          ; HYPERWARP ENGAGED FLAG, 0:
		.res	1
HISPED:                         ; HI BYTE SPEED, 0 OR 2=HWA:
		.res	1
HTIMER:                         ; HWARP TIMER 
		.res	1
HPNTR:                          ; POINTS TO WHICH LINE STAR:
		.res	1
HSTEER:                         ; OLD HWAR CURSOR HPOS 
		.res	1
VSTEER:                         ; OLD HWARP CURSOR VPO 
		.res	1
STERMK:                         ; STEER MASK 
		.res	1
JMPMSK:                         ; INIT TARGETS IN NEW QUAD,:
		.res	1
;       ***************************************************:
                                

;       *******************  KEYS, JOYSTICK RAM  **********:
HORJOY:                         ; 0=NO HORIZ, 01=RIGHT, FF=:
		.res	1
VERJOY:                         ; 0=NO VERT, 01=DOWN, FF=UP:
		.res	1
THEKEY:                         ; THE KEY IN KBCODE 
		.res	1
RATING:                         ; YOUR RATING 
		.res	2
ENDRAT:                         ; FINAL RATING 
		.res	1
ENDCLS:                         ; FINAL CLASS 
		.res	1
;       ***************************************************:
;       ***************  MESSAGE RAM  *********************:
MESTIM:                         ; MESSAGE TIMEOUT 
		.res	1
DISFLG:                         ; DISPLAY TYPE FLAG 0=FRONT:
		.res	1				; 40=SECTOR SCAN
SENPTR:                         ; SENTENCE POINTER 
		.res	1
;       ***************************************************:
;       ***************  AUDIO RAM  ***********************:
NOTSEQ:                         ; NOTE POINTER 
		.res	1
REPSEQ:                         ; HOW MANY TIMES TO REPEAT 
		.res	1
NDURAT:                         ; DURAT OF NOTE 
		.res	1
SDURAT:                         ; DURAT OF SPACE 
		.res	1
NPRIOR:                         ; PRIOR OF NOE TYPE 
		.res	1
REPPTR:                         ; WHERE TO REPEAT IN NOTETB:
		.res	1
NDURTM:                         ; NOTE TIMER 
		.res	1
NOTVOL:                         ; NOTE VOLUME 
		.res	1
PHOREP:                         ; REPAT NOTE FOR PHOTON 
		.res	1
AUDEXP:                         ; EXPLOS SERVICE TIMER 
		.res	1
ATYPE2:                         ; RAM FO AUDC2 
		.res	1
ATYPE3:                         ; RAM FOR AUDC3 
		.res	1
AFREQ1:                         ; RAM FO AUDF1 
		.res	1
AFREQ2:                         ; RAM FOR AUDF2 
		.res	1
AUDADD:                         ; HOW MUCH TO ADD 
		.res	1
AUDTIM:                         ; AUDIO TIMEOUT  0=ALL DONE:
		.res	1
EXPDEL:                         ; EXPLOS DELAY 
		.res	1
BIGEXP:                         ; SHIELDS DOWN EXPLOS 
		.res	1
;       ***************************************************:
;       ***************  OBJECT RAM  **********************:
GRAPH:                          ; GRAPHIC FOR OBJ0-4 
		.res	5
STFLAG:                         ; 0=OBJECT NOT ON (DEFINED :
		.res	5
;       ***************************************************:
;       ******************  COLOR RAM  ********************:
COLRAM:                         ; PLAYER AND PLAYFIELD COLO:
		.res	14
;       ***************************************************:
PHASE4:         
;
                                
.segment  "CODE"
;
;       ADDRESS SPACE
;
;
;       COLLEEN MNEMONICS
;
POKEY   =       $D200
POT0    =       POKEY+0
POT1    =       POKEY+1
POT2    =       POKEY+2
POT3    =       POKEY+3
POT4    =       POKEY+4
POT5    =       POKEY+5
POT6    =       POKEY+6
POT7    =       POKEY+7
ALLPOT  =       POKEY+8
KBCODE  =       POKEY+9
RANDOM  =       POKEY+10
SERIN   =       POKEY+13
IRQST   =       POKEY+14
SKSTAT  =       POKEY+15
AUDF1   =       POKEY+0
AUDC1   =       POKEY+1
AUDF2   =       POKEY+2
AUDC2   =       POKEY+3
AUDF3   =       POKEY+4
AUDC3   =       POKEY+5
AUDF4   =       POKEY+6
AUDC4   =       POKEY+7
AUDCTL  =       POKEY+8
STIMER  =       POKEY+9
SKRES   =       POKEY+10
POTGO   =       POKEY+11
SEROUT  =       POKEY+13
IRQEN   =       POKEY+14
SKCTL   =       POKEY+15
;
CTIA    =       $D000
HPOSP0  =       CTIA+0
HPOSP1  =       CTIA+1
HPOSP2  =       CTIA+2
HPOSP3  =       CTIA+3
HPOSM0  =       CTIA+4
HPOSM1  =       CTIA+5
HPOSM2  =       CTIA+6
HPOSM3  =       CTIA+7
SIZEP0  =       CTIA+8
SIZEP1  =       CTIA+9
SIZEP2  =       CTIA+10
SIZEP3  =       CTIA+11
SIZEM   =       CTIA+12
GRAFP0  =       CTIA+13
GRAFP1  =       CTIA+14
GRAFP2  =       CTIA+15
GRAFP3  =       CTIA+16
GRAFM   =       CTIA+17
COLPM0  =       CTIA+18
                                

COLPM1  =       CTIA+19
COLPM2  =       CTIA+20
COLPM3  =       CTIA+21
COLPF0  =       CTIA+22
COLPF1  =       CTIA+23
COLPF2  =       CTIA+24
COLPF3  =       CTIA+25
COLBK   =       CTIA+26
PRIOR   =       CTIA+27
VDELAY  =       CTIA+28
GRACTL  =       CTIA+29
HITCLR  =       CTIA+30
CONSOL  =       CTIA+31
M0PF    =       CTIA+0
M1PF    =       CTIA+1
M2PF    =       CTIA+2
M3PF    =       CTIA+3
P0PF    =       CTIA+4
P1PF    =       CTIA+5
P2PF    =       CTIA+6
P3PF    =       CTIA+7
M0PL    =       CTIA+8
M1PL    =       CTIA+9
M2PL    =       CTIA+10
M3PL    =       CTIA+11
P0PL    =       CTIA+12
P1PL    =       CTIA+13
P2PL    =       CTIA+14
P3PL    =       CTIA+15
TRIG0   =       CTIA+16
TRIG1   =       CTIA+17
TRIG2   =       CTIA+18
TRIG3   =       CTIA+19
;
ANTIC   =       $D400
DMACTL  =       ANTIC+0
CHACTL  =       ANTIC+1
DLISTL  =       ANTIC+2
DLISTH  =       ANTIC+3
HSCROL  =       ANTIC+4
VSCROL  =       ANTIC+5
PMBASE  =       ANTIC+7
CHBASE  =       ANTIC+9
WSYNC   =       ANTIC+10
VCOUNT  =       ANTIC+11
PENH    =       ANTIC+12
PENV    =       ANTIC+13
NMIEN   =       ANTIC+14
NMIRES  =       ANTIC+15
NMIST   =       ANTIC+15
PIA     =       $D300
PORTA   =       PIA+0
PORTB   =       PIA+1
PACTL   =       PIA+2
PBCTL   =       PIA+3
;
;               OPERATING SYSTEM
                                

;
VIMIRQ  =       $0216           ; IMMEDITATE IRQ LOCATION 
VVBLKI  =       $0222           ; IMMEDIATE VERT BLANK NMI :
VDSLST  =       $0200           ; DISPLAY LIST NMI VECTOR 
ALPHA   =       $E000
;
                                

;                       EQUATES
DISPLY  =       $280
DISPL1  =       DISPLY+2        ; LDISP
DISPL2  =       DISPLY+15       ; LDISP
DISPL3  =       DISPLY+95       ; LDISP
DISTOP  =       $7C             ; LDISP SUB.
VOFLOW  =       50
VSTCEN  =       50
VOBCEN  =       $7A
HOFLOW  =       80
HSTCEN  =       80
HOBCEN  =       $7D
SCPTAB  =       81              ; FOR LOADING PTAB
SCBCD   =       100             ; FOR LOADING BCDCON
SCVCON  =       40              ; FOR LOADING VCON TABLES
ICON1   =       $1D40
ICON2   =       $1BFE
HORCHT  =       $3D             ; HOR EDGE OF CHART
VERCHT  =       $3F             ; VERT EDGE OF CHART
STRNUM  =       12              ; NUMBER OF STARS DISPLAYED
OBJNUM  =       5               ; NUMBER OF OBJECTS
EXPNUM  =       32              ; NUMBER OF EXPLOSION STARS
RAMNUM  =       OBJNUM+STRNUM+EXPNUM ; TOTAL NUMBER OF RAM :
OBLAST  =       OBJNUM-1        ; RAM LOC OF LAST OBJECT
RMLAST  =       RAMNUM-1        ; RAM LOC OF LAST STAR IN E:
STLAST  =       OBJNUM+STRNUM-1 ; RAM LOC OF LAST STAR IN R:
OBPHOT  =       OBJNUM-3        ; LAST PHOTON LOCATION
OBCOMP  =       OBJNUM-2        ; LAST PHOTON WHIC COULD BE:
INSET   =       $1B36           ; IST BYTE OF INSET
VMAX    =       100
HMAX    =       160             ; MAX HORIZ STAR POSITION D:
;
DBLUE   =       $A0             ; DARK BLUE
RED     =       $44             ; COLOR
LTBLUE  =       $92             ; COLOR
BRTBLU  =       $AF             ; COLOR
BRTRED  =       $4F             ; COLOR
DRKRED  =       $60             ; COLO
DIMRED  =       $42             ; COLOR
DIMBLU  =       $90             ; COLOR
YELLOW  =       $26             ; COLOR
DIM     =       $55             ; MEMMAP CODE FOR DIM STAR
MED     =       $AA
BRT     =       $FF
IRQMSK  =       $40             ; KEY INTERRUPT MASK
NOSTAR  =       $17E3           ; NO STAR DUING ATRACT
;
                                

;
;               CHARACTER GRAPHICS
        .ORG     $A000
        .proc codestart
;       ORG     $8000
;
;
CGRAPH:         
C0:     .byte      00,$7F,$47,$47,$47,$47,$47,$7F
C1:     .byte      00,$30,$10,$10,$10,$38,$38,$38
C2:     .byte      00,$78,$08,$08,$78,$40,$40,$78
C3:     .byte      00,$78,$08,$08,$7C,$0C,$0C,$7C
C4:     .byte      00,$60,$60,$60,$6C,$7C,$0C,$0C
C5:     .byte      00,$78,$40,$40,$78,$08,$08,$78
C6:     .byte      00,$78,$48,$40,$40,$7E,$42,$7E
C7:     .byte      00,$7C,$44,$04,$1C,$10,$10,$10
C8:     .byte      00,$38,$28,$28,$7C,$6C,$6C,$7C
C9:     .byte      00,$7C,$44,$44,$7C,$0C,$0C,$0C
CBLK:   .byte      0,0,0,0,0,0,0,0
CEQ:    .byte      $38,$38,$38,$00,$00,$38,$38,$38
CGCBLK: .byte      $80,$80,$80,$80,$80,$80,$80,$FF
CE:     .byte      $00,$3C,$20,$20,$78,$60,$60,$7C
CINF:   .byte      $00,$66,$99,$99,$99,$66,$00,$00
CMINUS: .byte      $00,$00,$00,$7E,$00,$00,$00,$00
;
                                

;
CPLUS:  .byte      $00,$18,$18,$18,$7E,$18,$18,$18
CPHI:   .byte      $00,$18,$7E,$DB,$99,$DB,$7E,$18
CV:     .byte      $66,$66,$66,$66,$66,$2C,$38,$30
CRHO:   .byte      0,$7C,$44,$44,$7C,$68,$6C,$6C
CTHETA: .byte      $00,$1C,$3E,$63,$5D,$63,$3E,$1C
CK:     .byte      $00,$46,$46,$44,$7C,$64,$66,$66
CT:     .byte      $FE,$92,$10,$18,$18,$18,$18,$18
CC:     .byte      $FC,$8C,$8C,$80,$80,$80,$84,$FC
CHLINE: .byte      0,0,0,0,0,0,0,$FF
CVLINE: .byte      $80,$80,$80,$80,$80,$80,$80,$80
CDOT:   .byte      0,0,0,0,0,0,0,$80
CSBASE: .byte      $80,$AA,$9C,$BE,$9C,$AA,$80,$FF
CZY2:   .byte      $80,$98,$80,$B6,$80,$8C,$80,$FF
CZY1:   .byte      $80,$8E,$80,$B8,$80,$9C,$80,$FF
CZY3:   .byte      $80,$B0,$98,$BE,$98,$B0,$80,$FF
;
                                

;
SESCAN:         
        .byte      0,0,$6C,$6F,$6E,$67,0,$72,$61,$6E,$67,$65,0,$73,$63,$61,$6E
BACKUP:         
        .byte      0,0,0,0,0,0,$61,$66,$74,0,$76,$69,$65,$77,0,0,0
;
GALCHT:         
        .byte      0,0
        .byte      0,$67,$61,$6C,$61,$63,$74,$69,$63,0,$63,$68,$61,$72,$74,0
        .byte      0,0
;
;
;
GLDISP:                         ; GAL CHT DISPLAY LIST
        .byte      $60,$46
        .word      GALCHT
        .byte      $F0,$47
        .word      CHTDIS
        .byte      7,7,7,7,7,7,7,7,$80,$46
        .word      MESAGE
        .byte      $46
        .word      DGALAC
        .byte      6,6,$41
        .word      DISPLY
;
;
PHASE8:         
;
                                

;
;               INIT SECTION
;
INIT:           
        LDA     #$00
        STA     SKCTL
        STA     TIMOUT          ; RESET TIMEOUT
        STA     MISDIF          ; MISSIONDIFFICULTY
        STA     RESET           ; ONE SHOT CONSOL
        LDA     #$03
        STA     SKCTL           ; TURN POKEY ON
;
INIT3:                          ; GAME SELECT, RESTART POIN:
        LDY     #SENATA-SENTAB
;
INIT4:                          ; ATTRACT MODE RESTART POIN:
        LDA     #$FF            ; GAME OVER
;
INIT1:                          ; GAME START RESTART POINT :
        STY     REPMSG
        STA     ATRACT
;       CLEAR I/O
        LDA     #$00
        TAX     
INIT2:          
        STA     CTIA,X
        STA     ANTIC,X
        CPX     #$0F            ; DONT RESET POKEY 
        BCS     INIT5
        STA     POKEY,X
INIT5:          
        STA     PIA,X
        .byte      $9D             ; STA ABS,X 
        .word      PAGE0           ; STA PAGE0,X  (ABSOLUTE) 
        INX     
        BNE     INIT2
; I/O CLEARED
;
;
        DEX                     ; X=FF
        TXS                     ; LOAD STACK PNTR
        CLD     
;
        LDA     #RAMMAP/256
        JSR     CLRMP1          ; CLEAR ALL RAM
; LD VECTOR RAM
        LDA     #<IRQVEC
        STA     VIMIRQ
        LDA     #IRQVEC/256
        STA     VIMIRQ+1
        LDA     #<VBNMI
        STA     VVBLKI
        LDA     #<DISNMI
        STA     VDSLST
        LDA     #VBNMI/256
        STA     VVBLKI+1
        LDA     #DISNMI/256
                                

        STA     VDSLST+1
;
;
; CONFIGURE PIA
;
        LDA     #$04
        STA     PACTL           ; TURN ON JOYSTICK
;
;
;
;
; CONFIGURE CTIA
;
        LDA     #$11
        STA     PRIOR
;
        LDA     #$03
        STA     GRACTL
;
        JSR     LDTABS          ; INIT TABLES 
;
;
; INIT DISPLAY LIST
        LDX     #$0A            ; KEY F, FRONT DISPLAY
        JSR     KEYS15          ; INIT FRONT VIEW
        LDA     ATRACT
        AND     #$80
        TAY     
        LDX     #DISPL3-DISPLY
        LDA     #$08
        JSR     LDISP           ; SHIP ALIVE OR DEAD
;
        LDA     #$20
        STA     WARP            ; WARP 5 SPEED
;
;
; CONFIGURE ANTIC
;
        LDA     #<DISPLY
        STA     DLISTL
        LDA     #DISPLY/256
        STA     DLISTH
        LDA     #$3E
        STA     DMACTL          ; DMA ON.
;
;-------------------------------------------------------
;-------------------------------------------------------
        LDA     #(PGRAPH-$0300)/256
        STA     PMBASE          ; LD PLAYER / MISSLE BASE 
;
;
;
;
; INIT NUMBER OF STARS
        LDA     #STLAST
        STA     NSTARS
;
                                

;
        LDX     MISDIF          ; GAME TYPE MESSAGE
        LDY     MSENTB,X		; DIFFERS FROM STAR RAIDERS ROM FILE.  LDY MSENTB+1,X
        JSR     LDMESS
;
;
;
;
;
; ENABLE INTERRUPTS
        LDA     #IRQMSK
        STA     IRQEN
        CLI                     ; IRQS READY
        LDA     #$C0
        STA     NMIEN           ; NMIS READY
;
; END INIT
;
                                

; MAIN PROGRAM
MAIN:           
;
; MAIN FLOW CHART
;  START
; WAIT FOR VBLANK
; CLEAR AND LOAD STARS/OBJECTS
; MOVE ROUTINES
; PLAYER INTERFACE SECTION                GAME ON ONLY
; SERVICE SECTION                         GAME ON ONLY
; HIT DETECT                              GAME ON ONLY
; SERVICE CONTINOUS RUNNING ROUTINES
; JUMP TO START
;
;
        LDA     PROGST
        BEQ     MAIN            ; WAIT FOR VBLANK NMI 
        LDA     #$00            ; RESET VBLANK STATUS REGIS:
        STA     PROGST
;
;
;
;
;
;               UPDATE MEMORY MAP RAM AND PLAYERS RAM
;
;               CLRSTR
;               CLEAR STAR ROUTINE
        LDA     CNSTAR          ; THIS FLAGS SAYS OLDPS NOT:
        BEQ     CLRSR2
        LDX     #OBLAST         ; LAST LOCATION OF OBJECT I:
;proc
CLRSR1:         
        INX     
        LDY     OLDVER,X
        LDA     VCONL,Y
        STA     PNTR
        LDA     VCONH,Y
        STA     PNTR+1
        LDY     OLDHOR,X
        LDA     OLDBYT,X
        STA     (PNTR),Y        ; BYTE RESTORED 
        CPX     CNSTAR
        BCC     CLRSR1
        LDA     #$00
        STA     CNSTAR          ; STARS CLEARED 
CLRSR2:         
;
;
;               STOSTR
;
;       STORE STAR IN RAM MAP ROUTINE
;
        LDA     HFLAG           ; IN HYPER JUMP  ? 
        BMI     STOSR1          ; YES , NO STORE. 
;
;
                                

;
        LDX     NSTARS          ; LAST BYTE OF STAR RAM TO :
        STX     CNSTAR          ; STARS POINTERS DEFINED OK:
STOSR2:         
;
        LDA     VPOS,X
        STA     OLDVER,X
        TAY     
        LDA     VCONL,Y
        STA     PNTR
        LDA     VCONH,Y
        STA     PNTR+1
        LDA     HPOS,X
        LSR     A
        LSR     A
        STA     OLDHOR,X
        TAY     
        LDA     (PNTR),Y
        STA     OLDBYT,X        ; BYTE SAVED 
        ORA     STRBYT,X
        STA     (PNTR),Y
;
        DEX     
        CPX     #OBLAST
        BNE     STOSR2          ; DO NEXT STAR 
STOSR1:         
        LDA     TIMOUT
        BPL     STOSR3
        LDA     #$00
        STA     NOSTAR
        STA     NOSTAR+1
        STA     NOSTAR-39
        STA     NOSTAR-40
STOSR3:         
;
;
; CLROBJ
; CLEAR OBJECT RAM
; OBJECT 4
        LDA     #$00
        LDY     OLDVER+4
        LDX     OLDNUM+4
CLROB1:         
        STA     MGRAPH,Y
        INY     
        DEX     
        BPL     CLROB1
;               OBJECT 3
        LDY     OLDVER+3
        LDX     OLDNUM+3
CLROB2:         
        STA     PGRAP3,Y
        INY     
        DEX     
        BPL     CLROB2
;               OBJECT 2
        LDY     OLDVER+2
                                

        LDX     OLDNUM+2
CLROB3:         
        STA     PGRAP2,Y
        INY     
        DEX     
        BPL     CLROB3
;               OBJECT 1
        LDY     OLDVER+1
        LDX     OLDNUM+1
CLROB4:         
        STA     PGRAP1,Y
        INY     
        DEX     
        BPL     CLROB4
;               OBJECT 0
        LDY     OLDVER+0
        LDX     OLDNUM+0
CLROB5:         
        STA     PGRAP0,Y
        INY     
        DEX     
        BPL     CLROB5
;
;

;               STOOBJ
;               STORE OBJECT ROUTINE
;
;       OBJECT 4, ALWAYS PHOTON, OR DOCKING OBJECT
        LDA     GINDEX+4
        CMP     #$01            ; DEFINE CARRY 
        LDY     GRAPH+4
        LDX     VPOS+4
        STX     OLDVER+4
        LDA     NUMBYT+4
        STA     TEMP
        STA     OLDNUM+4
STOOB1:         
        LDA     PHGRAF,Y
        BCS     STOOB8
        AND     RANDOM
STOOB8:         
        STA     MGRAPH,X
        INY     
        INX     
        DEC     TEMP
        BPL     STOOB1
;       OBJECT 3 , ALWAYS PHOTON
        LDA     GINDEX+3
        CMP     #$01
        LDY     GRAPH+3
        LDX     VPOS+3
        STX     OLDVER+3
        LDA     NUMBYT+3
        STA     TEMP
        STA     OLDNUM+3
STOOB2:         
                                

        LDA     PHGRAF,Y
        BCS     STOOB9
        AND     RANDOM
STOOB9:         
        STA     PGRAP3,X
        INX     
        INY     
        DEC     TEMP
        BPL     STOOB2
;       OBJECT 2, (VARIABLE GRAPHIC)
        LDA     GINDEX+2
        CMP     #$01            ; DEFINE CARRY 
        LDY     GRAPH+2
        LDX     VPOS+2
        STX     OLDVER+2
        LDA     NUMBYT+2
        STA     TEMP
        STA     OLDNUM+2
STOOB3:         
        LDA     PHGRAF,Y
        BCS     STOOB7
        AND     RANDOM
STOOB7:         
        STA     PGRAP2,X
        INX     
        INY     
        DEC     TEMP
        BPL     STOOB3
;               OBJECT 1 (VARIABLE)
        LDY     GRAPH+1
        LDX     VPOS+1
        STX     OLDVER+1
        LDA     NUMBYT+1
        STA     TEMP
        STA     OLDNUM+1
STOOB5:         
        LDA     ZYGRAF,Y
        STA     PGRAP1,X
        INX     
        INY     
        DEC     TEMP
        BPL     STOOB5
;                       OBJECT 0 (VARIABLE)
        LDY     GRAPH+0
        LDX     VPOS+0
        STX     OLDVER+0
        LDA     NUMBYT+0
        STA     TEMP
        STA     OLDNUM+0
STOOB6:         
        LDA     ZYGRAF,Y
        STA     PGRAP0,X
        INX     
        INY     
        DEC     TEMP
        BPL     STOOB6
;
                                

;               UPDATE HORIZ
;
        LDA     HPOS+0
        STA     HPOSP0+0
        LDA     HPOS+1
        STA     HPOSP0+1
        LDA     HPOS+2
        STA     HPOSP0+2
        LDA     HPOS+3
        STA     HPOSP0+3
        LDA     HPOS+4
        STA     HPOSP0+7
        CLC     
        ADC     #$02
        STA     HPOSP0+6
        ADC     #$02
        STA     HPOSP0+5
        ADC     #$02
        STA     HPOSP0+4

;
;               END UPDATE MEMORY MAP RAM AND PLAYERS RAM
;
;
;
;
;       STARS/OBJECTS MOVE ROUTINES
        BIT     DISFLG
        BMI     MAIN1           ; NO ROTATE IN GALACTIC CHA:
;
;               YROTAT
;               ROTATE ALL LEFT AND RIGHT
        LDA     HORJOY          ; HORIZ JOYSTICK ? 
        BEQ     YROTA1          ; NO 
        STA     TEMP3
        LDY     NSTARS          ; LAST BYTE OF STARS 
YROTA2:         
        STY     TEMP4           ; TEMP STORE 
        CLC     
        TYA     
        TAX     
        ADC     #RAMNUM         ; YPOS 
        TAY     
        JSR     ROHELP
        TYA     
        TAX     
        LDY     TEMP4
        JSR     ROHELP
        DEY     
        BPL     YROTA2
YROTA1:         
;
;
;
;               ZROTAT
;               ROTATE ALL UP AND DOWN
        LDA     VERJOY          ; VERT JOYSTICK ? 
                                

        BEQ     ZROTA1          ; NO 
        STA     TEMP3
        LDY     NSTARS
ZROTA2:         
        STY     TEMP4
        CLC     
        TYA     
        TAX     
        ADC     #RAMNUM*2       ; ZPOS 
        TAY     
        JSR     ROHELP
        TYA     
        TAX     
        LDY     TEMP4
        JSR     ROHELP
        DEY     
        BPL     ZROTA2
ZROTA1:         
;
;

MAIN1:          
;               XMOVER
;               UPDATE ALL XPOS DUE TO FORWARD SHIP MOTION
;               SUBTRACT SPEED FROM XPOS
        LDX     NSTARS          ; X=INDEX TO STARS/POBJECT :
XMOVE1:         
        CPX     #OBJNUM         ; PHOTONS ? 
        BCS     XMOVE2          ; NO. 
        LDA     GINDEX,X
        BEQ     XMOVE3
XMOVE2:         
        SEC     
        LDA     XPOSL,X
        SBC     SPEED
        STA     XPOSL,X
        LDA     XPOSH,X
        SBC     HISPED
        STA     XPOSH,X
        LDA     XSIGN,X
        SBC     #$00            ; CARRY ONLY 
        STA     XSIGN,X
XMOVE3:         
        DEX     
        BPL     XMOVE1          ; NEXT STAR 
;               ALL DONE
;
;

;               MOTION
;       OTHER MOTION SUCH AS DUE TO ZYLON SHIP POWER
;       OR PHOTONS

;       XINCRE,YINCRE,ZINCRE ARE ALL SIGN-MAGNITUE TYPES
        LDX     NSTARS
MOTIN1:         
        CPX     #STLAST         ; REG STARS ? 
                                


        BNE     MOTIN9          ; NO 
        LDX     #OBLAST         ; LAST OBJ 
MOTIN9:         
        TXA     
MOTIN2:         
        TAY     
        LDA     #$00
        STA     TEMP1
        LDA     XINCRE,Y
        BPL     MOTIN3
        EOR     #$7F
        CLC     
        ADC     #$01
        BCS     MOTIN3
        DEC     TEMP1
MOTIN3:         
        CLC     
        ADC     XPOSL,Y
        STA     XPOSL,Y
        LDA     XPOSH,Y
        ADC     TEMP1
        STA     XPOSH,Y
        LDA     XSIGN,Y
        ADC     TEMP1
        STA     XSIGN,Y
;
        TYA     
        CLC     
        ADC     #RAMNUM
        CMP     #RMLAST*3       ; ALL DONE ? 
        BCC     MOTIN2          ; NO 
        DEX     
        BPL     MOTIN1          ; NEXT STAR OR OBJECT 
;
;

;               BOUNDS
;
        LDY     #OBLAST         ; ONLY OBJECTS 
BOUND1:         
        TYA     
        TAX     
        LDA     #$02
        STA     TEMP
BOUND3:         
        LDA     XSIGN,X
        CMP     #$02
        BCC     BOUND4
;               OUT OF BOUNDS
        ASL     A
        LDA     #$00
        STA     XSIGN,X
        BCS     BOUND5
        INC     XSIGN,X
        EOR     #$FF
BOUND5:         
                                

        STA     XPOSH,X
BOUND4:         
        TXA     
        CLC     
        ADC     #RAMNUM
        TAX     
        DEC     TEMP
        BPL     BOUND3
        DEY     
        BPL     BOUND1          ; NEXT STAR 
;
;

;               CALCVH
;       CALCULATE V,H POS FOR ALL STARS/OBJ
;
        LDA     DISFLG
        CMP     #$02
        BCS     CALC14          ; NOT FRONT OR BACK 
;
        LDX     NSTARS          ; X=INDEX OF STARS 
CALCV1:                         ;STAR LOOP 
        LDA     #$FF
        LDY     XSIGN,X
        CPY     DISFLG
        BEQ     CALCV5
;
;               UPDATE VPOS
;
        LDA     ZSIGN,X         ; 2'S COMPLE ZPOS? 
        BNE     CALCV8          ; NO 
;                       2'S COMPLEMENT
        SEC     
        LDA     #$00
        SBC     ZPOSL,X
        STA     TEMP
        LDA     #$00
        SBC     ZPOSH,X
        STA     TEMP1
        JMP     CALCV9
CALCV8:         
        LDA     ZPOSL,X
        STA     TEMP            ; STORE IN TOP REG 
        LDA     ZPOSH,X
        STA     TEMP1
CALCV9:         
        JSR     DIVIDE          ; DIVIDE ZPOS BY XPOS 
        JSR     STVPOS          ; STOE VPO 
;
;                       UPDATE HORIZ POS
;
;
        LDA     YSIGN,X         ; 2'S COMPLE YPOS ? 
        BNE     CALCV3          ; NO. 
;               2'S COMPLEMENT
        SEC     
        LDA     #$00
                                

        SBC     YPOSL,X
        STA     TEMP            ; STORE IN TOP(NUMERATOR)RE:
        LDA     #$00
        SBC     YPOSH,X
        STA     TEMP1
        JMP     CALCV4
CALCV3:         
        LDA     YPOSL,X         ; SOTRE IN TOP REG 
        STA     TEMP
        LDA     YPOSH,X
        STA     TEMP1
CALCV4:         
        JSR     DIVIDE          ; DIVIDE YPOS BY XPOS 
CALCV5:         
        JSR     STHPOS          ; STORE HPOS
;
        DEX     
        BPL     CALCV1          ; NEXT STAR
; ALL DONE
CALC14:         
;
;

        JSR     CSERVE          ; SERVICE GALACTIC CHART 
;
;
;               SSERVE
;               SECTOR SCAN SERVE
        BIT     DISFLG
        BVC     SSERV1
        LDX     #INSTB2-INSTAB  ; LOAD SECTOR SCAN SHIP 
        JSR     LDINST
        BIT     DAMAGE+4        ; SECTOR SCAN DAMAGE
        BVS     SSERV1
;
        LDX     NSTARS
SSERV2:         
        LDA     XPOSH,X
        LDY     XSIGN,X
        BNE     SSERV3
        EOR     #$FF
SSERV3:         
        TAY     
;
        LDA     PTAB,Y
        JSR     STVPOS
        LDA     YPOSH,X
        LDY     YSIGN,X
        BNE     SSERV4
        EOR     #$FF
SSERV4:         
        TAY     
;
        LDA     PTAB,Y
        JSR     STHPOS
        DEX     
        BPL     SSERV2
                                

SSERV1:         
;
;

;               OBJCOL
;               SELECT OBJECT COLOR , GRAPHIC
        LDX     #OBLAST+1
OBJCL2:                         ; OBJCT LOOP 
        DEX     
        BPL     OBJCL1
        JMP     OBJC12
OBJCL1:         
        LDA     #$00
        STA     GRAPH,X         ; SET GRAPH PNTR TO NULL GR:
        STA     NUMBYT,X        ; STORE 1 BYTE ONLY 
        BIT     DISFLG          ; GALACTIC CHART ?
        BPL     OBJCL3          ; NO 
        CPX     #$03            ; OBJ 0,1,2 ? 
        BCC     OBJCL2          ; YES , NO DISPLAY 
OBJCL4:         
        LDA     RANDOM          ; RANDOM COLOR 
        LDY     #$F2            ; SMALL SIZE 
        BMI     OBJCL6          ; JMP 
OBJCL3:         
        CMP     STFLAG,X        ; OBJECT ON ? 
        BEQ     OBJCL2          ; NO 
        BVS     OBJCL4          ; SECTOR SCAN 
        LDY     XPOSH,X         ; INTENSITY AND GRAPHIC SIZ:
        BIT     BASFLG          ; STARBASE ? 
        BVC     OBJCL6          ; NO 
        CPX     #$02            ; SBASE OBJECTS ? 
        BCS     OBJCL8          ; NO 
        LDA     HPOS+2          ; GANG OBJ 0,1,2 TOGETHER 
        CLC                     ; OBJ 2 IS REFERENCE 
        ADC     BHORTB,X        ; HORIZ OFFSET , +8,-8
        STA     HPOS,X
        LDA     VPOS+2          ; GANG VPOS 
        CLC     
        ADC     #4
        STA     VPOS,X
        LDY     XPOSH+2         ; ALL USE OBJ2 POSIT. 
OBJCL8:         
        LDA     BINTIM          ; MODULATE STARBASE COLOR 
        AND     #$0F
OBJCL6:         
        STA     TEMP1           ; COLOR MODULATE 
        TYA                     ; XPOSH 
        LDY     VPOS,X          ; IN BOUNDS CHECK 
        CPY     #$CC            ; IN BOUNDS ? 
        BCS     OBJCL2          ; NO 
        LDY     DISFLG          ; FRONT OR BACK ? 
        BEQ     OBJCL7          ; FRONT 
        EOR     #$FF            ; ONES COMPLEMENT XPOSH 
OBJCL7:         
        CMP     #$20            ; TOO FAR AWAY ? 
        BCS     OBJCL2          ; YES
        CMP     #$10            ; SMALLEST SIZE ? 
                                

        BCC     OBJCL5          ; NO 
        LDA     #$0F            ; SMALL SIZE 
OBJCL5:                         ; LD COLOR, GRAPHIC PNTRS 
        STA     TEMP            ; TEMP SAVE XPOSH 
        ORA     GINDEX,X        ; TYPE OF GRAPHIC 
        LSR     A               ; ONLY 8 VALUES PER TYPE 
        TAY     
        LDA     GPOINT,Y        ; OFFSET FROM PHGRAF, OR ZY
        STA     GRAPH,X         ; HOLDS INDEX 
        LDA     NBYTAB,Y
        STA     NUMBYT,X        ; NUMBER OF BYTES TO SAVE 
        TYA     
        LSR     A
        LSR     A
        LSR     A
        TAY                     ; GINDEX ONLY 
        LDA     COLTAB,Y        ; CHROMA OF OBJ 
        CPY     #$08            ; BASE STAR ? 
        BNE     OBJC11          ; NO
        EOR     RANDOM          ; RANDOM COLOR 
OBJC11:         
        LDY     TEMP            ; DISTANCE FOR INTENSITY 
        EOR     COLINT,Y        ; INTENSITY 
        EOR     TEMP1           ; COLOR MODULATE , IF ANY 
        LDY     CLINDX,X        ; WHERE TO STORE 
        STA     COLRAM,Y        ; COLOR UPDATED 
        JMP     OBJCL2          ; NEXT OBJ 
OBJC12:         

;               STRBRT
;               STAR BIRGHTNESS INTENSITY NEW STAR CALC
;
        LDY     #BRTBLU
        LDX     SPABAK
        LDA     REDFLG
        BEQ     STRBR2
        DEC     REDFLG          ; TIME OUT RED ALERT 
        LDY     #BRTRED
        AND     #$20
        BEQ     STRBR2
        LDX     #DIMRED
        LDY     #DRKRED
STRBR2:         
        STY     COLRAM+6        ; PF2 
        STX     COLRAM+8        ; BAK 
        LDX     NSTARS          ; X=INDWX , INIT TO LAST ST:
STRBR1:         
        LDA     XPOSH,X         ; INTENSITY DETERMINED BY X:
        LDY     DISFLG          ; FRONT OR BACK  ? 
        CPY     #$01            ; ALL BUT BACK VIEW WILL BR:
        BNE     STRBR5          ; FRONT 
        CMP     #$F0            ; STAR AT MINUS BOUNDS ? 
        BCS     STRBR6
        JSR     NEWSTR
STRBR6:         
        EOR     #$FF            ; COMPLEMENT XPOS 
STRBR5:         
                                

        CMP     #$10            ; USE DEFAULT ? 
        BCC     STRBR4          ; NO
        LDA     #$0F            ; DEFAULT
STRBR4:         
        ASL     A
        AND     #$1C
        ORA     TIMERX          ; MULTIPLEX     WITH FRAME :
        TAY                     ; FOR 8 APPARENT LEVELS OF :
        LDA     BRTABL,Y        ; WHICH PLAYFIELD
        STA     TEMP
        LDA     HPOS,X
        AND     #$03
        TAY     
        LDA     MASK,Y
        AND     TEMP
        STA     STRBYT,X        ; DATA TO STORE IN STOSTR 
        DEX     
        CPX     #OBJNUM         ; ALL DONE WITH STARS ? 
        BCS     STRBR1          ; NEXT STAR 
; ALL DONE

;
;       END STAR/OBJECTS MOVE ROUTINES
;
;
;
;       GAME ON ROUTINES
;               PLAYER INTERFACE SECTION AND SERVICE SECTIO:
;
        BIT     ATRACT          ; GAME OVER LOCKOUT PLAYER 
        BVC     MAIN4           ; YES 
        JMP     MAIN3
MAIN4:          
;
        JSR     KEYSRV          ; SERVICE KEYBOARD 
;               JOYSTK
;               JOYSTICK EVALUATION ROUTINE
        LDA     PORTA
        TAY                     ; STORE TEMP 
        AND     #$03            ; VERT ONLY 
        TAX     
        LDA     JOYTAB,X        ; CODE FOR VERT
        STA     VERJOY
        TYA                     ; PORT A AGAN 
        LSR     A
        LSR     A
        AND     #$03
        TAX                     ; HORIZ ONLY 
        LDA     JOYTAB,X        ; CODE FOR HORIZ 
        STA     HORJOY

        JSR     HITZYL          ; HIT ZYLON 
        JSR     PHOTON          ; SERVICE TRIGGERS 
; ASERVE
; ATTACK CPMPUTER SERVICE
        BIT     DAMAGE+3
        BVS     ASERV2
                                

        LDA     ATENER          ; ATTACK ON ?
        BEQ     ASERV2          ; NO
        LDA     DISFLG
        BNE     ASERV1
        JSR     UPINST
ASERV1:         
;
; AUTO TARGET SELECTOR
;
        LDX     DCSTOR
        LDA     ATTARG
        BMI     ASERV4
        TAX     
        ORA     #$80
        STA     ATTARG
ASERV4:         
        LDA     STFLAG,X
        BNE     ASERV3
        TXA     
        EOR     #$01
        TAX     
        LDA     STFLAG,X
        BNE     ASERV3
        LDX     DCSTOR
ASERV3:         
        STX     DCSTOR
;
; COMPUTER AUTO TRACKING
        LDA     TRKFLG
        BEQ     ASERV2
        LDA     DISFLG
        CMP     #$02            ; FRONT OR BAK ? 
        BCS     ASERV2          ; NO 
        EOR     #$01            ; WHICH DISFLG 
        CMP     XSIGN,X         ; OBJ IN SIGHT ? 
        BEQ     ASERV2          ; YES 
        TAX     
        LDA     TRKTAB,X        ; WHICH KEY FOR SWITHING DI:
        STA     THEKEY          ; SWITCH DISPLAY 
ASERV2:         
;

        JSR     BSERVE          ; SERVICE STARBASE 
        JSR     THINK           ; SERVICE ZYLON BRAIN 
; HITSHP
; RAIDER HIT PHOTON HIT DETECT
        LDA     BASFLG          ; STARBASE ?
        BNE     HITSH1          ; YES 
        LDA     STFLAG+2
        BEQ     HITSH1
        LDY     XPOSH+2
        INY     
        CPY     #$02
        BCS     HITSH1
        LDY     YPOSH+2
        INY     
        CPY     #$02
                                

        BCS     HITSH1
        LDY     ZPOSH+2
        INY     
        CPY     #$02
        BCS     HITSH1
; A HIT !!
        JSR     DAMCTL
        LDY     #$02
        JSR     EXPLOS
        LDX     #$7F
        LDA     SPABAK          ; DEAD ? 
        BNE     HITSH2          ; NO 
        LDX     #$0A            ; FRONT 
        JSR     KEYS15
        LDY     #SENDST-SENTAB
        LDX     #$08            ; DESTROYED 
        JSR     CRATE
        LDX     #DISPL3-DISPLY
        LDY     #$80
        LDA     #$08
        JSR     LDISP
        JSR     CLRMAP
        LDX     #$40            ; ITS ALL OVER 
        STX     BIGEXP
        LDX     #$FF            ; HIT ME DEAD 
HITSH2:         
        STX     HITME
        LDA     #$00
        STA     STFLAG+2
        LDA     #$02
        STA     PHEXWT
;
        LDX     #$01
        JSR     PANDS6
        LDX     #NOITB1-NOISTB
        JSR     NOISE
HITSH1:         

;               END GAME ON ROUTINES
MAIN3:          
;
;
;               CONTINOUS RUNNING ROUTINES
;               CONSRV
;               SERVICE CONSOL ROUTINE
        LDY     RESET
        LDA     CONSOL
        EOR     #$FF            ; POSITIVE LOGIC
        AND     #$03
        STA     RESET
        BEQ     CONSR2
        DEY     
        BPL     CONSR2
        STA     TIMOUT          ; RESET TIMOUT 
        CMP     #$02
        BCS     CONSR3          ; GAME SELECT 
        LDA     #$00
                                

        TAY     
        JMP     INIT1           ; GAME START 
CONSR3:         
        INC     MISDIF
        LDA     MISDIF
        AND     #$03
        STA     MISDIF
        JMP     INIT3
CONSR2:         
;
;

        JSR     PANDIS          ; SERVICE PANNEL DISPLAY 
        JSR     HSERVE          ; SERVICE HYPERWARP JUMP 
        JSR     MSERVE          ; SERVIE MESSAGE 
        JSR     TIMERS          ; EVALUATE ALL TIMERS , TIM:
;               END CONTINOUS RUNNING ROUTINES
;
;
;
        JMP     MAIN            ; END VBLANK ROUTINE, WAIT :
;
;
;
                                

;
;               NMI INTERRUPT SERVICE SECTION
;
;
VBNMI:          
        LDA     #$FF
        STA     PROGST          ; SET PROGST VBLANK NMI FLA:
        LDA     #ALPHA/256
        STA     CHBASE          ; USE STANDARD ALPHA CHARAC:
        LDX     COLRAM+8        ; BAK 
        LDA     RANDOM
        BIT     HITME
        BVC     VBLNK4
        BMI     VBLNK1
        AND     #$72
        ORA     #$40
VBLNK1:         
        TAX     
VBLNK4:         
        LDA     DISFLG
        CMP     #$03
        BCC     VBLNK2
        LDX     #DBLUE
VBLNK2:         
        STX     COLRAM+8        ; BAK 
;
        LDX     #$08
VBLNK3:         
        LDA     COLRAM+0,X
        STA     COLPM0,X
        DEX     
        BPL     VBLNK3
;
;
        STA     HITCLR          ; RESET HITS 
;
        JSR     AUDIO           ; SERVICE AUDIO 
;
        INC     BINNMI          ; ATRACT MODE STUFF 
        BNE     VBLNK5
        LDA     TIMOUT
        BMI     VBLNK5
        INC     TIMOUT
        BPL     VBLNK5
        LDY     #$00
        JMP     INIT4
VBLNK5:         
;
;
        JMP     POPALL
;
DISNMI:         
        PHA                     ; PUSH ALL REGISTERS FOR OP:
        TXA     
        PHA     
        TYA     
        PHA     
                                

        LDA     #ALPHA/256
        LDY     VCOUNT
        CPY     #$60
        BEQ     DISNM1
        LDA     #CGRAPH/256
DISNM1:         
        STA     CHBASE          ; USE FUTURE TYPE CHARACTER:
;
        LDX     #$04
        STA     WSYNC
DISNM2:         
        LDA     COLRAM+9,X
        STA     COLPF0,X
        DEX     
        BPL     DISNM2
;
;               READ HITS
        LDA     M0PL
        ORA     M1PL
        ORA     M2PL
        ORA     M3PL
        STA     PHITS+1         ; PHOTON 3 STORED 
        LDA     P3PL
        STA     PHITS+0         ; PHOTON 2 STORED 
POPALL:         
        PLA     
        TAY     
        PLA     
        TAX     
        PLA     
;
; END POP
;
        RTI     
;
;
                                

;
;
;
;               IRQ INTERRUPT SERVICE SECTION
;
IRQVEC:         
;               PUSH ACCUM REGISTERS
        PHA     
;                       END PUSH
;
        LDA     #$00
        STA     IRQEN           ; RESET IRQ'S
        LDA     #IRQMSK
        STA     IRQEN
        LDA     KBCODE
        ORA     #$C0
        STA     THEKEY
        PLA     
        RTI     
;
;                       END IRQ INTERRRUPT SECTION
;
;
;
                                

; SUBROUTINES;
;
;
;
LDINS6:                         ; LOAD UP THE LINE
        STA     NUMPTS,Y
        INX     
        DEY     
        BPL     LDINS4
        JSR     DRAWER
LDINST:         
; LOAD INSET         RESERVE BYTE=$FE
; X= INITIAL START OF PNTR IN INSTAB
        LDA     #$05
        STA     TARPTR          ; DEFINE TARGET POINTER 
        BIT     DAMAGE+3        ; COMPUTER 
        BVS     LDINS2
LDINS1:         
        LDY     #$02
LDINS4:         
        LDA     INSTAB,X
        CMP     #$FE            ; ALL DONE 
        BNE     LDINS6          ; NO 
LDINS2:         
        RTS     
;
;
DRAWER:                         ; DRAW THE LINE 
        LDA     #$55
DRAWR3:                         ; ENTRY POINT FROM UPINST  :
        STA     TEMP1
        LDA     NUMPTS
        STA     TEMP4
        AND     #$7F
        STA     NUMPTS
DRAWR1:         
        LDY     VDRAW
        LDA     VCONL,Y
        STA     PNTR
        LDA     VCONH,Y
        STA     PNTR+1
        LDA     HDRAW
        LSR     A
        LSR     A
        STA     TEMP
        LDA     HDRAW
        AND     #$03
        TAY     
        LDA     MASK,Y
        AND     TEMP1
        LDY     TEMP
        ORA     (PNTR),Y
        STA     (PNTR),Y
        BIT     TEMP4
        BPL     DRAWR4
        INC     VDRAW
        BNE     DRAWR5          ; JUMP, VDRAW CANNOT CROSS :
                                

DRAWR4:         
        INC     HDRAW
DRAWR5:         
        DEC     NUMPTS          ; POINTS ALL DRAWN ? 
        BNE     DRAWR1
DRAWR2:         
        RTS     
;
;
;
;
UPINST:         
; UPDATE  INSET
;
; FIRE CONTROL
        LDX     DCSTOR          ; WHICH OBJECT
        LDY     TARPTR
        CPY     #$05
        BCS     UPINS2
; LD TARGET DISPLAY
        LDA     HTARGT
        STA     HDRAW
        LDA     ZYTARG,Y
UPINS8:         
        ASL     A
        STA     TEMP2
        BCC     UPINS9
        LDA     #$81
        STA     NUMPTS
        LDA     VTARGT
        STA     VDRAW
        LDA     #$AA
        JSR     DRAWR3
UPINS9:         
        INC     HDRAW
        LDA     TEMP2
        BNE     UPINS8
        INC     VTARGT
UPIN10:         
        INC     TARPTR
        RTS     
UPINS2:         
        CPY     #$0A
        BCC     UPIN10
        LDA     STFLAG,X
        BEQ     UPINS3
        LDA     YPOSH,X
        LDY     YSIGN,X
        BEQ     UPINS4
        CMP     #$0C
        BCC     UPINS5
        LDA     #$0B
        BPL     UPINS5          ; JUMP 
UPINS4:         
        CMP     #$F5
        BCS     UPINS5
        LDA     #$F5
                                

UPINS5:         
        CLC     
        ADC     #131
        STA     HTARGT
        LDA     ZPOSH,X
        EOR     #$FF
        LDY     ZSIGN,X
        BNE     UPINS6
        CMP     #$05
        BCC     UPINS7
        LDA     #$04
        BPL     UPINS7          ; JUMP
UPINS6:         
        CMP     #$FA
        BCS     UPINS7
        LDA     #$FA
UPINS7:         
        CLC     
        ADC     #77
        STA     VTARGT
        LDA     #$00
        STA     TARPTR
UPINS3:         
;               CLEAR INSET
        LDA     #<INSET
        STA     PNTR
        LDA     #INSET/256
        STA     PNTR+1
        LDX     #14
UPIN12:         
        LDY     #$06
UPIN13:         
        LDA     (PNTR),Y
        AND     #$55
        STA     (PNTR),Y
        DEY     
        BPL     UPIN13
        CLC     
        LDA     PNTR
        ADC     #40
        STA     PNTR
        BCC     UPIN14
        INC     PNTR+1
UPIN14:         
        DEX     
        BPL     UPIN12
;               DONE CLEAR INSET
        LDX     DCSTOR
        INY                     ; Y=0 
        LDA     LOKWAT
        BEQ     UPIN11
        DEC     LOKWAT
        BNE     UPINS1
UPIN11:         
        LDA     HTARGT
        CMP     #129
        BCC     UPINS1
                                

        CMP     #133
        BCS     UPINS1
        LDA     #$AA
        STA     ICON2
        STA     ICON2+6
        LDA     VTARGT
        CMP     #75
        BCC     UPINS1
        CMP     #79
        BCS     UPINS1
        LDA     #$AA
        STA     ICON2+160
        STA     ICON2+166
        LDA     XPOSH,X
        CMP     #$0C
        BCS     UPINS1
        LDY     #$A0
        STY     ICON1
        STY     ICON1+40
        STY     ICON1+2
        STY     ICON1+42
UPINS1:         
        STY     LOKFLG
        RTS     
;
;
;
;
;
;
HSERVE:         
; HYPERWARP SERVICE ROUTINE
        LDY     HFLAG           ; HWARP ?
        BEQ     HSERV4          ; NO
        LDA     SPEED
        CMP     #$FE            ; UP TO SPEED ?
        BCS     HSERV5          ; YES
        CMP     #$80            ; DO LINES ?
        BCC     HSERV6          ; NO
        JSR     HLINES
HSERV6:         
; STEERING STUFF
        LDA     #$03
        STA     DCSTOR
        LDA     #$90
        STA     GINDEX+3
        STA     STFLAG+3
        LDA     #$1F
        STA     XPOSH+3
        SEC     
        LDA     VPOS+3
        SBC     #VOBCEN-3
        CLC     
        ADC     VSTEER
        AND     #$7F
        STA     HYVPOS
        SEC     
                                

        LDA     HPOS+3
        SBC     #HOBCEN
        CLC     
        ADC     HSTEER
        AND     #$7F
        STA     HYHPOS
        LDA     MISDIF
        BEQ     HSERV7
        LDA     RANDOM
        LDY     DISFLG
        BEQ     HSERV9
        STA     HPOS+3
        STA     VPOS+3
HSERV9:         
        CMP     #$10
        BCS     HSERV4
HSERV7:         
        LDA     RANDOM
        ORA     #$10
        AND     STERMK
        STA     YINCRE+3
        LDA     RANDOM
        ORA     #$10
        AND     STERMK
        STA     ZINCRE+3
HSERV4:         
        RTS     
HSERV5:         
        TYA                     ; IN JUMP ?
        BMI     HSERV8          ; YES 
;               BEGIN JUMP
        LDA     #$FF
        STA     HFLAG
        LDX     #CH4TB1-CH4TAB
        JSR     NOTINT
        JSR     CSERV8          ; JUMP ENERGY 
        LDY     #SENHSP-SENTAB
        JMP     HABOR1
HSERV8:                         ; IN JUMP 
        DEC     HYPENG          ; ALL DONE ? 
        BEQ     HSER10          ; YES 
        LDX     #$02            ; DEC ENERGY 
        JMP     PANDS6
HSER10:         
;               HWARP COMPLETE
        LDY     #SENHWC-SENTAB
        JSR     HABOR2
        LDA     HYHPOS
        STA     GHPOS
        LDA     HYVPOS
        STA     GVPOS
        LSR     A
        AND     #$07
        TAX     
        LDA     JMASK,X
        STA     JMPMSK
        LDY     HYPQAD
                                

        STY     QUADRT
        LDA     #$00
        STA     BASFLG
        LDX     CHTRAM,Y
        BPL     HSERV2
        LDA     #$FF            ; STARBASE STUFF 
        STA     BASFLG
        LDY     #$00
HSERV3:         
        LDA     #$00
        STA     XINCRE+2,Y
        LDA     #$01
        STA     XSIGN+2,Y
        LDA     RANDOM
        AND     JMPMSK
        STA     XPOSH+2,Y
        TYA     
        CLC     
        ADC     #RAMNUM
        TAY     
        CMP     #RAMNUM*3
        BCC     HSERV3
        LDA     XPOSH+2
        ORA     #$71
        STA     XPOSH+2
        LDX     #$02
        JMP     NEWST4
HSERV2:         
        BEQ     HSERV1
        LDA     #$FF            ; RED ALERT 
        STA     REDFLG
        LDX     #CH4TB2-CH4TAB
        JSR     NOTINT
        LDY     #SENRED-SENTAB
        JSR     LDMESS
HSERV1:         
        RTS     
;
;
;
;
HABORT:         
;       HYPERWARP ABORT ROUTINE
        LDX     #$01
        JSR     PANDS6
        LDY     #SENHWA-SENTAB  ; ABORT 
HABOR2:                         ; ENTRY POINT HWARP COMPLET:
        LDA     #$00
        STA     WARP
        STA     HFLAG
HABOR1:                         ; ENTRY POINT BEGIN JUMP  *:
        LDA     #STLAST
        STA     NSTARS
        LDA     #$00
        STA     HISPED
        STA     ETIMER          ; KEEP PROGRAM FROM GOING S:
        STA     HITME           ; CLEAR THE OTHER EXPLOS BU:
                                

        STA     GINDEX+3
        STA     WPENER
        CPY     #SENHWA-SENTAB
        BEQ     HABOR3
        STA     STFLAG+0
        STA     STFLAG+1
HABOR3:         
        STA     STFLAG+2
        STA     STFLAG+3
        STA     STFLAG+4
        STA     BSEQTM
        STA     DCSTOR
        JMP     LDMESS
;
;
;
;
HLINES:         
;               DRW HWARP LINES
        DEC     HTIMER
        BPL     HLINE1
        LDA     #$01
        STA     HISPED
        LDA     #RMLAST         ; HWARP STARS ON 
        STA     NSTARS
        LDA     #$03
        STA     HTIMER
; RESET LINES
        LDX     HPNTR
HLINE2:         
        LDA     #$12            ; XINIT
        STA     PNTR+1
        LDA     RANDOM          ; INIT Y,Z
        AND     #$03
        TAY     
        LDA     YINIT,Y
        STA     YPOSH,X
        LDA     ZINIT,Y
        STA     ZPOSH,X
        JSR     NEWST4          ; WHICH QUADRANT 
        TXA     
        TAY                     ; X GOES TO Y 
        LDA     #$05
        STA     TEMP4           ; 8 STARS 
HLINE4:         
;
        CLC     
        LDA     PNTR
        ADC     #$50            ; XINCRE 
        STA     PNTR
        STA     XPOSL,X
        LDA     PNTR+1
        ADC     #$00
        STA     PNTR+1
        STA     XPOSH,X
        LDA     #$00
        STA     XINCRE,X
                                

        STA     YINCRE,X
        STA     ZINCRE,X
;
        LDA     #$01
        STA     XSIGN,X         ; AND THAT FIXES THAT 
        LDA     #99             ; OFF-SCREEN 
        STA     VPOS,X
        STA     HPOS,X
        JSR     EXHLP1          ; DEFINE Y,Z 
        DEX     
        CPX     #STLAST+1
        BCS     HLINE3
        LDX     #RMLAST
HLINE3:         
        DEC     TEMP4
        BPL     HLINE4
        STX     HPNTR
HLINE1:         

        RTS     
        ;
;
;
;

DIVIDE:         
;       A = (TOP/BOTTOM)X80
;
        LDA     #$00            ;CLEAR THE RESULT 
        STA     TEMP3
        LDA     #$07            ; NUMBER OF SHIFTS 
        STA     TEMP4
; SHIFT 0 INTO THE MSBIT
        LSR     TEMP1           ; TOP NUMBER
        ROR     TEMP
        LDA     DISFLG          ; FRONT OR BACK  ? 
        BNE     DIVID1          ; BACK 
        LDA     XPOSH,X         ; BOTTOM NUMBER 
        LSR     A
        STA     PNTR+1
        LDA     XPOSL,X
        ROR     A
        STA     PNTR
        JMP     DIVID2
DIVID1:         
        SEC     
        LDA     #$00
        SBC     XPOSL,X
        STA     PNTR
        LDA     #$00
        SBC     XPOSH,X
        LSR     A
        STA     PNTR+1
        ROR     PNTR
;
DIVID2:         
        ASL     TEMP3           ; SHIFT RESULT 
                                

        SEC                     ; SUBTRACT BOTTOM FROM TOP 
        LDA     TEMP
        SBC     PNTR
        TAY     
        LDA     TEMP1
        SBC     PNTR+1
        BCC     DIVID3          ; BOTTOM GREATER THAN TOP 
;               TOP LARGER
        STA     TEMP1           ; STORE REMAINDER 
        STY     TEMP
        INC     TEMP3           ; ADD 1 TO RESULT 
DIVID3:         
        ASL     TEMP            ; SHIFT TOP
        ROL     TEMP1
        BCC     DIVID4
;               IF TOP IS GREATER THN BOTTOM THEN OVERFLOW
        LDA     #$FF            ; MAX VALUE TO RESULT 
        RTS     
DIVID4:         
        DEC     TEMP4           ; NEXT BIT 
        BPL     DIVID2
        LDY     TEMP3           ; RESULT IN Y 
        LDA     PTAB,Y          ; MULTIPLY BY 80  (PTAB) 
DIVID5:                         ; ENTRY POINT FROM THINK  *:
        RTS     
;
;
;
;
THINK:          
;               COMPUTER ATTACK SUBROUTINE
        LDA     HFLAG
        ORA     BASFLG
        BNE     DIVID5          ; BRANCH TO RTS 
;               CRUISER PHOTON CONVERGENCE
        LDA     LOKLOC
        BEQ     THIN38
        LDX     LOKTAR
        SEC     
        LDA     VPOS,X
        SBC     VPOS+3
        BCC     THIN37
        LDA     #$00
THIN37:         
        JSR     POHELP
        STA     ZINCRE+3
        STA     ZINCRE+4
        SEC     
        LDA     HPOS+3
        SBC     HPOS,X
        JSR     POHELP
        STA     YINCRE+3
        SEC     
        LDA     HPOS+4
        SBC     HPOS,X
        JSR     POHELP
        STA     YINCRE+4
                                

;
THIN38:         
;
;               HELPER FOR THINK
        LDX     #$03
THIN39:         
        DEC     ROTTIM,X
        BPL     THIN44
        TXA     
        LSR     A
        TAY     
        LDA     HORJOY,Y
        LDY     DISFLG
        BEQ     THIN40
        EOR     #$FF
        CLC     
        ADC     #$01
THIN40:         
        CLC     
        ADC     XINPRS+2,X
        BPL     THIN41
        LDA     #$00
THIN41:         
        CMP     #$10
        BCC     THIN42
        LDA     #$0F
THIN42:         
        STA     XINPRS+2,X
        CMP     #$08
        BCC     THIN43
        EOR     #$0F
THIN43:         
        ASL     A
        STA     ROTTIM,X
THIN44:         
        DEX     
        BPL     THIN39
;
        LDA     GINDEX+2
        BNE     THINK2          ; NOT A PHOTON
; PHOTON CONVERGENCE
        LDY     MISDIF          ; DIFFICULTY
        LDA     PHODIF,Y
        LDX     ZPOSH+2
        BPL     THINK3
        AND     #$7F
THINK3:         
        STA     ZINCRE+2
        ORA     #$80
        LDX     YPOSH+2
        BPL     THINK4
        AND     #$7F
THINK4:         
        STA     YINCRE+2
THINK2:         
        LDA     BINTIM
        AND     #$03
                                

        BEQ     THINK5
THINK1:         
        LDA     GRAPH+2
        BEQ     THIN20          ; NOT ON
        LDA     STFLAG+2
        BNE     THIN14
THIN20:         
; METORITE
        LDA     RANDOM
        CMP     #$04
        BCS     THIN14
        LDA     #$60
        STA     GINDEX+2
        LDX     #$02
        JSR     NEWSTR          ; DEFINE LIKE A STAR 
        LDA     #60
        STA     STFLAG+2
        LDA     #$88
        STA     XINCRE+2
        LDA     #$00
        STA     HPOS+2          ; METEROR FLASH 
        STA     YINCRE+2
        STA     ZINCRE+2
THIN14:         
        RTS     
THINK5:         
        LDA     ZYTOGG
        EOR     #$01
        STA     ZYTOGG
        TAX                     ; WHICH ZYLON TO THINK 
        LDA     STFLAG,X        ; ALREADY ON? 
        BNE     THINK6          ; YES 
; INIT ZYLON
        LDA     STFLAG+0
        ORA     STFLAG+1
        AND     #$01
        LDY     QUADRT
        CMP     CHTRAM,Y
        BCS     THINK1
; OK TO INIT
        LDA     #$FF
        STA     STFLAG,X
        LDA     RANDOM
        AND     #$07
        TAY     
        LDA     ZYGIND,Y
        STA     GINDEX+0,X
        LDA     MISDIF
        BEQ     THIN45
        LDA     INTSEQ,Y
THIN45:         
        STA     SEQEN,X
        LDA     #$01
        STA     SEQTIM,X
        STA     XSIGN,X
        LDA     RANDOM
        AND     JMPMSK
                                

        STA     ZPOSH,X
        ADC     #$13
        STA     YPOSH,X
        ORA     #$71
        STA     XPOSH,X
        JSR     NEWST4          ; Y,Z RANDOM SIGN 
THINK6:         
;
;               SEQUENCER AND TIMEOUT SECTION
;
        LDA     XPOSH,X
        CMP     #$20
        BCS     THIN27
        LDA     XSIGN,X
        BEQ     THIN26
        LDA     GRAPH,X
        BEQ     THIN27
        CMP     #ZYGRF6-ZYGRAF
        BEQ     THIN27
THIN26:         
        LDA     #$00
        STA     SEQEN,X
THIN27:         
        DEC     SEQTIM,X        ; TIMEOUT 
        BPL     THIN30
        LDA     #120
        STA     SEQTIM,X
        LDA     MISDIF
        LDY     RANDOM
        CPY     #$30
        BCC     THIN35
        LSR     A
THIN35:         
        LSR     A
        STA     BSTRAF,X
        LDA     SEQEN,X
THIN28:         
        BIT     RANDOM
        BPL     THIN31
        EOR     #$0F
THIN31:         
        STA     XINDES,X
        INX     
        INX     
        CPX     #$06
        BCC     THIN28
        LDX     ZYTOGG          ; RESTORE X 
THIN30:         
;
;               ZYLON STRAFING SECTION
;
        LDA     SEQEN,X
        BNE     THIN24
        LDY     ZYTOGG
THIN11:         
        CPY     #RAMNUM
        BCS     THIN12
                                

        LDA     BSTRAF,Y
        LSR     A
        LDA     XPOSH,Y
        BCS     THIN36
        CMP     #$0A
        BCC     THIN22
        BCS     THIN12          ; JUMP 
THIN36:         
        CMP     #$F5
        BCS     THIN33
THIN12:         
        LDA     XSIGN,Y
        LSR     A
THIN33:         
        LDA     #$0F
        BCS     THIN23
THIN22:         
        LDA     #$00
THIN23:         
        STA     XINDES,X
        CLC     
        TYA     
        ADC     #RAMNUM
        TAY     
        INX     
        INX     
        CPX     #$06
        BCC     THIN11
        LDX     ZYTOGG          ; RESTORE X 
THIN24:         
;
;               ACCELERATION SECTION
;
        LDY     ZYTOGG
THINK8:         
        LDA     XINPRS,X
        CMP     XINDES,X
        BEQ     THIN10
        BCS     THINK9
        INC     XINPRS,X
        BCC     THIN10          ; JUMP 
THINK9:         
        DEC     XINPRS,X
THIN10:         
        STX     TEMP            ; SAVE X
        TAX     
        LDA     ZYWARP,X
        LDX     TEMP            ; RESTORE X 
        STA     XINCRE,Y
        TYA     
        CLC     
        ADC     #RAMNUM
        TAY     
        INX     
        INX     
        CPX     #$06
        BCC     THINK8
                                

        LDX     ZYTOGG          ; RESTORE X 
;
;
;               FIRE PHOTON
        LDA     GINDEX+2
        BNE     THIN16
        LDA     STFLAG+2
        BNE     THIN13
        LDA     PHEXWT
        BEQ     THIN16
        DEC     PHEXWT
THIN13:         
        RTS     
THIN16:         
        CLC     
        LDA     ZPOSH,X
        ADC     #$02
        CMP     #$05
        BCS     THIN13
        LDY     #$D0
        LDA     XSIGN,X
        LSR     A
        LDA     XPOSH,X
        BCS     THIN15
        EOR     #$FF
        LDY     MISDIF
        BEQ     THIN13
        LDY     #$50
THIN15:         
        CMP     #$20
        BCS     THIN13
        STY     XINCRE+2
        LDA     #$00
        STA     GINDEX+2
        STA     HPOS+2          ; METEROR FLASH 
        LDA     #62
        STA     STFLAG+2
        LDX     #$02
        LDY     ZYTOGG
        STY     ATTARG
        JMP     EXHELP
;
;
;
EXPLOS:         
;               INIT EXPLOSION
;               Y CONTAINS INDEX OF ZYLON HIT
        LDA     #$80            ; 2 SECONDS
        STA     ETIMER
        LDX     #RMLAST
        STX     NSTARS          ; LAST STAR FOR EXPLOSION 
EXPLS1:         
        LDA     RANDOM
        AND     #$0F
        ADC     HPOS,Y
        SBC     #$30
        STA     HPOS,X
                                

        LDA     RANDOM
        AND     #$0F
        ADC     VPOS,Y
        LSR     A
        SBC     #$10
        STA     VPOS,X
        JSR     EXHELP
        LDA     RANDOM
        AND     #$87
        STA     XINCRE,X
        LDA     RANDOM
        AND     #$87
        STA     YINCRE,X
        LDA     RANDOM
        AND     #$87
        STA     ZINCRE,X
        DEX     
        CPX     #STLAST
        BNE     EXPLS1
        RTS     
;
;
EXHELP:         
; EXPLOSION HELPER
        LDA     XSIGN,Y
        STA     XSIGN,X
        LDA     XPOSH,Y
        STA     XPOSH,X
        LDA     XPOSL,Y
        STA     XPOSL,X
EXHLP1:                         ; ENTRY POINT FROM HLINES  :
        LDA     YSIGN,Y
        STA     YSIGN,X
        LDA     YPOSH,Y
        STA     YPOSH,X
        LDA     ZSIGN,Y
        STA     ZSIGN,X
;
        LDA     ZPOSH,Y
        STA     ZPOSH,X
        LDA     YPOSL,Y
        STA     YPOSL,X
        LDA     ZPOSL,Y
        STA     ZPOSL,X
EXHLP2:                         ; ENTRY POINT FROM BSERVE  :
        RTS     
;
;
;
;
BSERVE:         
; STARBASE SERVICE ROUTINE
        LDA     BASFLG
        BEQ     EXHLP2          ; BRANCH TO RTS
        LDA     DISFLG
        BNE     BSERV9
        LDA     #$14            ; PRIORITY FOR FRONT VIEW O:
                                

        STA     PRIOR
BSERV9:         
        LDA     #$02
        STA     DCSTOR
;
        LDA     #$30
        STA     GINDEX+2
        LDA     #$20
        STA     GINDEX+1
        LDA     #$40
        STA     GINDEX+0
        LDA     #$FF
;
        LDX     QUADRT
        LDY     CHTRAM,X
        BMI     BSER13
        LDA     #$00
BSER13:         
        STA     STFLAG+0
        STA     STFLAG+1
        STA     STFLAG+2
        STA     BASFLG
        BMI     BSERV1
        LDY     #$02
        JSR     EXPLOS
        LDX     #NOITB1-NOISTB
        JMP     NOISE
BSERV1:         
; TOO CLOSE ?
        LDA     XPOSH+2
        BNE     BSER14
        LDA     XPOSL+2
        CMP     #$20
        BCS     BSER14
        INC     XPOSL+2
BSER14:         
; ORBIT  ?
        LDA     HPOS+2
        SEC     
        SBC     #$78
        CMP     #$10
        BCS     BSERV8
        LDA     VPOS+2
        SEC     
        SBC     #$68
        CMP     #$10
        BCS     BSERV8
        LDA     XPOSH+2
        CMP     #$02
        BCS     BSERV8
        LDA     XSIGN+2
        AND     ZSIGN+2
        EOR     #$01
        ORA     SPEED
        ORA     ZPOSH+2
        ORA     WARP
        BEQ     BSERV3          ; IN ORIBT 
                                

BSERV8:         
        LDA     BSEQTM          ; ORBIT ABORTED 
        CMP     #$02
        BCC     BSER15
        LDY     #SENDKA-SENTAB
        JSR     LDMESS
BSER15:         
        LDA     #$00
        STA     BSEQTM
BSER11:         
        RTS     
;
BSERV3:         
        BIT     BSEQTM
        BVS     BSERV4
        BMI     BSERV5
        LDA     BSEQTM          ; LD MESS 
        BNE     BSER11          ; NO
        DEC     BSEQTM          ; =FF 
        LDY     #SENORB-SENTAB
        JMP     LDMESS
BSERV4:         
        LDX     #$00
        STX     REPMSG
        LDY     SENPTR
        BNE     BSER11          ; WAIT FO MESSAGE TO TIMEOU:
        LDA     #$50
        STA     GINDEX+4
        LDA     #$01
        STA     XSIGN+4
        STA     YSIGN+4
        STA     ZSIGN+4
        STA     ZPOSH+4
        STA     YINCRE+4
        LDA     #$10
        STA     XPOSH+4
        LDA     #$00
        STA     YPOSH+4
        LDA     #$87
        STA     XINCRE+4
        LDA     #$81
        STA     BSEQTM
        STA     ZINCRE+4
        STA     STFLAG+4
BSERV7:         
        RTS     
BSERV5:         
        LDA     XSIGN+4         ; SHIP DOCKED ? 
        BNE     BSERV7          ; NO 
        LDX     #CH4TB3-CH4TAB  ; SOUND 
        JSR     NOTINT
        LDY     #SENETC-SENTAB
        JSR     LDMESS
;               CLEAR   DAMAGE
        LDX     #$05
BSER12:         
        LDA     STINIT+73,X
                                

        STA     DAMAGE,X
        DEX     
        BPL     BSER12
;
;               NEW ENERGY
        LDA     #$89
        LDX     #$03
BSER20:         
        STA     DENERG+0,X
        DEX     
        BPL     BSER20
        LDA     #$07
        STA     XINCRE+4
        LDA     #$81
        STA     YINCRE+4
        LDA     #$01
        STA     ZINCRE+4
        STA     BSEQTM
        JMP     KEYSR7          ; RE-LOAD INSET 
;
;
;
;
LDISP:          
;       LOAD DISPLAY LISTS
;       A=#OF BYTES TO STORE, X=POSIT IN DISPLY, Y=PNTR IN :
        SEI                     ; WE DONT WANT NO INTERUPTS:
        STA     TEMP
LDISP3:         
        LDA     VCOUNT          ; CHECK IF ANTIC IS IN SAFE:
        CMP     #DISTOP
        BCC     LDISP3
LDISP2:         
        LDA     LISTAB,Y
        INY     
        BPL     LDISP1
        LDA     #$0D
LDISP1:         
        STA     DISPLY,X
        INX     
        DEC     TEMP
        BNE     LDISP2
        CLI                     ; IRQS BACK ON  !! 
        RTS     
;
;
;
;
;
;
;
;
CLRMAP:         
;               CLEAR MEMORY MAP SUBROUTINE
        LDA     #MEMMAP/256
CLRMP1:                         ; ENTRY POINT CLEAR ALL RAM:
        STA     PNTR+1
                                

        LDA     #$00
        TAY     
        STA     PNTR
        STA     LOKFLG          ; LOCK FLAG IS CLEARED
        STA     CNSTAR          ; RAM HAS BEEN CLEARED 
CLRMP2:         
        STA     (PNTR),Y
        INY     
        BNE     CLRMP2
        INC     PNTR+1
        LDY     PNTR+1
        CPY     #$20
        TAY                     ; RE-ZERO Y REG 
        BCC     CLRMP2
        RTS     
;
;
PHOTON:         
;               PHOTON TORPEDO FIRE
        LDA     PHOFLG          ; REPEAT FLAG 
        LDY     TRIG0           ; SHOOT ? 
        STY     PHOFLG
        BNE     PHOTN2          ; NO 
        STY     TIMOUT          ; RESET ATRACT TIMEOUT
        LDX     HFLAG           ; HWARP ? 
        BNE     PHOTN2          ; YES, NO FIRE 
        LDX     PHOTOG
        CMP     #$01
        BEQ     PHOTN8
        BCS     PHOTN4
PHOTN2:         
        RTS     
PHOTN8:         
;               ONE-SHOT
        LDA     STFLAG+3,X      ; ONE-SHOT TIMEOUT 
        CMP     #$E8            ; ALL DONE ? 
        BCS     PHOTN2          ; NO 
        LDY     DCSTOR
        STY     LOKTAR
        LDA     #12
        LDY     LOKFLG
        STY     LOKLOC
        BEQ     PHOTN3
        LDA     #$00
PHOTN3:         
        STA     LOKWAT
PHOTN4:         
        STY     PHOFLG
;
        BIT     DAMAGE+0
        BVS     PHOTN2
        BMI     PHOTN7
        TXA     
        EOR     #$01
        STA     PHOTOG
PHOTN7:         
        TXA     
                                

        STA     YSIGN+3,X       ; NEW YSIGN 
        LDA     PHOYPS,X        ; NEW YPOSH 
        STA     YPOSH+3,X
        LDA     #$FF
        STA     STFLAG+3,X      ; INIT PHOTON TIME 
        STA     ZPOSH+3,X
        LDA     #$00
        STA     GINDEX+3,X      ; INIT PHOTON GRAPHIC 
        STA     XPOSH+3,X
        STA     YPOSL+3,X
        STA     ZSIGN+3,X
        STA     ZPOSL+3,X
        LDA     #$01
        STA     XSIGN+3,X
        STA     XPOSL+3,X
        LDA     DISFLG
        LSR     A
        ROR     A
        ORA     #$66
        STA     XINCRE+3,X
        LDA     #$00
        STA     YINCRE+3,X
        STA     ZINCRE+3,X
        LDX     #$02
        JSR     PANDS6          ; PHOTON ENERGY 
        LDX     #$00
;
;               FALL THROUGH TO NOISE  ********************:
;
NOISE:          
;               NOISE INIT, X=NOISTB PNTR
        TXA                     ; PHOTONS 
        BNE     NOISE1          ; NO 
        ;       PHOTONS HAVE LOWER PRIORITY THAN EXPLOSIONS
        LDA     AUDTIM
        CMP     #$18
        BCS     NOISE2
NOISE1:         
        LDY     #$07
NOISE3:         
        LDA     NOISTB,X
        STA     PHOREP,Y
        INX     
        DEY     
        BPL     NOISE3
        LDA     NOISTB,X
        STA     AUDCTL
        LDA     NOISTB+1,X
        STA     AUDF3
NOISE2:         
        RTS     

;
;
POHELP:         
;               PHOTON HELPER
        LDY     #$80
                                

        BCS     POHLP1
        EOR     #$FF
        LDY     #$00
POHLP1:         
        STY     TEMP
        CMP     #$08
        BCC     POHLP2
        LDA     #$07
POHLP2:         
        TAY     
        LDA     TEMP
        ORA     PHVECT,Y
        RTS     
;
;
;
DAMCTL:         
;               DAMAGE CONTROL ROUTINE
        BIT     ATRACT
        BMI     DAMCT1          ; GAME OVER NO DAMAGE 
        LDX     MISDIF
DAMCT2:         
        LDA     RANDOM
        CMP     DPRBTB,X
        BCS     DAMCT1
        AND     #$07
        CMP     #$06
        BCS     DAMCT1
        TAX     
        LDA     DAMAGE,X
        ASL     A
        BMI     DAMCT2
        LDA     STFLAG+2
        CMP     #30
        LDA     #$80
        LDY     DAMGTB,X
        BCC     DAMCT3
        CPX     #$03
        BNE     DAMCT5
        BIT     DAMAGE+4
        BVS     DAMCT3
DAMCT5:         
        CPX     #$04
        BNE     DAMCT6
        BIT     DAMAGE+3
        BVS     DAMCT3
DAMCT6:         
        LDA     #$C0
        LDY     DESTTB,X
DAMCT3:         
        ORA     DAMAGE,X
        STA     DAMAGE,X
        STY     REPMSG
        BIT     DAMAGE+3
        BVC     DAMCT4
        LDA     #$00
        STA     ATENER
                                

        JSR     CLRMAP
DAMCT4:         
        LDY     #SENDMC-SENTAB
        JSR     LDMESS
        LDX     #CH4TB4-CH4TAB  ; DAMAGE 
        JSR     NOTINT
DAMCT1:         
        RTS     
;
;
HITZYL:         
;               PHOTON HIT ZYLON CHECK
        LDX     #$02            ; 2 PLAY PHOTONS
HITZY2:         
        DEX     
        BPL     HITZY1
        RTS     
HITZY1: LDA     GINDEX+3,X      ; PHOTON ? 
        BNE     HITZY2          ; NO 
        LDA     STFLAG+3,X      ; PHOTON ON ? 
        BEQ     HITZY2          ; NO 
        LDA     PHITS+0,X       ; ANY HIT ? 
        AND     #$07            ; LOOK AT 0,1 ONLY 
        BEQ     HITZY2          ; NO HIT 
        LSR     A               ; 0 OR 1 ONLY 
        CMP     #$03
        BNE     HITZY9
        LSR     A
HITZY9:         
        TAY                     ; OBJECT INDEX IN Y 
        LDA     STFLAG,Y        ; SHIP ON ? 
        BEQ     HITZY2          ; NO 
        LDA     DISFLG
        BEQ     HITZY8
        LDA     #$FF
HITZY8:         
        STA     TEMP2
        EOR     XPOSH,Y
        CMP     #$10
        BCC     HITZY3
        LDA     #$0F
HITZY3:         
        LSR     A
        STY     TEMP1
        TAY     
        LDA     TEMP2
        EOR     XPOSH+3,X
        CMP     PHPOST,Y        ; TOP BOUND 
        BCS     HITZY2
        CMP     PHPOSB,Y        ; BOTTOM BOUND 
        BCC     HITZY2
        LDY     TEMP1
;               A HIT  !!!
        SEC     
        LDA     #$FF
        SBC     STFLAG+3,X
        STA     EXPDEL          ; AUDIO 
                                

        CMP     #15
        BCC     HITZ11
        LDA     GINDEX,Y
        CMP     #$80
HITZ11:         
        LDA     #$00
        STA     LOKWAT
        STA     STFLAG+3,X      ; PHOTON OFF 
        BCS     HITZ10
        STA     STFLAG,Y        ; ZYOLON OFF 
        LDA     GINDEX,Y
        BEQ     HITZ10          ; PHOTON 
        CMP     #$60            ; METORER 
        BEQ     HITZ10          ; YES 
        LDA     #$00
        STA     LOKLOC          ; TURN OFF PHOTONS TRACKING
        LDX     QUADRT          ; WHICH QUAD KILL IN
        DEC     CHTRAM,X        ; REMOVE FROM CHART
        BPL     HITZY4
        LDA     #$00            ; JUST BLASTED A STARBASE E:
; TO GET HERE
        STA     CHTRAM,X
        SEC     
        LDA     RATING
        SBC     #3
        STA     RATING
        LDA     RATING+1
        SBC     #$00
        STA     RATING+1
        RTS     
HITZY4:         
;
;               INCKIL
;               INCRE KILL COUNT DISPLAY
        CLC     
        LDA     RATING
        ADC     #$06
        STA     RATING
        LDA     RATING+1
        ADC     #$00
        STA     RATING+1
        LDX     #$01
INCKL1:         
        INC     DKILL,X         ; KILL BYTE INCRE 
        LDA     DKILL,X
        CMP     #$4A            ; BCD OBERFFLOW 
        BCC     INCKL2          ; NO. 
        LDA     #$40            ; BCD 0 
        STA     DKILL,X
        DEX     
        BPL     INCKL1          ; NEXT BYTE 
INCKL2:         
;
HITZ10:         
        JSR     EXPLOS
        LDX     #127
HITZY5:         
                                

        LDA     CHTRAM,X
        BMI     HITZY6
        BNE     HITZY7
HITZY6:         
        DEX     
        BPL     HITZY5
;               WIN
        LDY     #SENWIN-SENTAB
        LDX     #$00
        JSR     CRATE1
HITZY7:         
        RTS     
;
;
;
;
;
KEYSRV:         
;               KEYBOARD SERVICE ROUTINE
        LDA     THEKEY          ; ANY KEY 
        BEQ     KEYSR3          ; NO 
        LDX     #$14            ; LAST KEY 
        STA     TEMP
        LDA     #$00
        STA     TIMOUT          ; RESET ATRACT TIMEOUT 
        STA     THEKEY          ; TURN OFF KEY 
        LDA     #$11
        STA     PRIOR           ; RESET PRIORITY , FROM STA:
KEYSR1:         
        LDA     CODCON,X        ; KEY CODES 
        CMP     TEMP
        BEQ     KEYSR2
        DEX     
        BPL     KEYSR1          ; NEXT KEY 
;                       NO KEY
        LDY     #SENWHT-SENTAB  ; WHAT 
        JMP     LDMESS
KEYSR2:                         ; KEY FOUND
        CPX     #$0A            ; IMPULSE ENGINE ? 
        BCS     KEYSR4          ; NO 
        LDA     HFLAG           ; HWARP ? 
        BEQ     KEYS20          ; NO 
        JMP     HABORT
KEYS20:         
        BIT     DAMAGE+1        ; ENGINES 
        BVC     KEYS23
        CPX     #$06
        BCC     KEYS23
        LDX     #$05
KEYS23:         
        LDA     WENTAB,X
        STA     WPENER          ; IMPULSE ENGINE ENERGY 
        LDA     WARPTB,X        ; SPEED 
        STA     WARP            ; SPEED DESIRED 
KEYSR3:         
        RTS     
KEYSR4:         
                                

        CPX     #$0E            ; DISPLAY TYPE KEY ?
        BCS     KEYSR5          ; NO
;
KEYS15:                         ; ENTRY POINT TO INIT DISPL:
; X MUST BE DEFINED TO THE KEY CODE IN CODCON
        LDA     DISTYP-10,X
        STA     DISFLG
        LDY     DISDIS-10,X
        LDX     #DISPL1-DISPLY
        LDA     #$08
        JSR     LDISP
;
        LDX     #STLAST
KEYSR6:         
        JSR     NEWSTR
        DEX     
        CPX     #OBJNUM
        BCS     KEYSR6
        BCC     KEYSR7          ; JUMP 
KEYSR5:         
        CPX     #$11            ; TOGGLE TYPE ? 
        BCS     KEYSR8          ; NO 
        LDY     TOFFMG-$0E,X
        LDA     TRKFLG-$0E,X
        EOR     TOGTAB-$0E,X
        STA     TRKFLG-$0E,X
        BEQ     KEYSR9
        LDY     TONMSG-$0E,X
KEYSR9:         
        JSR     LDMESS
        LDX     #CH4TB3-CH4TAB  ; KEYS 
        JSR     NOTINT
KEYSR7:                         ; ENTRY POINT FOR RE-LOADIN:
        LDX     #$16
        LDY     TRKFLG
        BEQ     KEYS18
        INX     
KEYS18:         
        STX     DCSTOR-2
        JSR     CLRMAP
        LDA     ATENER
        BEQ     KEYSR3
        LDX     DISFLG
        BEQ     KEYS10
        CPX     #$01
        BNE     KEYSR3
        LDX     #INSTB1-INSTAB
KEYS10:         
        JMP     LDINST
KEYSR8:         
        CPX     #$11            ; HYPERWARP ? 
        BNE     KEYS13
        LDA     HFLAG           ; HWARP ALREADY ON ? 
        BNE     KEYS14
        LDA     #$7F
        STA     HFLAG
        LDA     #$FF
                                

        STA     WARP
        LDA     #30
        STA     WPENER
        LDA     #RMLAST
        STA     HPNTR
;               H STEERING STUFF
        LDA     #$00
        STA     HTIMER
        STA     YPOSH+3
        STA     YPOSL+3
        STA     ZPOSL+3
        STA     XINCRE+3
        LDA     #$01
        STA     XSIGN+3

        STA     YSIGN+3
        STA     ZSIGN+3
        STA     ZPOSH+3
        LDA     HYHPOS
        STA     HSTEER
        LDA     HYVPOS

        STA     VSTEER
        LDA     MISDIF
        BEQ     KEYS24
        LDA     HYPENG
        ROL     A
        ROL     A
        ROL     A
        AND     #$03
        TAY     
        LDA     STERTB,Y        ; DIFFICULTY 
KEYS24:         
        STA     STERMK
;               END STUFF
        LDY     #SENHYP-SENTAB  ; MESSAGE HYPER WARP ENGAGE:
        JMP     LDMESS
KEYS13:         
        CPX     #$13
        BCS     KEYS27          ; PAUSE 
        LDA     DCSTOR
        EOR     #$01
        AND     #$01
        STA     DCSTOR
KEYS14:         
        RTS     
KEYS27:         
        BNE     KEYS28
        LDA     PORTA           ; PAUSE UNTIL MOVE JOYSTICK:
        CMP     #$FF
        BEQ     KEYS27
        RTS     
KEYS28:         
;               MISSION ABORTED
        LDY     #SENABR-SENTAB
        LDX     #$04
;
                                

;               FALL THROUGH TO CRATE  ********************:
;
CRATE:          
; CALCULATE RATING, X=0 MISSION COMPLETE, 4=ABORTED, 8-DEST:
;       Y=MESSAGE TYPE
;       GAME OVER, CALCULATE RATING
        LDA     #$00
        STA     STFLAG+3        ; NO HWARP CURSOR
        STA     NPRIOR
        STA     SENPTR
        STA     REDFLG
        STA     AUDC4
        STA     WARP
        STA     SPABAK
        STA     SHENER
        STA     HFLAG
        STA     HISPED
CRATE1:                         ; ENTRY POINT FOR A GOOD MI:
        LDA     #$FF
        STA     ATRACT
        STY     REPMSG          ; REPEAT MESSAGE 
        TXA     
        ORA     MISDIF          ; MISSION DIFF GAME RESULT 
        TAX     
        LDA     DIFTAB,X
        CLC     
        ADC     RATING
        TAX     
        LDA     #$00
        STA     VERJOY
        STA     HORJOY
        ADC     RATING+1
        BMI     CRATE3
        LSR     A
        TXA     
        ROR     A
        LSR     A
        LSR     A
        LSR     A
        CMP     #$13
        BCC     CRATE2
        LDA     #$12
        LDX     #$0F
CRATE2:         
        STA     ENDRAT
        TAY     
        TXA     
        CPY     #$00
        BEQ     CRATE4
        CPY     #$0B
        BCC     CRATE5
        CPY     #$0F
        BCC     CRATE4
CRATE5:         
        LSR     A
        EOR     #$08
CRATE4:         
                                

        AND     #$0F
        STA     ENDCLS
CRATE3:         
        RTS     

;
;
;
CSERVE:         
;               SERVICE GALACTIC CHART
        LDA     HFLAG           ; HWARP ON ? 
        BNE     CSERV9          ; YES
        LDA     DISFLG          ; DOING GALACTIC CHART ? 
        BMI     CSERV1          ; NO 
CSERV9:         
        RTS     
CSERV1:         
        BIT     DAMAGE+5        ; COMMUNICATIONS 
        BMI     CSER10
        JSR     LDGALT          ; LD UP THE CHART 
CSER10:         
        LDA     TIMERX          ; SLOW DOWN CURSOR MOVE 
        AND     #$01
        BNE     CSERV8
        CLC                     ; UPDATE HORIZ CURSOR POS 
        LDA     HYHPOS
        ADC     HORJOY
        AND     #$7F
        STA     HYHPOS
        CLC     
        ADC     #HORCHT         ; OFFSET TO POSITION ON SCR:
        STA     HPOS+4          ; PLAYER FOUR IS CURSOR
        CLC                     ; UPDATE VERT CURSOR POSITI:
        LDA     HYVPOS
        ADC     VERJOY
        AND     #$7F
        STA     HYVPOS
        CLC                     ; OFF SET TO POSITION ON SC:
        ADC     #VERCHT
        STA     VPOS+4
;                               SHIP POS TO OBJ3
        LDA     GVPOS
        CLC     
        ADC     #VERCHT
        STA     VPOS+3
        LDA     GHPOS
        CLC     
        ADC     #HORCHT
        STA     HPOS+3
;               CLACULATE CURSORS QUADRANT
;
CSERV8:                         ; ENTRY POINT FOR CALCULATI:
        LDA     HYHPOS          ; HPOS
        LSR     A
        LSR     A
        LSR     A
        STA     TEMP            ;TEMP STORE H COMP
                                

        LDA     HYVPOS          ; VPOS
        AND     #$70            ; VCOMP
        ORA     TEMP            ; ADD HCOMP
        STA     HYPQAD          ; QUADRANT CALCULATED
; CALCULATE NUMBER OF ZYLONS IN TARGET
        TAX     
        LDA     CHTRAM,X        ; WHATS IN QUAD 
        BPL     CSERV2          ; STARBASE ? 
        LDA     #$00            ; YES 
CSERV2:         
        ORA     #$90            ; COLOR AND ASCII CODE 
        BIT     DAMAGE+5
        BVS     CSER11
        STA     DTARG           ; DISPLAY NUMBER OF ZYLONS 
CSER11:         
;               CALCULATE WARP ENERGY
        SEC     
        LDA     HYHPOS
        SBC     GHPOS
        BCS     CSERV3
        EOR     #$FF
        ADC     #$01
CSERV3:         
        STA     TEMP
;
        SEC     
        LDA     HYVPOS
        SBC     GVPOS
        BCS     CSERV4
        EOR     #$FF
        ADC     #$01
CSERV4:         
        LSR     A
        CLC     
        ADC     TEMP
        TAY     
        LSR     A
        LSR     A
        LSR     A
        TAX     
        TYA     
        AND     #$03
        CLC     
        ADC     ENGTAB,X
;
        STA     HYPENG
        TAY     
        LDA     #$10
        STA     DWENER+0
        STA     DWENER+1
        STA     DWENER+2
CSERV6:         
        LDX     #$02
CSERV5:         
        INC     DWENER,X
        LDA     DWENER,X
        CMP     #$1A
                                

        BCC     CSERV7
        LDA     #$10
        STA     DWENER,X
        DEX     
        BPL     CSERV5
CSERV7:         
        DEY     
        BNE     CSERV6
        RTS     
;
;
;
MSERVE:         
;               SERVICE MESSAGE
        LDA     SENPTR          ; MESSAGE ON ? 
        BEQ     LDMS14          ; NO 
        DEC     MESTIM          ; TIMED OUT ? 
        BEQ     LDMES1          ; YES 
LDMES2:         
        RTS     
LDMS14:         
        LDY     REPMSG          ; REPEAT THE MESSAGE ? 
        BEQ     LDMES2          ; NO 
LDMESS:                         ; ENTRY POINT TO INIT MESSA:
        STY     SENPTR
        LDY     #LISTB6-LISTAB
        LDX     #DISPL2-DISPLY
        LDA     #$07
        JSR     LDISP           ; REVISE DIPLAY LIST FOR ME:
LDMES1:         
        LDX     #19             ; CLEAR MESSAGE RAM 
        LDA     #$00
        STA     TEMP1           ; CLEAR DISPLAY POINTER 
LDMES3:         
        STA     MESAGE,X
        DEX     
        BPL     LDMES3
LDMES4:                         ; MESSAGE LOOP POINT
        LDX     SENPTR          ; NEW WORD PNTR 
        INC     SENPTR          ; ADVANCE TO NEXT WORD 
        BNE     LDMES5
;               MESSAGE DONE
        LDX     #DISPL2-DISPLY
        LDY     #$80
        LDA     #$07
        JMP     LDISP           ; RESTORE DISPLAY LIST 
LDMES5:         
        LDA     SENTAB,X        ; A =NEW WORD 
        CMP     #$FC            ; CLASS ? 
        BNE     LDMES6          ; NO 
        LDY     ENDCLS
        LDA     CLASTB,Y        ; VALUE 1-5, IN DMA ASCII 
        LDX     TEMP1           ; WHERE TO STORE 
        STA     MESAGE,X
        LDA     #60             ; END OF LINE 
        STA     MESTIM          ; WAIT 1 SECOND 
        RTS     
                                

LDMES6:         
        CMP     #$FD            ; RANK ? 
        BNE     LDMS12          ; NO 
        LDY     ENDRAT
        LDA     RANKTB,Y        ; RANK WORD 
LDMS12:         
        STA     TEMP2           ; STORE FOR BITS 7,6 
        AND     #$3F
        STA     TEMP            ; WORD LOC IN #WRDTAB 
        LDA     #<(WRDTAB-1)
        STA     PNTR
;-------------------------------------------------------
;-------------------------------------------------------
        LDA     #(WRDTAB-1)/256
        STA     PNTR+1          ; WHERE TO START SEARCH
LDMES7:         
        INC     PNTR            ; ADVANCE WORD POINTER
        BNE     LDMES8
        INC     PNTR+1
LDMES8:         
        LDY     #$00
        LDA     (PNTR),Y
        BPL     LDMES7          ; NOT START OF A WORD 
        DEC     TEMP            ; IS IT THE RIGHT WORD? 
        BNE     LDMES7          ; NO 
LDMES9:         
        AND     #$3F            ; REMOVE ANY FLAG BITS 
        EOR     #$A0            ; PLAYFIELD AND DMA ASCII 
        LDX     TEMP1           ; DISPLAY POINTER 
        INC     TEMP1           ; ADVANCE DIPLAY POINTER 
        STA     MESAGE,X
        INY                     ; NEXT LETTER 
        LDA     (PNTR),Y        ; A=LETTER 
        BPL     LDMES9
        INC     TEMP1           ; A SPACE 
;               END OF WORD FOUND
        LDA     #60             ; WAIT 1 SECOND 
        BIT     TEMP2           ; WHAT TO DO NEXT 
        BPL     LDMS11          ; NOT END OF LINE 
        BVC     LDMS10          ; END OF LINE ONLY 
        LDA     #$FE            ; WAIT 4 SECOND, END OF SEN:
LDMS11:         
        BVC     LDMES4          ; CONTINUE WITH LINE 
        LDY     #$FF            ; END OF SENTENCE 
        STY     SENPTR
LDMS10:         
        STA     MESTIM          ; STORE WAIT 
        RTS     
;
;
;
;
;
AUDIO:          
;               AUDIO SERVICE ROUTINE
;
;               CH4 NOTE SECTION
                                

        LDA     NPRIOR
        BEQ     AUDIO1
        DEC     NDURTM          ; TIMING OUT ? 
        BPL     AUDIO1          ; YES
        LDA     NOTVOL
        BEQ     AUDIO2          ; NEXT NOTE 
        LDA     SDURAT          ; SPACE BETWEEN NOTE 
        BMI     AUDIO2
        STA     NDURTM
        LDY     #$00
        BEQ     AUDIO3          ; JUMP 
AUDIO2:         
        LDA     NDURAT
        STA     NDURTM
        LDX     NOTSEQ
        INC     NOTSEQ
        LDA     NOTTAB,X
        STA     AUDF4
        LDY     #$A8
        CMP     #$FF
        BNE     AUDIO3
        LDA     REPPTR
        STA     NOTSEQ
        DEC     REPSEQ
        BPL     AUDIO2
        LDY     #$00
        STY     NPRIOR
AUDIO3:         
        STY     AUDC4
        STY     NOTVOL
AUDIO1:         
        LDA     EXPDEL          ; ZYLON HIT SERVICE 
        BEQ     AUD11
        DEC     EXPDEL
        BNE     AUD11
        LDX     #NOITB2-NOISTB
        JSR     NOISE
AUD11:          
        LDX     SPEED
        TXA     
        LSR     A
        LSR     A
        LSR     A
        LSR     A
        LSR     A
        CMP     AUDTIM
        BCC     AUD10
        LDA     #$00
        STA     AUDTIM
;                       ENGINES
        INX     
        TXA     
        EOR     #$FF
        STA     AUDF3
        TAX     
        ASL     A
        ASL     A
                                

        ASL     A
        ASL     A
        ASL     A
        STA     AUDF1
        TXA     
        LSR     A
        LSR     A
        LSR     A
        STA     AUDF2
        LSR     A
        EOR     #$8F
        STA     AUDC2
        AND     #$87
        STA     AUDC3
        LDA     #$70
        STA     AUDCTL
        RTS     
AUD10:          
        LDA     AUDEXP          ; EXPLOSION SERVICE 
        BEQ     AUDIO4
        DEC     AUDEXP
        BNE     AUDIO4
        LDA     #$8F
        STA     ATYPE2
AUDIO4:         
        LDX     PHOREP          ; PHOTON SEVICE 
        BEQ     AUDIO5
        DEC     PHOREP
        BNE     AUD12
        LDA     #$AF
        STA     ATYPE2
        LDA     #$02
        STA     AFREQ1
        STA     AFREQ2
AUD12:          
        LDA     PHOTB2-1,X
        STA     ATYPE3
        LDA     PHOTB4-1,X
        STA     AUDF3
        STA     STIMER
AUDIO5:         
        LDA     BIGEXP          ; FINAL EXPLOS SERVICE 
        BEQ     AUDIO6
        DEC     BIGEXP
        LDA     RANDOM
        STA     AUDF3
        AND     #$20
        EOR     ATYPE3
        STA     ATYPE3
AUDIO6:         
        CLC                     ; SWEEP DOWN CH1-2 
        LDA     AFREQ1
        ADC     AUDADD
        STA     AFREQ1
        STA     AUDF1
        LDA     AFREQ2
        ADC     #$00
                                

        STA     AFREQ2
        STA     AUDF2
; VOLUME CONTROL
        LDX     ATYPE2
        LDY     ATYPE3
        LDA     TIMERX
        LSR     A
        BCC     AUDIO7
        LDA     AUDTIM
        BEQ     AUDIO7
        DEC     AUDTIM
        CMP     #$11
        BCS     AUDIO7
        TXA     
        AND     #$0F
        BEQ     AUDIO8
        DEX     
        STX     ATYPE2
AUDIO8:         
        TYA     
        AND     #$0F
        BEQ     AUDIO7
        DEY     
        STY     ATYPE3
AUDIO7:         
        STX     AUDC2
        STY     AUDC3
        RTS     
;
;
;
NOTINT:         
; AUDIO  NOTE INIT, X=CH4TAB PNTR
        LDA     CH4TAB,X
        CMP     NPRIOR
        BCC     NOTIN2
        LDY     #$05
NOTIN1:         
        LDA     CH4TAB,X
        STA     NOTSEQ,Y
        INX     
        DEY     
        BPL     NOTIN1
NOTIN2:         
        RTS     
;
;
;
;
;
LDTABS:         
; INIT PTAB,BCDCON,VCONL,VCONH,DISCTL,CHTRAM
;
        LDX     #89
LDTB10:         
        LDA     #$0D
        STA     DISPLY+5,X
                                

        CPX     #$0A
        BCS     LDTAB8
;               LD PF COLORS
        LDA     CLITAB,X
        STA     COLRAM+4,X
LDTAB8:         
        DEX     
        BPL     LDTB10
        LDA     #$70
        STA     DISPLY+0
        STA     DISPLY+1
        LDA     #$41
        STA     DISPLY+103
        LDA     #<DISPLY
        STA     DISPLY+104
        LDA     #DISPLY/256
        STA     DISPLY+105
;
;
;
;
;
        LDX     #$00
        STX     PNTR
        STX     PNTR+1
        STX     TEMP
        STX     TEMP1
LDTAB1:         
        CLC     
        LDA     PNTR
        ADC     #SCPTAB
        STA     PNTR
        LDA     PNTR+1
        STA     PTAB,X
        ADC     #$00
        STA     PNTR+1
        CLC     
        LDA     TEMP
        ADC     #SCBCD
        STA     TEMP
        LDA     TEMP1
        STA     BCDCON,X
        SED     
        ADC     #$00
        CLD     
        STA     TEMP1
        INX     
        BNE     LDTAB1
;
        LDX     #$00
        STX     PNTR
        LDA     #MEMMAP/256
        STA     PNTR+1
LDTAB2:         
        CLC     
        LDA     PNTR
        STA     VCONL,X
                                

        ADC     #SCVCON
        STA     PNTR
        LDA     PNTR+1
        STA     VCONH,X
        ADC     #$00
        STA     PNTR+1
        LDA     STINIT,X
        STA     DISCTL,X
        INX     
        CPX     #100
        BCC     LDTAB2
        DEX                     ; X=99, DONT JUMP IMMEDIATE:
        STX     JMPTIM
;
        LDX     #$03
        STX     CHTRAM+72       ; NOTHING IN SHIPS INIT QUA:
LDTAB3:         
        LDA     CHRTAB,X
        STA     TEMP
        LDY     MISDIF
        INY     
        INY     
        STY     TEMP1
LDTAB4:         
        LDA     RANDOM
        AND     #$7F
        TAY     
        LDA     CHTRAM,Y
        BNE     LDTAB4
        LDA     TEMP
        ;               STARBASES NOT ON EDGES
        BPL     LDTAB7
        CPY     #$10
        BCC     LDTAB4
        CPY     #$70
        BCS     LDTAB4
        TYA     
        AND     #$0F
        BEQ     LDTAB4
        CMP     #$0F
        BEQ     LDTAB4
        LDA     CHTRAM-1,Y
        ORA     CHTRAM+1,Y
        ORA     CHTRAM+16,Y
        ORA     CHTRAM-16,Y
        BNE     LDTAB4
        LDA     TEMP
LDTAB7:         
        STA     CHTRAM,Y
        DEC     TEMP1
        BPL     LDTAB4
        DEX     
        BPL     LDTAB3
;               LOAD HORIZ WALL OF CHART
        LDX     #180            ; CLEAR ALL CHART FIRST 
LDTAB5:         
        LDA     #$0A
                                

        STA     CHTDIS-1,X
        DEX     
        BNE     LDTAB5
        LDX     #$0F            ; LD HORIZ LINE 
LDTAB6:         
        LDA     #$18
        STA     CHTDIS+2,X
        DEX     
        BPL     LDTAB6
;
        LDA     #$1A            ; FILL IN THE DOT ON THE CH:
        STA     CHTDIS+18
;
        LDA     #$00
        STA     CHTRAM+72
        LDA     #72
        STA     QUADRT
        LDA     #67
        STA     GHPOS
        STA     HYHPOS
        LDA     #$47
        STA     HYVPOS
        STA     GVPOS
        LDA     #$EA
        STA     BCDCON+255      ; INFIINITY SIGN 
;
;               FALL THROUGH TO LDGALT
;
LDGALT:         
;
;               LD UP THE GALACTIC CHART
;               TRANSER CHTRAM TO CHTDIS
;
        LDY     #$00            ; CHTDIS PNTR 
        STY     TEMP            ; CHTRAM PNTR 
LDGAL1:         
        LDX     TEMP
        LDA     CHTRAM,X        ; WHATS IN QUAD 
        BPL     LDGAL2          ; NO
        LDA     #$05            ; STARBASE DEFAULT 
LDGAL2:         
        TAX     
        LDA     CHTABL,X        ; CODE FOR CHTDIS 
        STA     CHTDIS+22,Y
        INY     
        INC     TEMP
        LDA     TEMP
        AND     #$0F            ; END OF LINE ? 
        BNE     LDGAL1          ; NO 
        LDA     #$19            ; VERT LINE 
        STA     CHTDIS+22,Y
        INY     
        INY     
        INY                     ; ADVANCE TO NEXT LINE 
        INY     
        CPY     #160            ; ALL DONE ? 
        BCC     LDGAL1          ; NO 
                                

        RTS     
;
;
;
;
TIMERS:         
;               SERVICE TIMERS, STARDATE AND ZYLON JUMP
;       UPDATE TIMEX, USED FOR STAR INTENSITY MULTIPLEX
;
        INC     BINTIM          ; UPDATE BINARY TIMER 
        LDX     #DIMBLU
        LDA     BINTIM
        BPL     TIME46
        LDY     DENERG+0
        CPY     #$80
        BNE     TIME46
        LDX     #RED
TIME46:         
        AND     #$03
        STA     TIMERX
        BNE     TIME33
;       SHIELDS SECTION
        LDY     SHENER
        BEQ     TIME31
        LDY     #DBLUE
        BIT     DAMAGE+2
        BPL     TIME47
        BVS     TIME32
        LDA     RANDOM
        CMP     #200
        BCC     TIME31
TIME32:         
        LDY     #$00
TIME47:         
        TYA     
        BNE     TIME31
        LDX     #YELLOW
TIME31:         
        STY     SPABAK
        STX     COLRAM+13
TIME33:         
;               END UPDATE TIMERX
;
;               PHOTON TIMEOUT
        LDX     #$02
TIMER6:         
        LDA     GINDEX+2,X      ; PHOTON ? 
        BNE     TIMER7
        LDA     STFLAG+2,X      ; PHOTON TIMEOUT ? 
        BEQ     TIMER7          ; YES 
        DEC     STFLAG+2,X      ; DEC PHOTON TIMER 
TIMER7:         
        DEX     
        BPL     TIMER6
;
;               EXPLOSION TIMEOUT
;
                                

        LDA     ETIMER
        BEQ     TIME10
        DEC     ETIMER
        BNE     TIMER9
        LDX     #STLAST+1       ; 1 FOR FALL THROUGH
        STX     NSTARS
TIMER9:         
        CMP     #$70
        BCS     TIME30
        LDX     #$00
        STX     HITME
TIME30:         
        CMP     #$18
        BCS     TIME10
        DEC     NSTARS
TIME10:         
        DEC     SECOND
        BPL     TIMER1
        LDA     #$28
        STA     SECOND
        LDX     #$04
TIMER2:         
        INC     DSDATE,X
        LDA     DSDATE,X
        CMP     #$DA
        BCC     TIMER3
        LDA     #$D0
        STA     DSDATE,X
        CPX     #$03
        BNE     TIMER4
        DEX     
TIMER4:         
        DEX     
        BPL     TIMER2
TIMER3:         
        DEC     JMPTIM
        BMI     TIMER5
TIMER1:         
        RTS     
TIMER5:         
        LDA     #49
        STA     JMPTIM
;               RATING DUE TO TIME
        LDA     RATING
        BNE     TIME61
        DEC     RATING+1
TIME61:         
        DEC     RATING
        LDX     ATRACT          ; GAME OVER ?
        BNE     TIMER1          ; YES
;               ZYLONS JUMP
; CHECK ALL STARBASES TO SEE IF DESTROYED
; X=0 FROM ABOVE
        STX     TEMP
TIME12:         
        LDA     CHTRAM,X        ; STARBASE ? 
        BPL     TIME11          ; NO 
                                

        JSR     TIMHLP
        BEQ     TIME11
;                       STARBASE DESTROUED
        LDA     #$02            ; 4 ZYLONS 
        STA     CHTRAM,X
        STA     TEMP
        SEC     
        LDA     RATING
        SBC     #18
        STA     RATING
        LDA     RATING+1
        SBC     #$00
        STA     RATING+1
;
TIME11:         
        INX     
        BPL     TIME12
        LDA     TEMP            ; ANY STARBASES DESTROYED ?:
        BEQ     TIME13          ; NO 
        BIT     DAMAGE+5        ; COMMUNICATIONS 
        BVS     TIME13
        LDY     #SENDES-SENTAB
        JSR     LDMESS
        LDX     #CH4TB5-CH4TAB  ; MESSAGE 
        JSR     NOTINT
TIME13:         
        DEC     JMPOUT          ; JUMP TIMEOUT 
        BMI     TIME28
        LDX     KILBAS
        LDA     CHTRAM,X        ; NEED A NEW BASE ? 
        BMI     TIME14          ; NO 
TIME28:         
        LDA     #$07            ; JUMP TIMEOUT RESTORED 
        STA     JMPOUT
        LDY     #127
TIME15:         
        LDA     RANDOM
        AND     #$7F
        TAX     
        LDA     CHTRAM,X
        BMI     TIME14          ; NEW BASE 
        DEY     
        BPL     TIME15          ; TRY AGAIN 
        LDX     #127
TIME16:         
        LDA     CHTRAM,X
        BMI     TIME14
        DEX     
        BPL     TIME16
        RTS     
;
TIME14:         
        STX     KILBAS          ; STORE STXRBASE 
        TXA     
        AND     #$0F
        STA     KILOCH
        TXA     
                                

        LSR     A
        LSR     A
        LSR     A
        LSR     A
        STA     KILOCV
        LDX     #$FF
TIME18:                         ; MAIN LOOP 
        INX     
        BPL     TIME40
;               END ZYLON JUMP ROUTINE
        LDX     #$00
TIME20:         
        LDA     CHTRAM,X
        AND     #$DF
        STA     CHTRAM,X
        INX     
        BPL     TIME20
        BIT     DAMAGE+5
        BVS     TIME44
        LDX     #$00            ; ANY STARBASES SURROUNDED :
TIME21:         
        LDA     CHTRAM,X
        BPL     TIME19
        JSR     TIMHLP
        BEQ     TIME19
;               STAR    BASE SURROUNDED
        LDA     #99
        STA     JMPTIM          ; 99 CENTONS BEFORE DESTROY:
        LDY     #SENSUR-SENTAB
        JSR     LDMESS
        LDX     #CH4TB5-CH4TAB
        JMP     NOTINT
TIME19:         
        INX     
        BPL     TIME21
TIME44:         
        RTS     
TIME40:         
        LDY     CHTRAM,X
        CPY     #$0A            ; STARBASE , OR ALREADY CAL:
        BCS     TIME18
        LDA     RANDOM
        CMP     JMPWHN,Y
        BCS     TIME18
        CPX     QUADRT
        BEQ     TIME18
;               CALCULATE GRADIENT
        LDY     #$08
TIME27:         
        CLC     
        TXA     
        ADC     JMPTAB,Y
        STA     TEMP
        AND     #$0F
        SEC     
        SBC     KILOCH
        BCS     TIME26
                                

        EOR     #$FF
        ADC     #$01
TIME26:         
        STA     TEMP1
        LDA     TEMP
        LSR     A
        LSR     A
        LSR     A
        LSR     A
        SEC     
        SBC     KILOCV
        BCS     TIME22
        EOR     #$FF
        ADC     #$01
TIME22:         
        CLC     
        ADC     TEMP1
        STA     JMPPTS,Y
        DEY     
        BPL     TIME27
;               ZYLON CONVERGENCE
        LDA     #$01
        STA     TEMP1
TIME23:         
        LDY     #$07
TIME24:         
        LDA     JMPPTS,Y
        CMP     JMPPTS+8
        BCS     TIME42
        CLC     
        TXA     
        ADC     JMPTAB,Y
        BMI     TIME42
        STY     TEMP
        TAY     
        LDA     CHTRAM,Y
        BNE     TIME25
        LDA     CHTRAM,X
        CPY     QUADRT
        BEQ     TIME25
        ORA     #$20
        STA     CHTRAM,Y
        LDA     #$00
        STA     CHTRAM,X
        BEQ     TIME45
TIME25:         
        LDY     TEMP
TIME42:         
        DEY     
        BPL     TIME24
        INC     JMPPTS+8
        DEC     TEMP1
        BPL     TIME23
TIME45:         
        JMP     TIME18
;
;
                                

;
ROHELP:         
;               HELPER SUB FOR YROTAT, ZROTAT
        LDA     XSIGN,X
        EOR     #$01
        BEQ     ROHLP1
        LDA     #$FF
ROHLP1:         
        STA     TEMP1
        STA     TEMP2
        LDA     XPOSH,X
        STA     TEMP
        LDA     RANDOM
        ORA     #$BF
        EOR     XPOSL,X
        ASL     A
        ROL     TEMP
        ROL     TEMP1
        ASL     A
        ROL     TEMP
        ROL     TEMP1
;
        LDA     TEMP3           ; JOYSTICK
        EOR     #$FF            ; TOGGLES EVERY TIME THROUG:
        STA     TEMP3           ; THEN OK, THIS CAN BE TRIC:
;
        BMI     ROHLP2
        CLC     
        LDA     XPOSL,Y
        ADC     TEMP
        STA     XPOSL,Y
        LDA     XPOSH,Y
        ADC     TEMP1
        STA     XPOSH,Y
        LDA     XSIGN,Y
        ADC     TEMP2
        STA     XSIGN,Y
        RTS     
ROHLP2:         
        SEC     
        LDA     XPOSL,Y
        SBC     TEMP
        STA     XPOSL,Y
        LDA     XPOSH,Y
        SBC     TEMP1
        STA     XPOSH,Y
        LDA     XSIGN,Y
        SBC     TEMP2
        STA     XSIGN,Y
        RTS     
;
;
;
STHPOS:         
;               STORE HPOS, X=STR INDEX
        CMP     #HOFLOW
        BCS     STVPS1
                                

        STA     TEMP3
        LDA     #HSTCEN
        CPX     #OBJNUM
        BCS     STHPS2
        LDA     #HOBCEN
STHPS2:         
        LDY     YSIGN,X

        BNE     STHPS3
        SEC     
        INC     TEMP3
        SBC     TEMP3
        STA     HPOS,X
        RTS     
STHPS3:         
        CLC     
        ADC     TEMP3
        STA     HPOS,X

        RTS     
;
STVPOS:         
;               STORE VPOS, X=STAR INDEX
        CMP     #VOFLOW
        BCS     STVPS1
        STA     TEMP3
        LDA     #VSTCEN
        CPX     #OBJNUM
        BCS     STVPS2
        ASL     TEMP3
        LDA     #VOBCEN
STVPS2:         
        BIT     DISFLG          ; SECTOR SCAN ? 
        BVC     STVPS5          ; NO 
        BIT     DAMAGE+4
        BPL     STVPS7
        BIT     RANDOM
        BVC     STVPS6
        BVS     STVPS3
STVPS7:         
        LDY     XSIGN,X
        BNE     STVPS6
        BEQ     STVPS3          ; JUMP 
STVPS5:         
        LDY     ZSIGN,X
        BEQ     STVPS3
STVPS6:         
        SEC     
        INC     TEMP3
        SBC     TEMP3
        STA     VPOS,X
        RTS     
STVPS3:         
        CLC     
        ADC     TEMP3
        STA     VPOS,X
        RTS     
                                

STVPS1:                         ; ENTRY POINT FROM STHPOS  :
        CPX     #OBJNUM
        BCS     STVPS4
        LDA     #$FB
        STA     VPOS,X
STVPS8:                         ; ENTRY POINT FROM NEWSTR  :
        RTS     
STVPS4:         
;
;               FALL THROUGH TO NEWSTR  *******************:
;
NEWSTR:         
;               NEW STAR POSITION
        LDA     #99             ; RESET TO BOTTOM OF SCREEN:
        STA     VPOS,X
        STA     HPOS,X
        CPX     #STLAST+1       ; EXPLOSION STARS 
        BCS     STVPS8          ; YES 
        LDA     RANDOM          ; UPDATE Z 
        AND     #$0F
        STA     TEMP
        STA     ZPOSH,X
        LDA     RANDOM          ; UPDATE Y 
        AND     #$0F
        CMP     TEMP
        BCC     NEWST3
        STA     TEMP
NEWST3:         
        STA     YPOSH,X
;
        LDA     #$0F
        STA     XPOSH,X
        LDA     DISFLG          ; UPDATE X 
        EOR     #$01
        AND     #$01
        STA     XSIGN,X
        BNE     NEWST5
        STA     YPOSL,X
        STA     ZPOSL,X
        SEC     
        SBC     TEMP
        STA     XPOSH,X
;               TRY THIS FIX,  BELOW
        LDA     #$80
        STA     XPOSL,X
;
NEWST5:         
;
        BIT     DISFLG          ; SECTOR SCAN ? 
        BVC     NEWST2          ; NO 
        LDA     RANDOM
        STA     YPOSH,X
        LDA     RANDOM
        STA     XPOSH,X
        AND     #$01
        STA     XSIGN,X
NEWST2:         
                                

;
NEWST4:                         ; ENTRY POINT FROM HLINES S:
; DETERMINE SIGN Y,Z
        LDA     RANDOM
        AND     #$01
        STA     ZSIGN,X
        BNE     NEWST1
        SEC     
        SBC     ZPOSL,X
        STA     ZPOSL,X
        LDA     #$00
        SBC     ZPOSH,X
        STA     ZPOSH,X
NEWST1:         
        LDA     RANDOM
        AND     #$01
        STA     YSIGN,X
        BNE     NEWST6
        SEC     
        SBC     YPOSL,X
        STA     YPOSL,X
        LDA     #$00
        SBC     YPOSH,X
        STA     YPOSH,X
NEWST6:         
        RTS     
;
;
;
;
TIMHLP:         
;               HELPER ROUTINE FOR TIMERS
        LDA     CHTRAM-1,X
        BEQ     TIMHP1
        LDA     CHTRAM+1,X
        BEQ     TIMHP1
        LDA     CHTRAM-16,X
        BEQ     TIMHP1
        LDA     CHTRAM+16,X
TIMHP1:         
        RTS     
;
;
;
;
;
;
;
PANDIS:         
;               PANNEL DISPLAY ROUTINE
;               ONE ENTRY POINT AT PANDS6
;       UPDATE VELOCITY DISPLAY
        LDX     SPEED
        CPX     WARP
        BEQ     PANDS2
        BCC     PANDS3
        DEC     SPEED
                                

        BCS     PANDS1
PANDS3:         
        INC     SPEED
PANDS2:         
        LDA     HFLAG
        BNE     PANDS1
        BIT     DAMAGE+1
        BPL     PANDS1
        LDA     WARP
        AND     RANDOM
        STA     SPEED
;
;
PANDS1:                         ; ALL DONE VELOCITY DISPLAY:
        LDY     #DVELOC-DISCTL-1
        JSR     TWOCM3
        BIT     DAMAGE+3        ; COMPUTER DAMAGE 
        BMI     PANDS4
;               UPDATE COORDINATES DISPLAY
        LDA     #RAMNUM         ; DISPLAY Y COORD 
        LDY     #DTHETA-DISCTL  ; DISPLAY IN THETA 
        JSR     TWOCOM          ; UPDATE THETA 
        LDA     #RAMNUM*2       ; DISPLAY Z COORD 
        LDY     #DPHI-DISCTL    ; DISPLAY IN PHI 
        JSR     TWOCOM          ; UPDATE PHI 
        LDA     #$00            ; DISPLAY X COORD 
        LDY     #DRHO-DISCTL    ; DISPLAY IN RHO
        JSR     TWOCOM          ; UPDATE RHO 
;               LOW BYTE OF RHO
        LDA     DRHO+2          ; PUT BLANK IN LSB IF INFIN:
        STA     DRHO+3
        CMP     #$0A            ; INFINITE ? 
        BCS     PANDS4          ; YES 
        LDX     DCSTOR          ; WHICH OBJ TRACKING 
        LDA     XPOSL,X         ; LOW BYTE 
        LSR     A
        LSR     A
        LSR     A
        LSR     A
        TAX     
        LDA     BCDCON,X        ; CONVERT TO BCD 
        STA     DRHO+3          ; LSB UPDATED 
PANDS4:                         ; ALL DONE COORD DISP 
;                               UPDATE ENERGY DISPLAY
;               UPDATE ENERGY DUE TO SHIELDS WARPS ATTACK C:
        CLC     
        LDA     ENFLAG          ; LSRB OF ENERGY, DEC ENERG:
        ADC     SHENER          ; DRAIN FROM SHEILDS 
        ADC     WPENER          ; DRAIN FROM WARP 
        ADC     ATENER          ; DRAIN FROM ATTACK COMPUTE:
        ADC     #$01            ; LIFE SUPPORT 
        CMP     ENFLAG          ; SET CARRY FLAG 
        STA     ENFLAG
        BCS     PANDS5
;                       DECRE ENERGY
        LDX     #$03            ; DECRE BIT 3 OF ENERGY 
PANDS6:                         ; ENTRY POINT TO DECRE ENER:
                                

        BIT     ATRACT          ; GAME OVER ?
        BVS     PANDS5          ; YES
;       X MUST BE DEFINED = BIT TO DECRE FROM
        DEC     DENERG,X
        LDA     DENERG,X
        CMP     #$80            ; CHECK IF BORROW
        BCS     PANDS5          ; NO BORROW
        LDA     #$89
        STA     DENERG,X
        CPX     #$02
        BNE     PANDS7
        LDA     RATING
        BNE     PANDS8
        DEC     RATING+1
PANDS8:         
        DEC     RATING
PANDS7:         
        DEX     
        BPL     PANDS6          ; NEXT DIGIT 
;                       OUT OF ENERGY  !!
        LDX     #$0A            ; KEY F 
        TXA     
        LDY     #$03
PAND10:         
        STA     DENERG+0,Y
        DEY     
        BPL     PAND10
        JSR     KEYS15
        LDY     #SENOUT-SENTAB
        LDX     #$04
        JSR     CRATE
PANDS9:         
PANDS5:         
        RTS     
;
;

;
TWOCOM:         
;               TWOS OMPLEMENT AND CONVERT TO B CD HELPER R:
;       A=OFFSET(X,Y,Z), Y=WHERE TO STORE
        CLC     
        ADC     DCSTOR          ; WHICH OBJ TRACKING 
        TAX     
        LDA     #$10            ; + SIGN 
        STA     TEMP
        LDA     XSIGN,X         ; SIGN OF OBJ 
        LSR     A
        LDA     XPOSH,X
        BCS     TWOCM1
;               NEGATIVE VALUE, TWOS COMPLEMENT
        EOR     #$FF
        DEC     TEMP            ; - SIGN 
TWOCM1:         
        TAX     
        LDA     TEMP
        STA     DISCTL+0,Y      ; STORE SIGN 
                                

;
;               NO INFINITY FOR THETA OR PHI
        TYA     
        AND     #$10            ; THETA OR PHI ? 
        BEQ     TWOCM3          ; NO 
        CPX     #$FF            ; INFINITY ? 
        BNE     TWOCM3          ; NO 
        DEX                     ; X=FE, NOT FF 
;
;
TWOCM3:                         ; ENTRY POINT TO LOAD ONLY :
;
        LDA     BCDCON,X        ; BCD CONVERT
        TAX     
        AND     #$0F
        STA     DISCTL+2,Y      ; LOW BYTE STOED 
        TXA     
        LSR     A
        LSR     A
        LSR     A
        LSR     A
        STA     DISCTL+1,Y      ; HIGHT BYTE STORED 
        RTS     
;
;
;
;
;
;
;
                                

;               TABLES;
CLINDX:                         ; COLOR INDEX TABLE USED IN:
        .byte      0,1,2,3,7
;
;
PHGRAF:                         ; PHOTON GRAPHIC
        .byte      0
        .byte      $18,$3C,$7E,$7E,$76,$F7,$DF,$DF,$FF,$FF,$F7,$76,$7E,$7E,$3C,$18
PHGRF1:         
        .byte      $10,$38,$7C,$7C,$FE,$DE,$DA,$FA,$EE,$EE,$7C,$7C,$38,$10
PHGRF2:         
        .byte      $18,$3C,$3C,$7E,$6E,$7A,$7E,$76,$7E,$3C,$3C,$18
PHGRF3:         
        .byte      $10,$38,$38,$7C,$74,$7C,$6C,$38,$38,$10
PHGRF4:         
        .byte      $10,$18,$3C,$2C,$3C,$3C,$18,$08
PHGRF5:         
        .byte      $10,$38,$38,$28,$38,$10

;
                                

;
DKGRAF:                         ; DOCKING SHIP GRAPHIC
        .byte      $3C,$3C,$24,$3C,$7E,$7E,$7E,$5A,$FF,$FF,$42,$42,$42,$42,$42,$42
DKGRF1:         
        .byte      $1C,$1C,$14,$3E,$3E,$3E,$2A,$7F,$7F,$22,$22,$22,$22,$22
DKGRF2:         
        .byte      $18,$18,$3C,$3C,$3C,$3C,$7E,$24,$24,$24,$24
DKGRF3:         
        .byte      $10,$10,$38,$38,$38,$7C,$28,$28,$28
DKGRF4:         
        .byte      $18,$18,$3C,$18,$18
DKGRF5:         
        .byte      $10
GBASM6:         
        .byte      $10,$38,$10
;
                                

;
;
GBASEM:         
        .byte      $18,$7E,$FF,$FF,$FF,$FF,$FF,$E7,$E7,$FF,$FF,$FF,$FF,$FF,$7E,$7E
GBASM1:         
        .byte      0
        .byte      $18,$3C,$7E,$FF,$FF,$FF,$E7,$66,$FF,$FF,$FF,$FF,$7E,$7E
GBASM2:         
        .byte      0
        .byte      $18,$3C,$7E,$FF,$FF,$E7,$66,$FF,$FF,$FF,$FF,$3C
GBASM3:         
        .byte      $18,$3C,$FF,$FF,$E7,$66,$FF,$FF,$7E,$3C
GBASM4:         
        .byte      0
        .byte      $18,$3C,$FF,$FF,$FF,$3C,$18
GBASM5:         
        .byte      $18,$3C,$FF,$3C,$18
;
HWARTG:                         ; HWARP TARGET GRAPHIC 
        .byte      $28,$28,$28,$28,$EE,0,0,$EE,$28,$28,$28,$28
                                

;
;
;
ZYGRAF:                         ; GRAFIC OF ZYLON SHIP BASE:
        .byte      0               ; BLANK 
        .byte      $81,$81,$81,$81,$BD,$FF,$FF,$BD,$81,$81,$81,$81
ZYGRF1:         
        .byte      $82,$82,$BA,$FE,$FE,$BA,$82,$82
ZYGRF2:         
        .byte      $42,$5A,$7E,$7E,$5A,$42
ZYGRF3:         
        .byte      $44,$54,$7C,$7C,$54,$44
ZYGRF4:         
        .byte      $24,$3C,$3C,$24
ZYGRF5:         
        .byte      $28,$38,$38,$28
ZYGRF6:         
        .byte      $18,$18
ZYGRF7:         
        .byte      $10,$10
GBASER:         
        .byte      $E0,$F8,$F8,$FE,$57,$FE,$F8,$F8,$C0
GBASR3:         
        .byte      $C0,$F0
GBASR1:         
        .byte      $C0,$F0,$F0,$FC,$BE,$FC,$F0,$80,$80
GBASR2:         
        .byte      $C0,$C0,$F0,$BC,$F0,$C0
;
;
;
GBASEL:         
        .byte      7,$1F,$1F,$7F,$EA,$7F,$1F,$1F,$3
GBASL3:         
        .byte      3,$F
GBASL1:         
        .byte      3,$F,$F,$3F,$7D,$3F,$F,1,1
GBASL2:         
        .byte      3,3,$F,$3D,$F,3
;
;
                                

;
;
ROGRAF:         
        .byte      $18,$3C,$7E,$7E,$DB,$C3,$81,$81,$81
ROGRF1:         
        .byte      $10,$38,$7C,$7C,$D6,$C6,$82,$82
ROGRF2:         
        .byte      $18,$3C,$3C,$66,$66,$42,$42
ROGRF3:         
        .byte      $10,$38,$38,$6C,$44,$44
ROGRF4:         
        .byte      $18,$3C,$24,$24
;
                                

;
ROGRF5:         
        .byte      $10,$38,$28
;
;
KLGRAF:         
        .byte      $18,$3C,$7E,$FF,$18,$18,$FF,$7E,$3C,$18
KLGRF1:         
        .byte      $10,$38,$7C,$FE,$38,$38,$FE,$7C,$38,$10
KLGRF2:         
        .byte      $18,$3C,$7E,$18,$7E,$3C,$18
KLGRF3:         
        .byte      $10,$38,$7C,$10,$7C,$38,$10
KLGRF4:         
        .byte      $18,$3C,$18,$3C,$18
KLGRF5:         
        .byte      $10,$38,$38,$10
;
;
;
                                


;
LISTAB:                         ; DISPLAY LIST TABLE  LDISP:
;       SHIP ALIVE
        .byte      $8D,0,$46
        .word      DISCTL
        .byte      $20,6,0
LISTB2:         ; GAL CHT
        .byte      1
        .word      GLDISP
LISTB3:                         ; SECT SCAN
        .byte      0,0,$46
        .word      SESCAN
        .byte      $4D
        .word      MEMMAP+200
LISTB4:                         ; BACK VIEW
        .byte      0,0,$46
        .word      BACKUP
        .byte      $4D
        .word      MEMMAP+200
LISTB5:                         ; FRONT VIEW 
        .byte      $4D
        .word      MEMMAP
        .byte      $0D,$0D,$0D,$0D,$0D
LISTB6:                         ; MESSAGE ON 
        .byte      $30,$46
        .word      MESAGE
        .byte      $4D
        .word      MEMMAP+680
;
;
DISDIS:                         ; FOR KEYSRV  , DISPLAY LIS:
        .byte      LISTB5-LISTAB
        .byte      LISTB4-LISTAB
        .byte      LISTB3-LISTAB
        .byte      LISTB2-LISTAB
;
;
BRTABL:                         ; BRIGHTNESS SELECT TABLE 
        .byte      BRT,BRT,BRT,BRT
        .byte      MED,BRT,MED,BRT
        .byte      MED,MED,MED,BRT
        .byte      MED,MED,MED,MED
        .byte      MED,MED,MED,DIM
        .byte      DIM,MED,DIM,MED
        .byte      DIM,DIM,DIM,MED
        .byte      DIM,DIM,DIM,DIM
;
;
MASK:                           ; MASK FOR RAM MAP BYTE DUE:
        .byte      $C0,$30,$0C,$03
;
;
WARPTB:                         ; SELECT WARP ACCEL FROM KE:
        .byte      0,$01,$02,$04,$08,$10,$20,$40,$60,$70
;
;
                                

CODCON:                         ; USED IN KEYSRV SUBROUTINE:
        .byte      $F2,$DF,$DE,$DA,$D8,$DD,$DB,$F3,$F5,$F0
        .byte      $F8,$FF,$C0,$FD,$ED,$FE,$D2,$F9,$E5,$CA
        .byte      $E7
;
WENTAB:                         ; ENERGY USED PER WARP 
        .byte      0,4,6,8,10,12,14,30,45,60
;
;
;
;
;
;
                                

;
;
ENGTAB:                         ; ENERGY USED PER DISTANCE :
        .byte      10,13,16,20,23,50,70,80,90,120,125,130,135,140,155,170,184,200
        .byte      208,216,223,232,241,250
;
;
;
;
;
; proc:
JOYTAB:                         ; CODE FOR EACH POSITION ON:
        .byte      0,$1,$FF,0
;
;
;
INSTAB:                         ; INSET LINES TABLE    HDRA:
        .byte      $50,$28,$87,$50,$36,$87
        .byte      119,70,30,119,86,30,119,70,$91,148,70,$91
		
        .byte      120,78,6,126,75,15,126,81,15,141,78,7
		
        .byte      133,71,$84,126,76,$85,140,76,$85,133,82,$84
;
                                

;
INSTB1:                         ; HORIZ CROSS HAIRS
        .byte      $3E,$32,15,$54,$32,15
        .byte      $FE             ; ALL DONE
;
INSTB2:                         ; SECTOR SCAN SHIP
        .byte      $4E,$35,$82,$4F,$34,$82,$50,$32,$85,$51,$34,$82,$52,$35,$82
        .byte      $FE             ; ALL DONE
;
;
;
;
;
;
;
YINIT:                          ; HLINES 
        .byte      4,4,3,2
ZINIT:                          ; HLINES 
        .byte      2,3,4,4
;
;
;
;
;
;
;
;
                                

;
;
STINIT:                         ; STATUS INIT TABLE (LDTABS:
        .byte      18,11,0,0,10,$55,$4B,$40,$40,10,$8D,$8B,$89,$89,$89,$89
        .byte      10,$16,11,0
        .byte      10
        .byte      $14,$0B,$0F,0,0,10,$51,$4B,$0F,0,0,10,$93,$8B,$0F,0,0,0
        .byte      10
;        .byte      $37,$21,$32,$30,0,$25,$2E,$25,$32,$27,$39,$16,0,0,0
        .byte      $37,$21,$32,$30,0,$25,$2E,$25,$32,$27,$39,$1A,0,0,0	; this is in the Star Raiders ROM but not the listing
        .byte      $10,0,0,0,0
        .byte      $B4,$A1,$B2,$A7,$A5,$B4,$B3,$9A,0,0
        .byte      $24,$23,$1A,$30,$25,$33,$23,$2C,$32
        .byte      0
        .byte      $F3,$F4,$E1,$F2,0,$E4,$E1,$F4,$E5,$DA,$D0,$D0,$CE,$D0
        .byte      $D0,0,0,0,0,0
;
CHRTAB:                         ; TABLE FOR LDTABS ROUTINE 
        .byte      $CF,4,3,2
;
;
;
;
;
                                

;
SENTAB:                         ; TABLE OF SENTENSES 
        .byte      0               ; BUFFER 
SENACN:                         ; ATTACK COMPUTER ON 
        .byte      5,6,$42
SENACF:                         ; ATTACK COMPUTER OFF 
        .byte      5,6,$43
SENSON:                         ; SHIELDS ON 
        .byte      4,$42
SENSOF:                         ; SHIELDS OFF 
        .byte      4,$43
SENCTN:                         ; COMPUTER TRACKING ON 
        .byte      6,7,$42
SENCTF:                         ; COMPUTER TRACKING OFF 
        .byte      7,$43
SENWHT:                         ; WHAT? 
        .byte      $48
SENHYP:                         ; HYPERWARP ENGAGED 
        .byte      9,$4A
SENSUR:         
        .byte      11,$CD          ; STARBASE SURROUNDED 
SENDES:         
        .byte      11,$CC          ; STARBASE DESTROYED 
SENHWA:                         ; HYPERWARP ABORTE 
        .byte      9,$4E
SENHWC:                         ; HYPERWARP COMPLETE 
        .byte      9,$4F
SENHSP:                         ; HYPERSPACE 
        .byte      $D0
SENORB:                         ; ORBIT ESTABLISED 
        .byte      17,$92,$56
SENDKA:                         ; DOCKING ABORTED 
        .byte      19,$4E
SENETC:                         ; ENERGY TRANSFER COMPLETE 
        .byte      21,$4F
SENDST:                         ; YOU ARE DESTROYED 
        .byte      $B8,$97,$99,$98,$8C,$9D,30,$9F,$FD,37,$FC,$78
SENATA:                         ; TITLE 
        .byte      $9B,$60
;
                                

;
SENOUT:                         ; OUT OF ENERGY 
        .byte      $B8,$97,$98,26,$8E,28,$94,36,$9F,$FD,37,$FC,$A7,$68
SENWIN:                         ; YOU WIN 
        .byte      $B8,$97,$98,26,$8F,36,$9F,$FD,37,$FC,$66
SENNOV:                         ; NOVICE MISSION 
        .byte      44,$5A
SENPIL:                         ; PILOT MISSION
        .byte      46,$5A
SENWAR:                         ; WARRIOR MISSION
        .byte      49,$5A
;
                                

;
SENCOM:                         ; COMMANDER MISSION 
        .byte      51,$5A
SENDMC:                         ; DAMAGE CONTROL 
        .byte      $B8,52,$76
SENPDM:                         ; PHOTONS DAMAGED 
        .byte      55,$B5,$78
SENPDS:                         ; PHOTONS DESTROYED 
        .byte      55,$8C,$78
SENEDM:                         ; ENGINES DAMAGED 
        .byte      35,$B5,$78
SENEDS:                         ; ENGINES DESTROYED 
        .byte      35,$8C,$78
SENSDM:                         ; SHIELDS DAMAGED
        .byte      4,$B5,$78
SENSDS:                         ; SHIELDS DESTROYED 
        .byte      4,$8C,$78
SENCDM:                         ; COMPUTER DAMAGED 
        .byte      6,$B5,$78
SENCDS:                         ; COMPUER DESTROYED 
        .byte      6,$8C,$78
SENTDM:                         ; SECTOR SCAN DAMAGED 
        .byte      $A2,$75
SENTDS:                         ; SECTOR SCAN DESTROYED 
        .byte      $A2,$4C
SENMDM:                         ; COMMUNICATIONS DAMAGED 
        .byte      $A1,$75
SENMDS:                         ; COMMUNICATIONS DESTROYED 
        .byte      $A1,$4C
SENRED:                         ; RED ALERT 
        .byte      $C1
SENABR:                         ; MISSION ABORTED KEY 
        .byte      $B8,$97,$98,26,$8E,36,$9F,$FD,37,$FC,$66
;
                                

;
;
WRDTAB:                         ; TABLE OF WORDS
        .byte      $A0,"    RED ALERT"
        .byte      $CF,"N"
        .byte      $CF,"FF"
        .byte      $D3,"HIELDS"
        .byte      $C1,"TTACK"
        .byte      $C3,"OMPUTER"
        .byte      $D4,"RACKING"
        .byte      $D7,"HATS WRONG?"
        .byte      $C8,"YPERWARP"
        .byte      $C5,"NGAGED"
;
                                

;
        .byte      $D3,"TARBASE"
        .byte      $C4,"ESTROYED"
        .byte      $D3,"URROUNDED"
        .byte      $C1,"BORTED"
        .byte      $C3,"OMPLETE"
        .byte      $C8,"YPERSPACE"
        .byte      $CF,"RBIT"
        .byte      $C5,"STABLISHED"
        .byte      $C4,"OCKING"
        .byte      $C5,"NERGY"
        .byte      $D4,"RANSFER"
        .byte      $D3,"TANDBY"
        .byte      $D3,"TAR FLEET TO"
        .byte      $D3,"TAR CRUISER 7"
;
                                

;
        .byte      $C1,"LL UNITS"
        .byte      $CD,"ISSION"
        .byte      $A0,"   STAR RAIDERS"
        .byte      $DA,"ERO"
        .byte      $C2,"Y ZYLON FIRE"
        .byte      $D0,"OSTHUMOUS"
        .byte      $D2,"ANK IS:"
        .byte      $C3,"OPYRIGHT ATARI 1979"
        .byte      $D3,"UB-SPACE RADIO"
        .byte      $D3,"ECTOR SCAN"
        .byte      $C5,"NGINES"
        .byte      $CE,"EW"
        .byte      $C3,"LASS"
        .byte      $C3,"ONGRATULATIONS"
;
                                

;
        .byte      $D2,"EPORT TO BASE"
        .byte      $C6,"OR TRAINING"
        .byte      $C7,"ALACTIC COOK"
        .byte      $C7,"ARBAGE SCOW CAPTAIN"
        .byte      $D2,"OOKIE"
        .byte      $CE,"OVICE"
        .byte      $C5,"NSIGN"
        .byte      $D0,"ILOT"
        .byte      $C1,"CE"
        .byte      $CC,"IEUTENANT"
        .byte      $D7,"ARRIOR"
        .byte      $C3,"APTAIN"
;
                                

;
        .byte      $C3,"OMMANDER"
        .byte      $C4,"AMAGE"
        .byte      $C4,"AMAGED"
        .byte      $C3,"ONTROL"
        .byte      $D0,"HOTONS"
;
        .byte      $A0             ; BLANK
        .byte      $D3,"TAR COMMANDER"
        .byte      $80             ; END TABLE
;
;
;
                                

;
DISTYP:                         ; CODE TO LOAD IN DISFLG 
        .byte      0,1,$40,$80
TOFFMG:                         ; POINTER TO TOGLE OFF MESS:
        .byte      SENCTF-SENTAB,SENSOF-SENTAB,SENACF-SENTAB
TOGTAB:                         ; BYTE TO TOGGLE RAM BYTE W:
        .byte      $FF,8,2
TONMSG:                         ; POINTER TO TOGGLE ON MESS:
        .byte      SENCTN-SENTAB,SENSON-SENTAB,SENACN-SENTAB
;
;
;
;
;
GPOINT:                         ; TABLE OF GRAPHIC POINTERS:
        .byte      1,PHGRF1-PHGRAF,PHGRF2-PHGRAF,PHGRF3-PHGRAF,PHGRF4-PHGRAF
        .byte      PHGRF5-PHGRAF,DKGRF4-PHGRAF,DKGRF5-PHGRAF
        .byte      1,ZYGRF1-ZYGRAF,ZYGRF2-ZYGRAF,ZYGRF3-ZYGRAF,ZYGRF4-ZYGRAF
        .byte      ZYGRF5-ZYGRAF,ZYGRF6-ZYGRAF,ZYGRF7-ZYGRAF
        .byte      GBASER-ZYGRAF
        .byte      GBASR1-ZYGRAF,GBASR2-ZYGRAF,GBASR3-ZYGRAF,GBASR3-ZYGRAF,0,0,0
        .byte      GBASEM-PHGRAF
        .byte      GBASM1-PHGRAF,GBASM2-PHGRAF,GBASM3-PHGRAF,GBASM4-PHGRAF
        .byte      GBASM5-PHGRAF,GBASM6-PHGRAF,DKGRF5-PHGRAF
        .byte      GBASEL-ZYGRAF
        .byte      GBASL1-ZYGRAF,GBASL2-ZYGRAF,GBASL3-ZYGRAF,GBASL3-ZYGRAF,0,0,0
        .byte      DKGRAF-PHGRAF
        .byte      DKGRF1-PHGRAF,DKGRF2-PHGRAF,DKGRF3-PHGRAF,DKGRF4-PHGRAF
        .byte      DKGRF5-PHGRAF,DKGRF4-PHGRAF,DKGRF5-PHGRAF
        .byte      1,PHGRF1-PHGRAF,PHGRF2-PHGRAF,PHGRF3-PHGRAF,PHGRF4-PHGRAF
        .byte      PHGRF5-PHGRAF,DKGRF4-PHGRAF,DKGRF5-PHGRAF
;
                                

;
;
;
        .byte      ROGRAF-ZYGRAF
        .byte      ROGRF1-ZYGRAF,ROGRF2-ZYGRAF,ROGRF3-ZYGRAF,ROGRF4-ZYGRAF
        .byte      ROGRF5-ZYGRAF,ZYGRF6-ZYGRAF,ZYGRF7-ZYGRAF
        .byte      KLGRAF-ZYGRAF
        .byte      KLGRF1-ZYGRAF,KLGRF2-ZYGRAF,KLGRF3-ZYGRAF,KLGRF4-ZYGRAF
        .byte      KLGRF5-ZYGRAF,ZYGRF6-ZYGRAF,ZYGRF7-ZYGRAF
        .byte      HWARTG-PHGRAF,HWARTG-PHGRAF,HWARTG-PHGRAF,HWARTG-PHGRAF
        .byte      HWARTG-PHGRAF,HWARTG-PHGRAF,DKGRF4-PHGRAF,HWARTG-PHGRAF
;
NBYTAB:                         ; NUMBER OF BYTES TO STORE :
        .byte      15,13,11,9,7,5,1,1
        .byte      11,7,5,5,3,3,1,1
        .byte      9,8,5,2,0,0,0,0
        .byte      15,14,12,9,7,4,2,1
        .byte      9,8,5,2,0,0,0,0
        .byte      15,13,10,8,4,3,1,1
        .byte      15,13,11,9,7,5,1,1
        .byte      8,7,6,5,3,2,1,1
        .byte      9,9,6,6,4,3,1,1
        .byte      11,11,11,11,11,11,1,11
;
;
;
                                

;
;
TRKTAB:                         ; KEY FOR SWITCHING DISPLAY:
        .byte      $F8,$FF
CHTABL:                         ; FOR LDGALT, CODES FOR CHT:
        .byte      $0C,$1E,$1E,$1D,$1C,$1B
;
;
;
STERTB:                         ; USED IN HWARP STEERING , :
        .byte      $9F,$BF,$DF,$FF
;
;
;
BHORTB:                         ; STAR BASE HORIZ OFFSET TA:
        .byte      $F8,08
;
;
DIFTAB:                         ; RATING/DIFFICULTY TABLE
        .byte      80,76,60,111,60,60,50,100,40,50,40,90
RANKTB:                         ; RANK WORD VS. RATING HI N:
        .byte      $A9,$AA,$AA,$AB,$AB,$AC,$AC,$AD,$AD,$AE,$AE,$AF,$B0,$B1,$B2,$B3
        .byte      $B3,$B9,$B9
;
                                

;
CLASTB:                         ; DMA ASCII CLASS VS RATING:
        .byte      $95,$95,$95,$94,$94,$94,$94,$93,$93,$93,$92,$92,$92,$91
        .byte      $91,$91
;
MSENTB:                         ; MISSION TYPE TABLE
        .byte      SENNOV-SENTAB
        .byte      SENPIL-SENTAB
        .byte      SENWAR-SENTAB
        .byte      SENCOM-SENTAB
DPRBTB:                         ; DAMAGE PROB BASED ON MISDIF
        .byte      0,80,180,$FE
DAMGTB:                         ; SENTENCES FO DAMAGE (DAMCTL)
        .byte      SENPDM-SENTAB,SENEDM-SENTAB,SENSDM-SENTAB,SENCDM-SENTAB
        .byte      SENTDM-SENTAB,SENMDM-SENTAB
DESTTB:                         ; SENTENCES FO DESTROY (DAMCTL)
        .byte      SENPDS-SENTAB,SENEDS-SENTAB,SENSDS-SENTAB,SENCDS-SENTAB
        .byte      SENTDS-SENTAB,SENMDS-SENTAB
;
;
NOISTB:                         ; NOISE ROUTINE, INIT AUDTI:
; ATYPE2,AUDEXP,PHOREP,AUDCTL,AUDF3
; FOR PHOTONS
        .byte      $18,$FF,2,0,$8A,$A0,0,8,$50,$00
NOITB1:                         ; FOR SHIELD EXPLOSION
        .byte      $40,$40,1,3,$88,$AF,8,0,$50,4
NOITB2:                         ; FOR ZYLON EXPLOS
        .byte      $30,$40,1,3,$84,$A8,4,0,$50,4
;
;
                                

;
CH4TAB:                         ; NOTINT,       INIT REPPTR:
CH4TB1:                         ; HYPERSPACE
        .byte      2,2,2,3,12,2
CH4TB2:                         ; RED ALERT 
        .byte      4,3,$FF,$10,7,4
CH4TB3:                         ; KEYS 
        .byte      7,4,2,2,0,7
CH4TB4:                         ; DAMAGE 
        .byte      11,5,$FF,$20,2,11
CH4TB5:                         ; MESSAGE 
        .byte      14,6,8,$20,0,14
;
;
;
NOTTAB:                         ; TABL O NOTES, FF=RESERVED:
        .byte      $10,$FF         ; TRACKING 
        .byte      $18,$FF         ; HYPERSPACE 
        .byte      $40,$60,$FF     ; RED ALERT 
        .byte      $10,$10,$10,$FF ; KEYS 
        .byte      $40,$20,$FF     ; DAMAGE 
        .byte      $48,$40,$51,$FF ; STARFLEET MESSAGE 
;
;
ZYTARG:                         ; GRAPHIC OF ZYLON TARGET 
        .byte      $84,$B4,$FC,$B4,$84
;
;
;
;
PHOYPS:                         ; YPOSH FOR PHOTON 
        .byte      $FF,1
;
PHPOST:                         ; BOUNDS IN HITZYL 
        .byte      $C,$C,$C,$C,$E,$E,$E,$20
;
;
                                

;
PHPOSB:                         ; BOUNDS IN HITZYL 
        .byte      0,0,0,2,4,6,8,$C
;
;
;
;
PHODIF:                         ; THINK 
        .byte      $81,$84,$88,$94
ZYGIND:                         ; THINK 
        .byte      $80,$10,$10,$10,$70,$70,$70,$10
INTSEQ:                         ; THINK 
        .byte      4,4,0,0,0,1,0,0
;
ZYWARP:                         ; THINK 
        .byte      $3E,$1E,$10,8,4,2,1,0,0,$81,$82,$84,$88,$90,$9E,$BE
;
                                

;
;
CLITAB:                         ; LDTABS 
        .byte      $A6,$AA,$AF,0,0,$B8,$5A,$FC,$5E,$90
;
;
JMASK:                          ; HWARP SUB, USED FOR INITI:
        .byte      $FF,$FF,$3F,$0F,$3F,$7F,$FF,$FF
;
;
JMPWHN:                         ; TIMERS, WHEN EACH ZYLON T:
        .byte      0,$FF,$FF,$C0,$20
;
JMPTAB:                         ; TIMERS , JUMP VECTORS FOR:
        .byte      $F0,$EF,$FF,15,16,17,1,$F1,0
;
PHVECT:                         ; POHELP 
        .byte      0,8,$10,$18,$28,$30,$38,$40
;
;
;
COLTAB:                         ; OBJCOL, CHROMA FOR EACH T:
        .byte      $50,0,$20,$20,$20,0,$A0,0,0,$9F
;
COLINT:                         ; OBJCOL, INTENSITY PER XPO:
        .byte      $E,$E,$E,$C,$C,$C,$A,$A,$A,8,8,8,6,6,4,4
;
                                

;
PHOTB2:                         ; AUDIO, ATYPE3 
        .byte      $8A,$8F,$8D,$8B,$89,$87,$85,$83
PHOTB4:                         ; AUDIO, AFREQ3 
        .byte      0,4,1,4,1,4,1,4
		.byte		7		; this is in the Star Raiders ROM but not the listing
PHASE5:         
;
;
;
;
                                

;
;               CARTRIDGE OPERATING CODES
;
        .ORG     $BFFC
        .byte      0               ; CARTRIDGE IN FLAG
        .byte      $80             ; RUN CARTRIDGE IMMEDIATELY
        .word      INIT            ; START ADDR POINTER

END:
    .endproc

.segment  "BSS"
;
PHASE9:         
;
                                

;
;
;
;                       RAM MAP
;kf     ORG     $280
        .ORG     DISPLY  ;kf
RAMMAP:                         ; MISC RAM STORAGE
;DISPLY:                                ; DISPLAY LIST RAM
		.res		128
;
PHASE2:         
;
        .ORG     $300
		
PGRAPH:         
MGRAPH:                         ; MISSLE GRAPHICS RAM 
		.res		256
PGRAP0:         
		.res		256
PGRAP1:         
		.res		256
PGRAP2:         
		.res		256
PGRAP3:         
		.res		256
;
VCONL:                          ; VERT CONVERT TABLE LO BYT:
		.res		100
VCONH:                          ; VERT CONVERT TABLE HI BYT:
		.res		100
		.res		1			; BUFFER BYTE
CHTRAM:                         ; CHART RAM, HOW MANY ZYLON:
		.res		128
DISCTL:                         ; DISPLAY OF CONTRAL STATUS:
		.res		2
DVELOC:                         ; DISP OF VELOC 
		.res		2
		.res		3
DKILL:                          ; DISP OF KILL 
		.res		2
		.res		3
DENERG:                         ; DISPLAY OF ENERGY 
		.res		4
		.res		3
DCSTOR:                         ; WHICH OBJ TRACKING 
		.res		1
; NEXT LINE
		.res		3
DTHETA:                         ; DISPLAY OF THETA
		.res		3
		.res		3
DPHI:                           ; DISPLAY OF PHI
		.res		3
		.res		3
DRHO:                           ; DISPLAY OF RHO
        .res		4
		.res		1

; NEXT LINE
DGALAC:                         ; GALACTIC CHART INFO
		.res		12
DWENER:                         ; DISPLAY WARP ENERGY
		.res		3
		.res		5
; NEXT LINE
		.res		8
DTARG:                          ; DISP OF TARGETS IN QUAD
		.res		1
		.res		4
DAMAGE:                         ; DAMAGE CONTROL RAM, +0=PH:
		.res		6			; +2=SHIELDS,+3=COMPUTER,+4:
								; +5=SUB-SPACE RADIO
		.res		1
; NEXT LINE
		.res		10
DSDATE:                         ; DISP OF STAR DATE
		.res		5
		.res		5
STRRAM:                         ; RAM FOR STARS , OBJECTS POSITIONS, ETC.
XSIGN:                          ; SIGN OF XPOS 
		.res		RAMNUM
YSIGN:          
		.res		RAMNUM
ZSIGN:          
		.res		RAMNUM
XPOSH:                          ; XPOS IN SPACE HI BYTE 
		.res		RAMNUM
YPOSH:          
		.res		RAMNUM
ZPOSH:          
		.res		RAMNUM
XPOSL:                          ; XPOS IN SPACE LO BYTE 
		.res		RAMNUM
YPOSL:          
		.res		RAMNUM
ZPOSL:          
		.res		RAMNUM
XINCRE:                         ; OBJECTS X DIRECTION VELOCITY
		.res		RAMNUM
YINCRE:         
		.res		RAMNUM
ZINCRE:         
		.res		RAMNUM
VPOS:                           ; VERT POS ON SCREEN 
		.res		RAMNUM
HPOS:                           ; HORIZ POS ON SCREEN 
		.res		RAMNUM
OLDVER:                         ; OLD VERT POSIT 
		.res		RAMNUM
GINDEX:                         ; TYPE OF GRAPHIC: OBJECT
OLDHOR:                         ; OLD HORIZ POSIT: STARS
		.res		RAMNUM
OLDNUM:                         ; PREVIOUS NUMBER OF BYTES
OLDBYT:                         ; OLD BYTE IN RAM MAP
		.res		RAMNUM
NUMBYT:                         ; HOW MAY BYTES TO STORE: OBJCET
STRBYT:                         ; THE BYTE TO STORE: STARS
		.res		RAMNUM
MESAGE:                         ; DISPLAY OF MESSAGE RAM 
		.res		20			; BUFFER ZONE
		.res		2
;
CHTDIS:                         ; CHAR GRAPHICS PNTR FO GAL:
		.res		180
;
PTAB:                           ; X80 SCALER TABLE 
		.res		256
BCDCON:                         ; BINARY TO BCD TABLE 
		.res		256
;
PHASE7:         
;
        .ORG     $1000
MEMMAP:                         ; SCREEN MAP RAM 
		.res		4096
MEMEND:         
PHASE3:         
;
;                       END PROGRAM


RUNAD = $2E0


    .segment "EXEHDR"
    .word $FFFF
    .word codestart
    .word codestart::END - 1

    .segment "AUTOSTRT"
    .word RUNAD
    .word RUNAD + 1
    .word codestart::INIT
