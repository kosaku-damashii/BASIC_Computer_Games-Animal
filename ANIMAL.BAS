  1 WIDTH 80
 10 GOSUB TAB,32:PRINT "ANIMAL" :REM
 20 GOSUB TAB,15:PRINT "CREATIVE COMPUTING NORRISTOUN, NEW JERSEY" :REM
 30 PRINT: PRINT: PRINT
 40 PRINT "PLAY 'GUESS THE ANIMAL'"
 50 PRINT "THINK OF AN ANIMAL AND THE COMPUTER WILL TRY TO GUESS IT."
 60 PRINT
 62 USEVAR Z1 :REM
 70 DIM A(200) :REM
 80 FOR I=0 TO 3
 90   A(I)=READ() :REM
100 NEXT :REM
110 P=A(0):N=VAL(P$) :REM
120 REM          MAIN CONTROL SECTION
130 PRINT "ARE YOU THINKING OF AN ANIMAL ";:R$=INPUT$() :REM
140 IF STRNCMP(R$,"LIST",4)=0 THEN 600 :REM
150 IF STRNCMP(GOSUB$(LEFT,R$,1),"Y",1)!=0 THEN 120 :REM
160 K=1
170 GOSUB 390
180 P=A(K):IF LEN(P$)=0 THEN 999 :REM
190 P=A(K):IF STRNCMP(GOSUB$(LEFT,P$,2),"\\Q",2)=0 THEN 170 :REM
200 P=A(K):PRINT "IS IT A ";GOSUB$(RIGHT,P$,LEN(P$)-2); :REM
210 R$=INPUT$() :REM
220 R$=GOSUB$(LEFT, R$,1) :REM
230 IF STRNCMP(R$,"Y",1)=0 THEN PRINT "WHY NOT TRY ANOTHER ANIMAL?":GOTO 120 :REM
240 PRINT "THE ANIMAL YOU WERE THINKING OF WAS A ";:V$=INPUT$()
250 PRINT "PLEASE TYPE IN A QUESTION THAT WOULD DISTINGUISH A"
260 P=A(K):PRINT V$;" FROM A ";GOSUB$(RIGHT,P$,LEN(P$)-2) :REM
270 X$=INPUT$()
280 PRINT "FOR A ";V$;" THE ANSWER WOULD BE ";
290 R$=INPUT$() :REM
300 R$=GOSUB$(LEFT, R$,1): IF STRNCMP(R$,"Y",1)!=0 AND STRNCMP(R$,"N",1)!=0 THEN 280 :REM
310 IF STRNCMP(R$,"Y",1)=0 THEN B$="M"
320 IF STRNCMP(R$,"N",1)=0 THEN B$="Y"
330 P=A(0):Z1=VAL(P$)
340 P=A(0):P$=DEC$(Z1+2) :REM
350 Q=A(Z1):P=A(K):Q$=P$
360 P=A(Z1+1):P$="\\A"+V$
370 P=A(K):P$="\Q"+X$+"\\"+R$+DEC$(Z1+1)+"\\"+B$+DEC$(Z1)+"\\" :REM
380 GOTO 120
390 REM     SUBROUTINE TO PRINT QUESTIONS
400 P=A(K):Q$=P$
410 FOR Z=3 TO LEN(Q$)
415   IF STRNCMP(GOSUB$(MID, Q$,Z,1),"\\",1)!=0 THEN PRINT GOSUB$(MID, Q$,Z,1); :REM
416 NEXT :REM
420 C$=INPUT$() :REM
430 C$=GOSUB$(LEFT, C$,1)
440 IF STRNCMP(C$,"Y",1)!=0 AND STRNCMP(C$,"N",1)!=0 THEN 410 :REM
450 T$="\\"+C$ :REM
455 FOR X=3 TO LEN(Q$)-1
460   IF STRNCMP(GOSUB$(MID, Q$,X,2),T$,2)=0 THEN 480 :REM
470 NEXT :REM
475 END :REM
480 FOR Y=X+1 TO LEN(Q$)
490   IF STRNCMP(GOSUB$(MID, Q$,Y,1),"\\",1)=0 THEN 510 :REM
500 NEXT :REM
505 END :REM
510 K=VAL(GOSUB$(MID, Q$,X+2,Y-X-2))
520 RETURN
530 DATA "4","\\QDOES IT SWIM\\Y2\\N3\\","\\AFISH","\\ABIRD" :REM
600 PRINT: PRINT "ANIMALS I ALREADY KNOW ARE:"
605 X=0
610 FOR I=1 TO 200
611   P=A(I) :REM
620   IF STRNCMP(GOSUB$(LEFT, P$,2),"\\A",2)!=0 THEN 650 :REM
624   GOSUB TAB,12*X :REM
630   FOR Z=3 TO LEN(P$) :REM
640     IF STRNCMP(GOSUB$(MID, P$,Z,1),"\\",1)!=0 THEN PRINT GOSUB$(MID, P$,Z,1); :REM
642   NEXT :REM
645   X=X+1: IF X>5 THEN X=0: PRINT
650 NEXT
660 PRINT
670 PRINT
680 GOTO 120 
999 END


REM Subroutines For MachiKania

LABEL LEFT
VAR X,Y,R
X$=ARGS$(1)
Y=ARGS(2)
R$=X$(0,Y)
RETURN R$

LABEL MID
VAR X,Y,Z
X$=ARGS$(1)
Y=ARGS(2)-1
Z=ARGS(3)
R$=X$(Y,Z)
RETURN R$

LABEL RIGHT
VAR X,Y,R
X$=ARGS$(1)
Y=ARGS(2)
R$=X$(-Y)
RETURN R$

LABEL TAB
VAR I,J
J=ARGS(1)
FOR I=0 TO J-1
  PRINT " ";
NEXT
RETURN

LABEL INIRND
POKE32 SYSTEM(101),CORETIMER()
RETURN

LABEL RND_
VAR I,J
I=ARGS(1)
J#=FLOAT#(RND()*I)/32767
RETURN J#
