      SUBROUTINEDTCF2
      Character*1Savcar(15)/15*' '/,Symcon/' '/
      INTEGER*2I34,I344,Lnold,Wcl,Icont/1/
      Integer*4Wln
      Integer*2WP,PLST(65)/1,0,0,3,3,2,2,10,11,12,17,13,0,0,4,4,4,5,4,5,
     *4,4,4,17,4,3,9,6,6,8,9,9,9,10,11,12,17,14,0,0,15,6,0,0,0,0,0,0,0,1
     *7,0,6,0,15,6,0,0,0,0,0,0,0,17,0,16/
      INTEGER*2Wpos/80/,WSTATE,WST(65)/2,1,0,1,1,3,3,1,1,1,1,4,1,2,1,0,1
     *,3,1,3,1,1,1,2,4,1,3,1,0,3,3,3,3,1,1,1,3,5,3,4,4,0,4,4,4,4,4,4,4,4
     *,4,1,5,5,0,5,5,5,5,5,5,5,5,5,3/
      INTEGER*2WCLASS(256,2)/6,6,6,6,6,6,6,6,6,6,6,6,6,11,2,6,6,6,6,6,6,
     *6,6,6,6,6,6,6,6,6,6,6,7,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,1,1,1,1,1,1,
     *1,1,1,1,5,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
     *6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
     *6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
     *6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
     *6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
     *6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
     *6,6,6,6,3,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
     *6,6,6,6,6,6,2,6,8,9,10,6,12,13,6,6,6,6,6,6,6,6,6,6,6,6,4,6,6,6,6,6
     *,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6
     *,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6
     *,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6
     *,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6
     *,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6
     *,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6/
      Character*40WDIA/'C  TRF000  Syntactical or Alias error  '/,Fortio
     */'C-->Fortran section begins....         '/,Trefio/'C-->Trefor  se
     *ction begins....         '/,Pascio/'(*  Pascal  section begins....
     *       *)'/
      Integer*2Ioutlt,Jprog,Out(6,23)/16,1,0,0,0,0,16,-1,15,0,0,0,2,-1,0
     *,0,0,0,14,-1,0,0,0,0,16,-3,17,0,0,0,12,-1,16,0,0,0,16,-1,0,0,0,0,1
     *7,-2,17,0,0,0,14,-2,16,-1,17,0,14,-1,16,-2,17,0,18,-1,0,0,0,0,19,0
     *,0,0,0,0,-1,20,0,0,0,0,16,-1,17,0,0,0,16,0,0,0,0,0,12,-2,16,0,0,0,
     *-1,17,0,0,0,0,14,-1,16,0,0,0,16,-2,17,0,0,0,12,-1,16,-2,17,0,16,-3
     *,13,0,0,0,12,-1,0,0,0,0,0,0,0,0,0,0/
      Character*1DCLASS(256)/' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
     *,' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','
     * ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
     *,' ',' ',' ',' ','*','*','*','*','*','*','*','*','*','*',' ',' ','
     * ',' ',' ',' ',' ','*','*','*','*','*','*','*','*','*','*','*','*'
     *,'*','*','*','*','*','*','*','*','*','*','*','*','*','*',' ',' ','
     * ',' ',' ',' ','*','*','*','*','*','*','*','*','*','*','*','*','*'
     *,'*','*','*','*','*','*','*','*','*','*','*','*','*',' ',' ',' ','
     * ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
     *,' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','
     * ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
     *,' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','
     * ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
     *,' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','
     * ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
     *,' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '/
      INTEGER*2CLASS(256)/2,1,1,1,1,3,3,3,3,3,3,3,3,3,4,5,6,7,8,9,10,11,
     *12,13,14,15,16,17,18,19,20,21,25,26,1,24,1,1,1,1,1,1,1,1,1,1,1,1,1
     *,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,22,23,1,1,1,1,1,1,1,1,1,1,1,1,1
     *,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
     *,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
     *,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
     *,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
     *,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
     *,1,1,1,1,1,1,1,1,1,1/
      Integer*2Crko
      Character*1lcrko(2)
      Equivalence(Crko,Lcrko)
      Character*1TXTS(61)/':','I','F','(','.','N','O','T','.','(','D','O
     *','.','G','T','.','L','T','.','G','E','.','L','E','.','N','E','.',
     *'E','Q','.','A','N','D','.','O','R','.',')',')','G','O','T','O',':
     *','C','O','N','T','I','N','U','E','$','G','O','T','O','(',')',','/
      INTEGER*2TBEG(22)/2,11,13,16,19,22,25,28,31,35,5,39,45,54,1,54,45,
     *55,55,61,60,45/
      INTEGER*2TLNG(22)/9,2,6*4,5,4,5,6,9,5,10,1,10,4,5,1,2,1/
      Integer*4Remlab,LABSEL,CURLAB
      INTEGER*2SCLASS,SPRED,CSTACK,SPROG,NSEL,NC,ICASE,Nproc
      INTEGER*2SPRG(390)/5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,7,7,7,7,7,7,7,7
     *,7,7,7,7,5,5,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,3,3,0,3,3,18,3,3,3,0,3,
     *3,0,3,3,0,8,0,0,0,0,10,0,0,0,0,0,0,0,0,1,1,0,1,1,0,1,1,1,0,1,1,0,1
     *,1,0,0,0,13,13,0,0,0,0,0,0,0,0,0,0,0,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0
     *,0,0,9,0,0,0,0,0,0,0,0,0,0,0,2,2,0,2,2,0,2,2,2,0,2,2,0,2,2,0,11,0,
     *11,11,0,11,11,11,0,11,11,0,0,0,0,12,0,12,12,0,12,12,12,0,12,12,0,0
     *,0,14,14,0,14,14,0,14,14,14,0,14,14,0,14,14,0,0,0,0,0,0,0,17,0,0,0
     *,0,0,0,0,0,0,0,0,0,0,0,15,0,0,1,0,0,0,0,0,0,0,0,0,0,0,13,0,0,0,0,0
     *,0,0,19,19,0,19,19,0,19,19,19,0,19,19,0,19,19,0,0,0,0,0,0,23,0,23,
     *0,0,0,0,0,0,24,24,0,24,24,0,24,24,24,0,24,24,0,24,24,0,0,0,0,0,0,0
     *,0,0,0,21,0,0,0,0,7,7,7,7,7,7,7,13,7,7,13,13,7,7,7,0,17,31,17,17,3
     *0,17,0,21,0,31,21,0,0,0,32,8,0,13,13,0,10,0,20,0,25,21,0,32,29,5,5
     *,5,5,5,5,5,5,5,27,5,5,26,5,5,28,28,0,28,28,0,28,28,28,0,28,28,0,28
     *,28,0,0,0,0,0,0,0,0,0,0,0,0,0,16,0/
      INTEGER*2CSTK(390)/0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
     *,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,0,2,2,7,2,2,2,0,2,2
     *,0,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,3,0,3,3,0,3,3,3,0,3,3,0,3,3
     *,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
     *,5,0,0,0,0,0,0,0,0,0,0,0,6,6,0,6,6,0,6,6,6,0,6,6,0,6,6,0,0,0,0,0,0
     *,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,8,0,8,8,0,8,8,8
     *,0,8,8,0,8,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
     *,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,9,0,9,9,0,9,9,9,0,9,9,0,9,9
     *,0,0,0,0,0,0,13,0,10,0,0,0,0,0,0,11,11,0,11,11,0,11,11,11,0,11,11,
     *0,11,11,0,0,0,0,0,0,0,0,0,0,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
     *,0,0,0,4,0,0,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
     *,0,0,0,0,0,0,0,0,0,0,0,0,0,14,14,0,14,14,0,14,14,14,0,14,14,0,14,1
     *4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0/
      INTEGER*2SPRD(390)/0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,1,2,1,1,1,0,1,1
     *,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,1,0,1,1,1,0,1,1,0,1,1
     *,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
     *,2,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,1,0,1,1,1,0,1,1,0,1,1,0,0,0,0,0,0
     *,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,3,0,3,3,0,3,3,3
     *,0,3,3,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
     *,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,1,0,1,1,1,0,1,1,0,1,1
     *,0,0,0,0,0,0,2,0,2,0,0,0,0,0,0,3,3,0,3,3,0,3,3,3,0,3,3,0,3,3,0,0,0
     *,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,2
     *,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
     *,0,0,0,2,0,0,1,1,0,1,1,0,1,1,1,0,1,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0
     *,0,0,0/
      INTEGER*2Blab,Numtxt/0/
      INTEGER*2Ilab
      INTEGER*2ITXT,CTXT
      LogicalFoundo
      Character*1ALL(3)/'A','L','L'/,VARLV(80)
      INTEGER*2LoopSt(64),Leave(64),Pvardo(64),Iter(64),STATE(128),Labs(
     *128),Ssptr,Sloop,Cvardo
      Integer*2Stproc(32),Cproc,i2,i3
      Character*1VARDO(640)
      INTEGER*2Ido/0/
      Integer*2Lcurdo/0/
      Integer*2Dig0
      Character*1Mcs(2)
      INTEGER*2CS,SW,CHLN
      EQUIVALENCE(CS,MCS(1))
      Character*1MSW(2)
      EQUIVALENCE(SW,MSW(1))
      INTEGER*2SU1
      Character*1MSU1(2)
      EQUIVALENCE(SU1,MSU1(1))
      Integer*2COMPS,SYNT,RETWTR
      Integer*2Spec
      IntegerPosold
      INTEGER*2WDIG
      Character*1MWDIG(2)
      EQUIVALENCE(WDIG,MWDIG(1))
      Character*1Outcar(80)
      CHARACTER*6BLANK6/'      '/,BOUTC
      EQUIVALENCE(OUTCAR(1),BOUTC)
      LOGICALFort,Waitbr
      Integer*4CNSYMB,PNSYMB(50)
      INTEGER*2CASON,CSYMB,PASON(50),PSPTR
      Character*1MCSYM(2)
      EQUIVALENCE(CSYMB,MCSYM(1))
      INTEGER*2ILIND,NLIND,NIND,REQLN
      Character*1Slind(2)
      EQUIVALENCE(ILIND,Slind(1))
      Integer*2CKY
      Character*1LINDT(80),KY(2)
      EQUIVALENCE(CKY,KY(1))
      Integer*4Ltextd
      Integer*4Lalias,Pathal
      Integer*2Csals,Cdef,Cndef,Csdef,Stals,Tstals,Stpal(20),Stdefa(20),
     *JP7,kp7
      Character*1Mcsals(2)
      Equivalence(Mcsals(1),Csals)
      Character*1Posald(4)
      Equivalence(Posald(1),Ltextd)
      Character*1Alias(80),byte(2)
      Integer*2Albyte
      Equivalence(Albyte,byte(1))
      LogicalFounda,Recals
      Character*1Tsym(30)/' ','-','%',':','=','_','''',';','$','*','@','
     */','!','&','>','<','^','0','[',']','.','+',',','9','?','"','C','#'
     *,'H','h'/
      Character*1TEXT(65535)
      INTEGER*2LIND(2048),Plind(512),ASON(512),NOFSON(512),HEADLN(512),A
     *LSPRE(512)
      Integer*4ATEXT(512)
      Integer*4RETCOD,NUMERR,Llab,CLIND,Ndef
      COMMON/TREE/ATEXT,LIND,Plind,ASON,NOFSON,HEADLN,ALSPRE,TEXT
      COMMON/RC/RETCOD,NUMERR,LST,NBYTE,NODTOT,CLIND
      INTEGER*2UP(256)/0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
     *,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41
     *,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63
     *,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85
     *,86,87,88,89,90,91,92,93,94,95,96,65,66,67,68,69,70,71,72,73,74,75
     *,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,123,124,125,126,127,
     *128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,14
     *4,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,
     *161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,17
     *7,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,
     *194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,21
     *0,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,
     *227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,24
     *3,244,245,246,247,248,249,250,251,252,253,254,255/
      Common/Label/Llab,Ndef
      Integer*2Alpred,Alsprc,Calias,Palias
      Character*1Nalias
      Integer*4Talbeg,Talfin
      Common/Tabals/Talbeg(300),Talfin(300),Palias(300),Nalias(3000),Alp
     *red(300)
      Integer*2Nc1st,Nextc,Retlab
      Common/Taproc/Nc1st(32),Nextc(256),Retlab(256)
      Character*1Retrt(6)/'I','6','R',' ',' ',' '/
      COMPS=1
      Synt=1
      RETWTR=2
      Spec=1
      Wpos=1
      Fort=.false.
      CKY=1
      CrKO=13
      DO09943I=1,80
      OUTCAR(I)=' '
09943 CONTINUE
      TXTS(54)=Lcrko(1)
      MCS(1)=Tsym(18)
      Dig0=Cs
      GOTO09996
09997 GOTO(2001,2002,2003),COMPS
2001  CONTINUE
      CNSYMB=1
      CASON=2
      CHLN=0
      PSPTR=0
      MCSYM(1)=TEXT(1)
09940 IF(.NOT.(PSPTR.NE.0.OR.CSYMB.NE.14.OR.Text(cnsymb+1).NE.KY(1)))GOT
     *O09939
      IF(.NOT.(Csymb.EQ.14))GOTO09937
      CNSYMB=CNSYMB+1
      MCSYM(1)=TEXT(CNSYMB)
      GOTO(09934,09933,09932,09931),Csymb
      CS=CSYMB
      COMPS=2
      Retwtr=2
      GOTO09998
      GOTO09930
09934 CONTINUE
      CNSYMB=PNSYMB(PSPTR)
      CASON=PASON(PSPTR)+1
      PSPTR=PSPTR-1
      IF(.NOT.(PSPTR.EQ.0))GOTO09929
      CHLN=0
      GOTO09928
09929 CONTINUE
      CHLN=PASON(PSPTR)
      CHLN=HEADLN(CHLN)
09928 CONTINUE
      GOTO09930
09933 CONTINUE
      IF(.NOT.(ATEXT(CASON).EQ.0))GOTO09926
      REQLN=HEADLN(CASON)
      NLIND=PLIND(CASON)
      NIND=0
09923 IF(.NOT.(NLIND+NIND.LT.PLIND(CASON+1).AND.NIND.LT.80))GOTO09922
      ILIND=LIND(NLIND+NIND)
      NIND=NIND+1
      LINDT(NIND)=Slind(1)
      GOTO09923
09922 CONTINUE
      WRITE(6,2999)REQLN,CASON,(LINDT(ILIND),ILIND=1,NIND)
      WRITE(0,2999)REQLN,CASON,(LINDT(ILIND),ILIND=1,NIND)
      RETCOD=MAX0(RETCOD,2)
      CASON=CASON+1
      GOTO09925
09926 CONTINUE
      CHLN=HEADLN(CASON)
      PSPTR=PSPTR+1
      PNSYMB(PSPTR)=CNSYMB
      PASON(PSPTR)=CASON
      CNSYMB=ATEXT(CASON)-1
      CASON=ASON(CASON)
09925 CONTINUE
      GOTO09930
09932 CONTINUE
      posald(1)=text(Cnsymb+1)
      posald(2)=text(Cnsymb+2)
      posald(3)=text(Cnsymb+3)
      posald(4)=text(Cnsymb+4)
      Cnsymb=Ltextd-1
      GOTO09930
09931 CONTINUE
      Recals=.false.
      cnsymb=cnsymb+1
      byte(1)=TEXT(cnsymb)
      cnsymb=cnsymb+1
      byte(2)=TEXT(cnsymb)
      Alsprc=albyte
      Lalias=0
      cnsymb=cnsymb+1
      MCSYM(1)=TEXT(cnsymb)
09920 IF(.NOT.(MCSYM(1).NE.Tsym(1).AND.Lalias.LT.80))GOTO09919
      Lalias=Lalias+1
      Alias(Lalias)=MCSYM(1)
      cnsymb=cnsymb+1
      MCSYM(1)=TEXT(cnsymb)
      GOTO09920
09919 CONTINUE
      Csdef=Alsprc
      Founda=.false.
09917 IF(.NOT.(Csdef.GT.0.AND..NOT.Founda))GOTO09916
      Cdef=Csdef
      IF(.NOT.(Lalias.EQ.Palias(Cdef+1)-Palias(Cdef)))GOTO09914
      Jp7=0
      Founda=.true.
      KP7=Palias(Cdef)
09911 IF(.NOT.((Jp7.LT.Lalias).AND.Founda))GOTO09910
      Jp7=Jp7+1
      IF(ALIAS(Jp7).NE.Nalias(KP7))Founda=.false.
      KP7=KP7+1
      GOTO09911
09910 CONTINUE
09914 CONTINUE
      Csdef=Alpred(Cdef)
      GOTO09917
09916 CONTINUE
      IF(.NOT.(Founda))GOTO09908
      Stals=0
      Cndef=Cdef
      Pathal=Talbeg(Cndef)
09908 CONTINUE
09905 IF(.NOT.((Stals.NE.0.OR.Pathal.NE.Talfin(Cndef)).AND.Founda))GOTO0
     *9904
      Mcsals(1)=TEXT(Pathal)
      IF(.NOT.(Pathal.EQ.Talfin(Cndef)))GOTO09902
      Cndef=Stdefa(Stals)
      Pathal=Stpal(Stals)
      Stals=Stals-1
      GOTO09900
09902 CONTINUE
      IF(.NOT.(Csals.EQ.14))GOTO09901
      pathal=pathal+1
      Mcsals(1)=Text(pathal)
      IF(.NOT.(Csals.EQ.4))GOTO09899
      Lalias=0
      pathal=pathal+1
      MCSYM(1)=TEXT(pathal)
09896 IF(.NOT.(MCSYM(1).NE.Tsym(1).AND.Lalias.LT.80))GOTO09895
      Lalias=Lalias+1
      Alias(Lalias)=MCSYM(1)
      pathal=pathal+1
      MCSYM(1)=TEXT(pathal)
      GOTO09896
09895 CONTINUE
      Csdef=Alsprc
      Founda=.false.
09893 IF(.NOT.(Csdef.GT.0.AND..NOT.Founda))GOTO09892
      Cdef=Csdef
      IF(.NOT.(Lalias.EQ.Palias(Cdef+1)-Palias(Cdef)))GOTO09890
      Jp7=0
      Founda=.true.
      KP7=Palias(Cdef)
09887 IF(.NOT.((Jp7.LT.Lalias).AND.Founda))GOTO09886
      Jp7=Jp7+1
      IF(ALIAS(Jp7).NE.Nalias(KP7))Founda=.false.
      KP7=KP7+1
      GOTO09887
09886 CONTINUE
09890 CONTINUE
      Csdef=Alpred(Cdef)
      GOTO09893
09892 CONTINUE
      IF(.NOT.(Founda))GOTO09884
      Stals=Stals+1
      Stpal(Stals)=Pathal
      Stdefa(Stals)=Cndef
      Cndef=Cdef
      Pathal=Talbeg(Cndef)-1
      Tstals=Stals
      Recals=.false.
09881 IF(.NOT.(Tstals.GT.0.AND..NOT.Recals))GOTO09880
      IF(.NOT.(Stdefa(Tstals).EQ.Cdef))GOTO09878
      Recals=.true.
      Founda=.false.
09878 CONTINUE
      Tstals=Tstals-1
      GOTO09881
09880 CONTINUE
09884 CONTINUE
      GOTO09898
09899 CONTINUE
      Cs=Csals
      comps=3
      Retwtr=2
      goto09998
09898 CONTINUE
      GOTO09900
09901 CONTINUE
      Sw=Csals
      comps=3
      Retwtr=1
      goto09999
09900 CONTINUE
2003  Pathal=Pathal+1
      GOTO09905
09904 CONTINUE
      IF(.NOT.(.NOT.Founda))GOTO09875
      IF(.NOT.(Recals))GOTO09872
      write(6,2997)CHLN,(Alias(ial),ial=1,lalias)
      write(0,2997)CHLN,(Alias(ial),ial=1,lalias)
      GOTO09871
09872 CONTINUE
      write(6,2998)CHLN,(Alias(ial),ial=1,lalias)
      write(0,2998)CHLN,(Alias(ial),ial=1,lalias)
09871 CONTINUE
      Comps=2
      Retwtr=2
      Goto09995
09875 CONTINUE
09930 CONTINUE
      GOTO09936
09937 CONTINUE
      SW=CSYMB
      COMPS=2
      Retwtr=1
      GOTO09999
09936 CONTINUE
2002  Continue
      CNSYMB=CNSYMB+1
      MCSYM(1)=TEXT(CNSYMB)
      GOTO09940
09939 CONTINUE
      CS=0
      GOTO09998
09998 GOTO(3001,3002,3003,3004,3005,3006,3007,3008),Synt
3001  CONTINUE
      GOTO09869
09993 CONTINUE
      Ioutlt=1
      Numtxt=Out(1,jprog)
09866 IF(.NOT.(Numtxt.NE.0))GOTO09865
      IF(.NOT.(Numtxt.GT.0))GOTO09863
      ITXT=TBEG(Numtxt)
      CTXT=TLNG(Numtxt)
09860 IF(.NOT.(CTXT.GT.0))GOTO09859
      MSW(1)=TXTS(ITXT)
      Synt=4
      GOTO09999
3004  CONTINUE
      CTXT=CTXT-1
      ITXT=ITXT+1
      GOTO09860
09859 CONTINUE
      GOTO09862
09863 CONTINUE
      Ilab=0
      Remlab=Labs(Ssptr)+Numtxt+1
09857 IF(.NOT.(Ilab.LT.5))GOTO09856
      Ilab=Ilab+1
      SW=Remlab/10000
      Remlab=MOD(Remlab,10000)*10
      SW=SW+Dig0
      Synt=3
      GOTO09999
3003  CONTINUE
      GOTO09857
09856 CONTINUE
09862 CONTINUE
      Ioutlt=Ioutlt+1
      Numtxt=Out(Ioutlt,jprog)
      GOTO09866
09865 CONTINUE
      GOTO(09992,09991,09990,09989,09988,09987,09986,09985,09984,09983,0
     *9982,09981,09980,09979,09978,09977,09976,09975,09974,09973,09972,0
     *9971,09970,09969,09968,09967,09966,09965,09964,09963,09962,09961,0
     *9960,09959,09958,09957,09956,09955,09954),I6R001
09869 CONTINUE
      Ssptr=1
      STATE(1)=1
      Cvardo=1
      Pvardo(1)=1
      Ido=0
      Cproc=0
09854 IF(.NOT.(STATE(Ssptr).NE.0))GOTO09853
      Synt=2
      GOTO09997
3002  CONTINUE
      SCLASS=CLASS(CS+1)
      ISPROG=(SCLASS-1)*15+STATE(Ssptr)
      SPROG=SPRG(ISPROG)
      CSTACK=CSTK(ISPROG)
      SPRED=SPRD(ISPROG)
      GOTO(09851,09850,09849),SPRED
      GOTO09848
09851 CONTINUE
      Ssptr=Ssptr+1
      STATE(Ssptr)=CSTACK
      Labs(Ssptr)=Llab
      Llab=Llab-3
      GOTO09848
09850 CONTINUE
      STATE(Ssptr)=CSTACK
      GOTO09848
09849 CONTINUE
      Ssptr=Ssptr+1
      STATE(Ssptr)=CSTACK
09848 CONTINUE
      GOTO(09847,09846,09845,09844,09843,09842,09841,09840,09839,09838,0
     *9837,09836,09835,09834,09833,09832,09831,09830,09829,09828,09827,0
     *9826,09825,09824,09823,09822,09821,09820,09819,09818,09817,09816),
     *SPROG
09995 CONTINUE
      SW=55
      NUMERR=NUMERR+1
      Synt=5
      Spec=2
      GOTO09999
      GOTO09815
09847 CONTINUE
      Jprog=1
      I6R001=3
      GOTO09993
09990 CONTINUE
      Waitbr=.true.
      If(Fort)Plst(33)=20
      GOTO09815
09846 CONTINUE
      Ido=Ido+1
      LoopSt(Ido)=Ssptr
      Leave(Ido)=0
      Iter(Ido)=0
      Pvardo(Ido+1)=Cvardo
      Jprog=2
      I6R001=4
      GOTO09993
09989 CONTINUE
      Waitbr=.true.
      If(Fort)Plst(33)=20
      GOTO09815
09845 CONTINUE
      Ido=Ido+1
      LoopSt(Ido)=Ssptr
      Leave(Ido)=0
      Iter(Ido)=0
      Jprog=3
      I6R001=5
      GOTO09993
09988 CONTINUE
      CNSYMB=CNSYMB+1
      Msw(1)=TEXT(CNSYMB)
09814 IF(.NOT.(Dclass(sw+1).EQ.Tsym(10)))GOTO09813
      SU1=UP(SW+1)
      VARDO(Cvardo)=MSU1(1)
      Cvardo=Cvardo+1
      Synt=8
      GOTO09999
3008  CNSYMB=CNSYMB+1
      Msw(1)=TEXT(CNSYMB)
      GOTO09814
09813 CONTINUE
      Pvardo(Ido+1)=Cvardo
      Cnsymb=Cnsymb-1
      GOTO09815
09844 CONTINUE
      Jprog=23
      Out(1,jprog)=CS-2
      I6R001=6
      GOTO09993
09987 CONTINUE
      GOTO09815
09843 CONTINUE
      SW=CS
      Synt=5
      Spec=2
      GOTO09999
      GOTO09815
09842 CONTINUE
      Jprog=6
      I6R001=7
      GOTO09993
09986 CONTINUE
      Waitbr=.false.
      If(Fort)Plst(33)=9
      GOTO09815
09841 CONTINUE
      Synt=6
      SW=55
      NUMERR=NUMERR+1
      Spec=2
      GOTO09999
3006  Synt=5
      Sw=Cs
      Spec=2
      GOTO09999
      GOTO09815
09840 CONTINUE
      Jprog=7
      I6R001=8
      GOTO09993
09985 CONTINUE
      Jprog=8
      IF(.NOT.(Leave(Ido).NE.0))GOTO09811
      Out(2,Jprog)=-2
      GOTO09810
09811 CONTINUE
      Out(2,Jprog)=0
09810 CONTINUE
      Cvardo=Pvardo(Ido)
      Ido=Ido-1
      I6R001=9
      GOTO09993
09984 CONTINUE
      Ssptr=Ssptr-1
      GOTO09815
09839 CONTINUE
      Jprog=9
      I6R001=10
      GOTO09993
09983 CONTINUE
      Labs(Ssptr)=Labs(Ssptr)-1
      GOTO09815
09838 CONTINUE
      IF(.NOT.(Iter(Ido).NE.0))GOTO09808
      Jprog=5
      I6R001=11
      GOTO09993
09982 CONTINUE
09808 CONTINUE
      Jprog=10
      I6R001=12
      GOTO09993
09981 CONTINUE
      Cvardo=Pvardo(Ido)
      Ido=Ido-1
      Ssptr=Ssptr-1
      GOTO09815
09837 CONTINUE
      Blab=1
5051  IF(Ido.EQ.0)goto09995
      Jprog=11
      CNSYMB=CNSYMB+1
      MCS(1)=TEXT(CNSYMB)
      Lcurdo=0
09805 IF(.NOT.(DCLASS(cs+1).EQ.Tsym(10)))GOTO09804
      Lcurdo=Lcurdo+1
      CS=UP(CS+1)
      VARLV(Lcurdo)=MCS(1)
      CNSYMB=CNSYMB+1
      MCS(1)=TEXT(CNSYMB)
      GOTO09805
09804 CONTINUE
      CNSYMB=CNSYMB-1
      IF(.NOT.(Lcurdo.EQ.0))GOTO09802
      NLoop=Ido
      GOTO09800
09802 CONTINUE
      IF(.NOT.(Lcurdo.EQ.3.AND.VARLV(1).EQ.ALL(1).AND.VARLV(2).EQ.ALL(2)
     *.AND.VARLV(3).EQ.ALL(3)))GOTO09801
      NLoop=1
      GOTO09800
09801 CONTINUE
      NLoop=0
      Foundo=.FALSE.
09799 IF(.NOT.(NLoop.LT.Ido.AND..NOT.Foundo))GOTO09798
      NLoop=NLoop+1
      IF(.NOT.(Pvardo(NLoop+1)-Pvardo(Nloop).EQ.Lcurdo))GOTO09796
      JP7=0
      Foundo=.TRUE.
      Kp7=Pvardo(Nloop)
09793 IF(.NOT.(JP7.LT.Lcurdo.AND.Foundo))GOTO09792
      JP7=JP7+1
      IF(VARLV(JP7).NE.VARDO(KP7))Foundo=.FALSE.
      Kp7=Kp7+1
      GOTO09793
09792 CONTINUE
09796 CONTINUE
      GOTO09799
09798 CONTINUE
      IF(.NOT.(.NOT.Foundo))GOTO09790
      WRITE(6,5049)CHLN,(VARLV(IJ),IJ=1,Lcurdo)
      WRITE(0,5049)CHLN,(VARLV(IJ),IJ=1,Lcurdo)
      GOTO09995
09790 CONTINUE
09800 CONTINUE
      SLoop=LoopSt(Nloop)
      IF(.NOT.(Blab.EQ.1))GOTO09787
      Leave(Nloop)=NLoop
      GOTO09786
09787 CONTINUE
      Iter(Nloop)=NLoop
      IF(State(Sloop).EQ.2)Blab=0
09786 CONTINUE
      SSPTR=SSPTR+1
      LABS(SSPTR)=LABS(SLOOP)-BLAB
      I6R001=13
      GOTO09993
09980 CONTINUE
      SSPTR=SSPTR-1
      GOTO09815
09836 CONTINUE
      Blab=2
      GOTO5051
      GOTO09815
09835 CONTINUE
      Jprog=14
      I6R001=1
      GOTO09993
09992 CONTINUE
      Ssptr=Ssptr-1
      GOTO09815
09834 CONTINUE
      CNSYMB=CNSYMB+1
      MCSYM(1)=TEXT(CNSYMB)
      NC=CSYMB
      Jprog=12
      I6R001=31
      GOTO09993
09962 CONTINUE
      CURLAB=Llab
      ICASE=0
      llab=llab-nc
      ssptr=ssptr+2*Nc
      STATE(SSPTR)=CSTACK
      Labs(Ssptr)=Llab
      SSPTR=SSPTR-1
      Jprog=13
09784 IF(.NOT.(ICASE.LT.NC))GOTO09783
      STATE(Ssptr)=CSTACK
      Labs(Ssptr)=CURLAB
      IF(ICASE.EQ.NC-1)Out(2,jprog)=21
      I6R001=32
      GOTO09993
09961 CONTINUE
      CURLAB=CURLAB-1
      ssptr=ssptr-1
      STATE(Ssptr)=CSTACK
      Labs(Ssptr)=Llab
      ssptr=ssptr-1
      ICASE=ICASE+1
      GOTO09784
09783 CONTINUE
      Out(2,jprog)=20
      ssptr=ssptr+2*Nc+1
      Llab=Llab-1
      GOTO09815
09833 CONTINUE
      Jprog=4
      I6R001=33
      GOTO09993
09960 CONTINUE
      Ssptr=Ssptr-1
      Jprog=14
      I6R001=34
      GOTO09993
09959 CONTINUE
      Ssptr=Ssptr-1
      GOTO09815
09832 CONTINUE
      Nproc=Stproc(Cproc)
      Cproc=Cproc-1
      Ncall=Nc1st(Nproc)
      Jprog=12
      I6R001=17
      GOTO09993
09976 CONTINUE
      SSPTR=SSPTR+1
      Jprog=13
09781 IF(.NOT.(Ncall.NE.0))GOTO09780
      Labs(ssptr)=Retlab(Ncall)
      IF(Nextc(Ncall).EQ.0)Out(2,jprog)=21
      I6R001=18
      GOTO09993
09975 CONTINUE
      Ncall=Nextc(Ncall)
      GOTO09781
09780 CONTINUE
      Out(2,jprog)=20
      SSPTR=SSPTR-1
      I2=7
09778 IF(.NOT.(Nproc.NE.0))GOTO09777
      I2=I2-1
      Wdig=Mod(Nproc,10)+Dig0
      RETRT(I2)=Mwdig(1)
      Nproc=Nproc/10
      GOTO09778
09777 CONTINUE
      IF(.NOT.(I2.GT.4))GOTO09775
      I2=I2-1
      DO09772I3=4,I2
      Wdig=Dig0
      RETRT(I3)=Mwdig(1)
09772 CONTINUE
09775 CONTINUE
      i2=1
09769 IF(.NOT.(i2.LE.6))GOTO09768
      MSw(1)=RetRt(i2)
      i2=i2+1
      Synt=7
      goto09999
3007  Continue
      GOTO09769
09768 CONTINUE
      Jprog=14
      I6R001=19
      GOTO09993
09974 CONTINUE
      Ssptr=Ssptr-1
      GOTO09815
09831 CONTINUE
      Jprog=15
      I6R001=35
      GOTO09993
09958 CONTINUE
      If(Fort)Numtxt=16
      GOTO09815
09830 CONTINUE
      Jprog=16
      I6R001=36
      GOTO09993
09957 CONTINUE
      Waitbr=.false.
      If(Fort)Plst(33)=9
      GOTO09815
09829 CONTINUE
      Ido=Ido+1
      LoopSt(Ido)=Ssptr
      Leave(Ido)=0
      Iter(Ido)=0
      Pvardo(Ido+1)=Cvardo
      Jprog=17
      I6R001=30
      GOTO09993
09963 CONTINUE
      GOTO09815
09828 CONTINUE
      IF(.NOT.(Iter(Ido).NE.0))GOTO09766
      Jprog=5
      I6R001=27
      GOTO09993
09966 CONTINUE
09766 CONTINUE
      Jprog=18
      I6R001=28
      GOTO09993
09965 CONTINUE
      Jprog=19
      IF(.NOT.(Leave(Ido).NE.0))GOTO09763
      Out(2,Jprog)=-2
      GOTO09762
09763 CONTINUE
      Out(2,Jprog)=0
09762 CONTINUE
      Cvardo=Pvardo(Ido)
      Ido=Ido-1
      I6R001=29
      GOTO09993
09964 CONTINUE
      Ssptr=Ssptr-1
      GOTO09815
09827 CONTINUE
      If(Fort)Numtxt=16
      GOTO09815
09826 CONTINUE
      Jprog=20
      I6R001=26
      GOTO09993
09967 CONTINUE
      Cvardo=Pvardo(Ido)
      Ido=Ido-1
      Ssptr=Ssptr-1
      GOTO09815
09825 CONTINUE
      IF(.NOT.(Iter(Ido).NE.0))GOTO09760
      Jprog=21
      I6R001=24
      GOTO09993
09969 CONTINUE
09760 CONTINUE
      Jprog=1
      I6R001=25
      GOTO09993
09968 CONTINUE
      GOTO09815
09824 CONTINUE
      CNSYMB=CNSYMB+1
      MCSYM(1)=TEXT(CNSYMB)
      NSEL=CSYMB
      LABSEL=Llab-NSEL
      CURLAB=LABSEL
      Labs(Ssptr)=CURLAB
      STATE(Ssptr)=CSTACK
      DO09757ISEL=1,NSEL
      CURLAB=CURLAB+1
      Ssptr=Ssptr+1
      STATE(Ssptr)=CSTACK
      Labs(Ssptr)=CURLAB
      Ssptr=Ssptr+1
      STATE(Ssptr)=CSTACK
      Labs(Ssptr)=LABSEL
      Ssptr=Ssptr+1
      STATE(Ssptr)=CSTACK
      Labs(Ssptr)=CURLAB
09757 CONTINUE
      Llab=LABSEL-1
      Jprog=15
      I6R001=23
      GOTO09993
09970 CONTINUE
      GOTO09815
09823 CONTINUE
      Ssptr=Ssptr-1
      Jprog=4
      I6R001=21
      GOTO09993
09972 CONTINUE
      Ssptr=Ssptr-1
      Jprog=14
      I6R001=22
      GOTO09993
09971 CONTINUE
      Ssptr=Ssptr-1
      GOTO09815
09822 CONTINUE
      Jprog=20
      I6R001=20
      GOTO09993
09973 CONTINUE
      Cvardo=Pvardo(Ido)
      Ido=Ido-1
      Ssptr=Ssptr-1
      GOTO09815
09821 CONTINUE
      Jprog=22
      I6R001=14
      GOTO09993
09979 CONTINUE
      Jprog=19
      IF(.NOT.(Leave(Ido).NE.0))GOTO09754
      Out(2,Jprog)=-2
      GOTO09753
09754 CONTINUE
      Out(2,Jprog)=0
09753 CONTINUE
      Cvardo=Pvardo(Ido)
      Ido=Ido-1
      I6R001=15
      GOTO09993
09978 CONTINUE
      Ssptr=Ssptr-1
      GOTO09815
09820 CONTINUE
      CNSYMB=CNSYMB+1
      MCSYM(1)=TEXT(CNSYMB)
      CNSYMB=CNSYMB+1
      MCSYM(2)=TEXT(CNSYMB)
      NPROC=CSYMB
      Cproc=Cproc+1
      STPROC(Cproc)=Nproc
      Jprog=18
      I6R001=16
      GOTO09993
09977 CONTINUE
      GOTO09815
09819 CONTINUE
      Jprog=1
      I6R001=2
      GOTO09993
09991 CONTINUE
      Ssptr=Ssptr-1
      GOTO09815
09818 CONTINUE
      If(Fort)Plst(33)=9
      IF(.NOT.(Waitbr.AND.Outcar(6).EQ.Tsym(1).AND.Wpos.EQ.16))GOTO09751
      DO09748Ipos=1,8
      Outcar(6+Ipos)=TXTS(45+Ipos)
09748 CONTINUE
      Posold=MAX0(Posold,15)
      Wpos=15
      Jprog=15
      I6R001=37
      GOTO09993
09956 CONTINUE
      If(Fort)Numtxt=16
      STATE(Ssptr)=6
      Ssptr=Ssptr+1
      STATE(Ssptr)=15
      GOTO09750
09751 CONTINUE
      Jprog=16
      I6R001=38
      GOTO09993
09955 CONTINUE
      If(Fort)Numtxt=16
09750 CONTINUE
      Waitbr=.false.
      GOTO09815
09817 CONTINUE
      If(Fort)Plst(33)=9
      IF(.NOT.(Waitbr.AND.Outcar(6).EQ.Tsym(1).AND.Wpos.EQ.16))GOTO09745
      Posold=MAX0(Posold,15)
      Wpos=7
      Wstate=1
      If(Cstack.EQ.4)STATE(Ssptr)=3
      Ssptr=Ssptr+1
      STATE(Ssptr)=15
      GOTO09744
09745 CONTINUE
      Jprog=6
      I6R001=39
      GOTO09993
09954 CONTINUE
      If(Fort)Numtxt=16
09744 CONTINUE
      Waitbr=.false.
      GOTO09815
09816 CONTINUE
      IF(.NOT.(Fort))GOTO09742
      MSW(1)=Tsym(20)
      SYNT=5
      Goto09999
      GOTO09741
09742 CONTINUE
      Goto09995
09741 CONTINUE
09815 CONTINUE
3005  Continue
      GOTO09854
09853 CONTINUE
09996 Continue
      GOTO09739
09953 CONTINUE
      IF(.NOT.(posold.GE.Wpos))GOTO09736
      DO09733I34=Wpos,Posold
      Outcar(I34)=Tsym(1)
09733 CONTINUE
09736 CONTINUE
      Posold=Wpos-1
      WRITE(*,5050)(OUTCAR(ii),ii=1,WPOS)
      WRITE(8,5050)(OUTCAR(ii),ii=1,WPOS)
      Wpos=1
      GOTO(09950,09949,09948,09947,09946,09945,09944),I6R002
09739 CONTINUE
      WSTATE=1
      Lnold=-1
      Posold=0
      Icont=1
09730 IF(.NOT.(WSTATE.NE.0))GOTO09729
      GOTO(09997,09998),Retwtr
09999 CONTINUE
      Wcl=WCLASS(SW+1,Spec)
09952 ISTATE=(WSTATE-1)*13+Wcl
      WP=PLST(ISTATE)
      WSTATE=WST(ISTATE)
      GOTO(09727,09726,09725,09724,09723,09722,09721,09720,09719,09718,0
     *9717,09716,09715,09714,09713,09712,09711,09710,09709,09708),Wp
      GOTO09707
09727 CONTINUE
      GOTO09707
09726 CONTINUE
      BOUTC=BLANK6
      Wpos=7
      GOTO09707
09725 CONTINUE
      WRITE(8,09994)CHLN
      Retcod=3
      GOTO09707
09724 CONTINUE
      WRITE(8,09994)CHLN
      Retcod=3
      I6R002=1
      GOTO09953
09950 CONTINUE
      GOTO09707
09723 CONTINUE
09706 IF(.NOT.(Wpos.LT.6))GOTO09705
      Outcar(Wpos)=Tsym(1)
      Wpos=Wpos+1
      GOTO09706
09705 CONTINUE
      Msw(1)=Tsym(1)
      GOTO09707
09722 CONTINUE
      I6R002=2
      GOTO09953
09949 CONTINUE
      GOTO09707
09721 CONTINUE
      DO09703I344=1,5
      Outcar(i344)=Tsym(1)
09703 CONTINUE
      Outcar(6)=Tsym(10)
      Wpos=7
      GOTO09707
09720 CONTINUE
      WRITE(8,09994)CHLN
      Retcod=3
      DO09700I344=Wpos,80
      Outcar(i344)=Tsym(1)
09700 CONTINUE
      Wpos=73
      GOTO09707
09719 CONTINUE
      If(Wpos.EQ.73)goto09951
      GOTO09707
09718 CONTINUE
      Icont=1
      Fort=.true.
      Plst(1)=1
      Wst(1)=2
      Plst(2)=18
      Plst(6)=19
      Plst(7)=0
      Wst(7)=1
      Plst(15)=6
      Plst(19)=9
      Wst(19)=3
      WRITE(8,5060)Fortio
      GOTO09707
09717 CONTINUE
      Icont=1
      Fort=.false.
      Plst(1)=1
      Wst(1)=2
      Plst(2)=0
      Plst(6)=2
      Plst(7)=Plst(6)
      Wst(7)=3
      Plst(15)=4
      Plst(19)=4
      Wst(19)=1
      WRITE(8,5060)Trefio
      GOTO09707
09716 CONTINUE
      Icont=2
      Fort=.false.
      Plst(1)=0
      Wst(1)=3
      Plst(2)=18
      DO09697i=73,80
      Outcar(i)=Tsym(1)
09697 CONTINUE
      Plst(6)=Plst(1)
      Plst(7)=Plst(6)
      Wst(7)=1
      GOTO09707
09715 CONTINUE
      Outcar(1)=Tsym(27)
      Wpos=2
      GOTO09707
09714 CONTINUE
      IF(.NOT.(Waitbr.AND.Wpos.EQ.16))GOTO09694
      Icont=3
      DO09691i=1,15
      Savcar(i)=Outcar(i)
09691 CONTINUE
      GOTO09693
09694 CONTINUE
      Waitbr=.false.
      I6R002=3
      GOTO09953
09948 CONTINUE
09693 CONTINUE
      Outcar(1)=Tsym(27)
      Wpos=2
      GOTO09707
09713 CONTINUE
      I6R002=4
      GOTO09953
09947 CONTINUE
      Outcar(1)=Tsym(27)
      Wpos=2
      GOTO09707
09712 CONTINUE
09951 GOTO(09688,09687,09686),Icont
      GOTO09685
09688 CONTINUE
      I6R002=5
      GOTO09953
09946 CONTINUE
      DO09684I344=1,5
      Outcar(i344)=Tsym(1)
09684 CONTINUE
      Outcar(6)=Tsym(10)
      Wpos=7
      GOTO09685
09687 CONTINUE
      Mwdig(1)=Outcar(80)
      Outcar(80)=Symcon
      I6R002=6
      GOTO09953
09945 CONTINUE
      Outcar(1)=Mwdig(1)
      Wpos=2
      GOTO09685
09686 CONTINUE
      I6R002=7
      GOTO09953
09944 CONTINUE
      DO09681i=1,15
      Outcar(i)=Savcar(i)
09681 CONTINUE
      Icont=1
      Wpos=16
09685 CONTINUE
      GOTO09707
09711 CONTINUE
      Wcl=2
      Spec=2
      goto09952
      GOTO09707
09710 CONTINUE
      Wpos=1
      GOTO09707
09709 CONTINUE
      IF(.NOT.(Numtxt.GT.0))GOTO09678
      BOUTC=BLANK6
      Wpos=7
      Numtxt=0
09678 CONTINUE
      GOTO09707
09708 CONTINUE
      Spec=2
09707 CONTINUE
      GOTO(09675,09674),Spec
      GOTO09673
09675 CONTINUE
      Outcar(Wpos)=Msw(1)
      Wpos=Wpos+1
      GOTO09673
09674 CONTINUE
      Spec=1
09673 CONTINUE
      GOTO09730
09729 CONTINUE
      RETURN
5060  FORMAT(A40)
5050  FORMAT(80A1)
09994 FORMAT('CERROR(',I4,') Syntactical or Alias error')
5049  FORMAT(' In NODE beginning in line:',i4,' LEAVE or ITERATE failed 
     *for: ',80A1)
2998  FORMAT(' In NODE beginning in line:',i4,' not defined  ALIAS @',80
     *A1)
2997  FORMAT(' In NODE beginning in line:',i4,' recursion in ALIAS @',80
     *A1)
2999  FORMAT(' No design for the NODE requested in',' line:',I4,' Node n
     *umber:',I3,'  with local index: ',80A1)
      END
