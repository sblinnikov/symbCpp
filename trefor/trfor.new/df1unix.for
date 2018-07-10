      SubroutineDTCF1(ntr,cardn)
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
      Integer*2Dig0,Dig9,Colon,Zero/0/
      Integer*4Remlab
      Integer*2C
      Character*1CL2(2)
      Equivalence(C,CL2(1))
      Character*1Mark
      Character*1Card(80),DIAGN(34)
      Integer*2CardN,LinReq
      Integer*2RDR,ANLS
      IntegerIdiag/0/
      Integer*2ifn/0/
      Integer*2Incl00/0/
      Character*1Fn(80),FBlank(6)/6*' '/
      Character*1Deftyp(7)/'I','N','C','L','U','D','E'/
      CHARACTER*40FNINCL
      EQUIVALENCE(Fn(1),FNINCL)
      LogicalCompl
      Integer*2Oldlst(5),Lsts
      Character*1Lstyes/'S'/,Lstno/'N'/
      LogicalList/.False./,Fort/.False./,Pascal/.False./,Oldlis(5),Lists
      IntegerEndin/0/
      Integer*2IRDR
      Integer*2SR
      Character*1LSR(2)
      Equivalence(SR,LSR)
      Integer*2Nproc/0/,Iproc,Ncall/0/,Ret(32)/32*0/,Lastc(32)
      Integer*2Ndefpr(32),Lalias,INR,Rf
      LogicalGfound,Wspec,Outcom,Lproc/.false./,Lcall/.false./
      Character*1Tmess(54)/'T','M','E','S','S','A','G','E',' ','''','<',
     *'-','-','L','e','a','v','i','n','g',' ',' ','N','o','d','e',' ','T
     *','M','E','S','S','A','G','E',' ','''','-','-','>','E','n','t','e'
     *,'r','i','n','g',' ','N','o','d','e',' '/
      Character*1Retl(4)/'R','E','T','_'/,Conl(9)/':','C','O','N','T','I
     *','N','U','E'/,LGOTO(4)/'G','O','T','O'/
      Character*1Hcard(80),Trace,OFFTRC/'O'/
      Character*1Tnode(512)/512*'-'/,Opcon(512)
      Character*1Lastch/' '/
      Integer*2Nwords/0/,Enter,TTRbeg,TTRend
      Integer*2Jcase/0/
      Integer*4LTEXT,Begnam,NUM,LCASE(20),Lalias1
      Integer*2LSLSL,C1,C2,CC,CNODE,LNODES
      Character*1SLSL(16),MC2(2)
      Integer*2NCASE(20),NCOMEN/0/
      EQUIVALENCE(C2,MC2(1))
      Integer*2S,P,Sclass,Sinit
      Integer*2PP(360)/0,4,1,10,28,2,2,36,10,10,3,10,2,2,2,19,10,10,3,0,
     *0,5,1,10,3,2,6,36,10,10,3,10,2,2,2,19,10,10,3,0,7,0,7,7,8,9,9,7,7,
     *7,7,7,7,7,7,7,7,7,7,7,11,11,11,11,11,11,11,11,15,11,11,12,0,11,11,
     *11,11,11,11,11,0,2,2,10,3,2,2,36,10,10,3,10,2,2,2,19,10,10,3,0,26,
     *26,26,26,13,26,26,35,26,26,26,26,26,26,26,26,26,26,26,0,11,11,11,1
     *5,11,11,11,11,11,11,11,14,11,11,11,11,11,11,11,11,11,11,11,14,11,1
     *1,11,11,12,11,11,15,11,11,11,11,11,11,11,11,31,34,31,31,17,34,34,3
     *1,31,31,31,31,31,18,31,31,31,31,31,31,11,11,11,11,11,11,11,11,37,1
     *1,11,16,11,11,11,11,11,11,11,11,0,0,0,0,17,0,0,0,0,0,0,0,0,0,0,0,2
     *3,0,0,0,26,26,26,26,17,26,26,26,26,26,26,26,26,26,26,26,23,26,26,2
     *6,30,30,30,30,17,30,30,30,25,30,30,30,30,30,30,30,24,30,30,30,20,2
     *,2,20,20,2,2,20,20,20,20,20,20,20,20,20,20,20,20,20,22,22,22,22,22
     *,22,22,22,22,22,22,22,21,22,22,22,22,22,22,22,11,11,11,11,11,11,11
     *,11,11,11,11,11,11,11,11,11,11,27,11,11,26,26,26,26,29,26,26,26,26
     *,26,26,26,26,26,26,26,26,26,29,29,0,32,32,32,33,32,32,32,32,32,32,
     *32,32,32,32,32,32,32,33,33/
      Integer*2SS(360)/1,2,3,4,0,5,5,6,7,8,1,10,1,1,1,14,15,16,1,1,1,2,3
     *,4,0,5,1,6,7,8,1,10,1,1,1,14,15,16,1,2,1,3,1,1,1,3,3,1,1,1,1,1,1,1
     *,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,9,1,1,1,1,1,1,1,1,5,5,4,0,5,5
     *,6,7,8,1,10,1,1,1,14,15,16,1,1,6,6,6,6,1,6,6,6,6,6,6,6,6,6,6,6,6,6
     *,6,6,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
     *,1,1,1,1,1,1,1,1,1,11,9,11,11,1,9,9,11,11,11,11,11,13,11,11,11,11,
     *11,11,11,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,11,11,11,11,1,11,
     *11,11,11,11,11,11,13,11,11,11,11,11,11,11,12,12,12,12,1,12,12,12,1
     *2,12,12,12,13,12,12,12,12,12,12,12,11,11,11,11,1,11,11,11,11,11,11
     *,11,13,11,11,11,11,11,11,11,1,14,14,1,1,14,14,1,1,1,1,1,1,1,1,1,1,
     *1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,11,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
     *,1,1,1,1,1,1,1,1,1,1,17,17,17,17,1,17,17,17,17,17,17,17,17,17,17,1
     *7,17,17,17,1,18,18,18,18,1,18,18,18,18,18,18,18,18,18,18,18,18,18,
     *1,1/
      Integer*2RFF(360)/0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
     *1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,1,1,1,1,1,1,1,1,1,1,
     *1,1,0,0,1,1,1,1,1,1,1,0,1,1,0,0,1,1,1,1,1,1,0,0,0,0,0,1,0,0,0,0,0,
     *0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,
     *0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,0,0,1,1,0,1,1,1,1,0,1,1,0,1,1,1,1,
     *1,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,1,1,1,1,1,0,
     *1,1,0,1,1,1,1,1,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
     *0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,
     *0,0,0,0,0,1,0,0,1,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,
     *1,1,1,1,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,0,0,
     *0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,
     *0,0,0,0,0,0/
      Integer*2PPind(10)/1,0,0,3,6,2,4,5,3,0/,SSind(10)/0,2,1,0,1,2,0,0,
     *0,2/
      Integer*2Ip7,Lp7,Cind(80)
      Integer*4Jp7,KP7,Ipw,kkk,i
      INTEGER*2TCLASS(256)/5,5,15,15,15,15,15,15,15,15,15,15,15,20,15,15
     *,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,1,11,8,15,15,15,1
     *1,8,15,15,13,15,15,18,15,17,2,2,2,2,2,2,2,2,2,2,14,11,4,12,9,6,16,
     *6,6,6,6,6,6,6,7,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,11,15,11,10,3,
     *15,6,6,6,6,6,6,6,7,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,15,15,15,15
     *,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15
     *,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15
     *,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15
     *,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15
     *,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15
     *,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15/
      INTEGER*2TCC(256)/1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
     *0,0,0,0,0,0,0,0,0,12,0,0,0,0,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
     *0,0,0,35,6,0,5,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
     *,0,0,66,0,67,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
     *0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
     *0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
     *0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
     *0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
     *0,0,0,0/
      INTEGER*2REFSW(64)/1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,3,3,4,5,5,5,5,5,5
     *,6,7,8,8,9,10,11,11,11,12,13,14,14,14,14,14,14,14,14,14,14,14,14,1
     *4,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14/,SLCODE(64)/14,1
     *5,16,17,18,19,20,21,22,24,27,28,30,23,29,26,31,25,3,3,3,3,36,32,33
     *,36,36,36,37,38,39,39,39,36,36,36,36,36,36,36,36,36,36,36,36,36,36
     *,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36/,ORDER(64)/1,2
     *,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,
     *27,28,29,30,31,32,33,34,35,36,36,36,36,36,36,36,36,36,36,36,36,36,
     *36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36/,PSLSL(65)/1,3,5,7
     *,9,13,17,22,27,34,36,42,47,52,56,62,66,69,69,75,80,87,92,98,102,10
     *8,112,119,127,134,140,146,150,151,158,166,175,175,175,175,175,175,
     *175,175,175,175,175,175,175,175,175,175,175,175,175,175,175,175,17
     *5,175,175,175,175,175,175/
      Character*1TSLSL(1024)/'D','O','O','D','I','F','F','I','T','H','E'
     *,'N','E','L','S','E','W','H','I','L','E','L','E','A','V','E','I','
     *T','E','R','A','T','E','O','F','R','E','P','E','A','T','U','N','T'
     *,'I','L','O','T','H','E','R','C','A','S','E','S','E','L','E','C','
     *T','E','S','A','C','E','N','D','D','E','F','I','N','E','L','A','B'
     *,'E','L','D','E','F','L','I','S','T','T','R','A','C','E','O','U','
     *T','C','O','M','P','R','O','C','R','E','T','U','R','N','C','A','L'
     *,'L','I','N','C','L','U','D','E','I','N','C','L','U','D','E','N','
     *F','O','R','T','R','A','N','T','R','E','F','O','R','P','A','S','C'
     *,'A','L','R','E','X','X','C','O','N','P','R','I','N','T','O','F','
     *F','P','R','I','N','T','E','N','D','O','F','T','R','E','E',850*' '
     */
      Character*1Diagn2(34)
      Integer*2Ipk1,Cpk1
      Logicalntr,Erhead,Foundk,Found,Found7,Refnfn/.False./
      Integer*2Areq,Enhead,Path,RPath,Nhead
      Integer*2Ison,Cson
      Integer*2Sals,Pals,C3,Iclass,Lroot,Pos,Alsrf
      Integer*4Ltxdef,Ltextd
      Character*1Posald(4)
      Equivalence(Posald(1),Ltextd)
      Character*1cl3(2)
      Equivalence(cl3(1),c3)
      Character*1Root(80),Droot(6)/'Z','0','0','0','0','0'/,SQuote,SQuot
     *e2,OSrdr
      LogicalDefr/.false./
      INTEGER*2ACLASS(256)/3,3,8,8,8,8,8,8,8,8,8,8,8,1,8,8,8,8,8,8,8,8,8
     *,8,8,8,8,8,8,8,8,8,1,8,2,8,8,8,8,2,8,8,8,8,7,6,8,8,5,5,5,5,5,5,5,5
     *,5,5,8,8,8,8,8,5,4,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5
     *,5,5,8,8,8,8,5,8,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5
     *,5,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8
     *,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8
     *,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8
     *,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8
     *,8,8/
      Integer*2PPals(88)/1,9,9,2,9,0,9,9,3,3,9,4,5,4,4,4,1,7,9,0,0,0,0,0
     *,6,0,6,0,0,0,0,0,0,8,6,0,0,0,0,0,1,9,9,2,9,0,9,9,10,10,10,10,5,10,
     *10,10,1,9,9,11,12,0,9,9,1,9,9,2,12,0,9,9,1,9,9,2,9,0,1,9,13,13,13,
     *13,5,13,13,13/
      Integer*2SSals(88)/1,0,0,2,0,1,0,0,3,5,0,4,2,4,4,4,3,5,0,4,4,4,4,4
     *,1,4,0,4,4,4,4,4,5,5,0,5,5,5,5,5,6,0,0,7,0,6,0,0,6,0,0,0,7,6,6,0,8
     *,0,0,11,9,8,0,0,10,0,0,11,9,10,0,0,10,0,0,11,0,10,10,0,10,0,0,0,11
     *,10,10,0/
      GOTO09977
09989 CONTINUE
      Lp7=0
      Found7=.false.
09974 IF(.NOT.(Lp7.LT.Numsw.AND..NOT.Found7))GOTO09973
      Lp7=Lp7+1
      IF(.NOT.(Lslsl.EQ.Pslsl(Lp7+1)-Pslsl(Lp7)))GOTO09971
      Jp7=0
      Found7=.True.
      KP7=Pslsl(Lp7)
09968 IF(.NOT.(Jp7.LT.Lslsl.AND.Found7))GOTO09967
      Jp7=Jp7+1
      Cl2(1)=Slsl(Jp7)
      c=Up(c+1)
      Found7=Cl2(1).EQ.TSlsl(KP7)
      KP7=KP7+1
      GOTO09968
09967 CONTINUE
09971 CONTINUE
      GOTO09974
09973 CONTINUE
      Lp7=Order(Lp7)
      Ip7=Refsw(Lp7)
      GOTO(09986,09983),I6R001
09977 CONTINUE
      GOTO09965
09988 CONTINUE
      Ipw=7
09962 IF(.NOT.(INR.NE.0))GOTO09961
      Ipw=Ipw-1
      C2=Mod(INR,10)+Dig0
      RETRT(Ipw)=Mc2(1)
      INR=INR/10
      GOTO09962
09961 CONTINUE
      GOTO(09985,09982),I6R002
09965 CONTINUE
      GOTO09959
09987 CONTINUE
      C2=4
      c3=14
      text(ltext)=CL3(1)
      ltext=ltext+1
      text(ltext)=Mc2(1)
      ltext=ltext+1
      C3=Alsprc
      TEXT(Ltext)=CL3(1)
      TEXT(Ltext+1)=CL3(2)
      Ltext=Ltext+2
      TTRbeg=1+27*Enter
      TTREnd=27*(Enter+1)
      DO09956I=TTRbeg,TTRend
      TEXT(Ltext)=Tmess(I)
      Ltext=Ltext+1
09956 CONTINUE
      DO09953I=1,Nhead
      TEXT(Ltext)=HCard(I)
      Ltext=Ltext+1
09953 CONTINUE
      TEXT(Ltext)=Tsym(7)
      Ltext=Ltext+1
      C2=42
      c3=14
      text(ltext)=CL3(1)
      ltext=ltext+1
      text(ltext)=Mc2(1)
      ltext=ltext+1
      C2=35
      c3=14
      text(ltext)=CL3(1)
      ltext=ltext+1
      text(ltext)=Mc2(1)
      ltext=ltext+1
      GOTO(09984,09979),I6R003
09959 CONTINUE
      List=.True.
      Fort=.False.
      Pascal=.False.
      Incl00=0
      ntr=.False.
      Numsw=36
      i=36
09950 CONTINUE
      IRC=-1
      IF(IRC.NE.0)GOTO09994
      If(i.EQ.36)Write(6,09992)
      j=1
09947 IF(.NOT.(card(j).EQ.Tsym(1)))GOTO09946
      j=j+1
      GOTO09947
09946 CONTINUE
      If(card(j).EQ.Tsym(6))j=j+1
      lslsl=0
09944 IF(.NOT.(card(j).NE.Tsym(1).AND.Lslsl.LT.16))GOTO09943
      Cl2(1)=card(j)
      c=Up(c+1)
      lslsl=lslsl+1
      Slsl(lslsl)=Cl2(1)
      j=j+1
      GOTO09944
09943 CONTINUE
      IF(.NOT.(Card(j).EQ.Tsym(1)))GOTO09941
      I6R001=1
      GOTO09989
09986 CONTINUE
      IF(.NOT.(Found7))GOTO09938
09935 IF(.NOT.(card(j).EQ.Tsym(1)))GOTO09934
      j=j+1
      GOTO09935
09934 CONTINUE
      If(card(j).EQ.Tsym(6))j=j+1
      lslsl=0
09932 IF(.NOT.(card(j).NE.Tsym(1).AND.Lslsl.LT.16))GOTO09931
      Cl2(1)=card(j)
      c=Up(c+1)
      lslsl=lslsl+1
      Slsl(lslsl)=Cl2(1)
      j=j+1
      GOTO09932
09931 CONTINUE
      i=i+1
      Pslsl(i+1)=Pslsl(i)+Lslsl
      Order(I)=Lp7
      DO09929j=1,Lslsl
      Tslsl(Pslsl(i)+j-1)=Slsl(j)
09929 CONTINUE
      write(6,09995)CARD
      GOTO09948
09938 CONTINUE
09941 CONTINUE
      write(6,09993)card
      write(0,09993)card
09948 CONTINUE
      GOTO09950
09994 Numsw=i
      Rdr=1
      Anls=1
      Goto2000
1000  Goto(1001,1002,1003),RDR
1001  CONTINUE
      Endin=0
09926 IF(.NOT.(Endin.EQ.0))GOTO09925
      IF(Incl00.EQ.0)THEN
      READ(7,09995,IOSTAT=ENDIN)CARD
      ELSE
      READ(INCL00,09995,IOSTAT=ENDIN)CARD
      ENDIF
      IF(ENDIN.EQ.0)THEN
      LCARD=80
09923 IF(.NOT.(CARD(LCARD).EQ.Tsym(1).AND.Lcard.GT.1))GOTO09922
      LCARD=LCARD-1
      GOTO09923
09922 CONTINUE
      ENDIF
      Cardn=Cardn+1
09920 IF(.NOT.((Card(1).NE.Tsym(3).OR.NCOMEN.NE.0).AND.Endin.EQ.0))GOTO0
     *9919
      IRDR=1
      Sr=13
      Lcard=Lcard+1
      Card(Lcard)=Lsr(1)
      IF(.NOT.(Fort.AND.(Card(1).EQ.Tsym(27).OR.Card(1).EQ.Tsym(10))))GO
     *TO09917
      LSR(1)=Tsym(2)
      Alsrf=1
      RDR=2
      Goto2000
09917 CONTINUE
09914 IF(.NOT.(IRDR.LE.LCard))GOTO09913
      LSR(1)=Card(IRDR)
      RDR=2
      Goto2000
1002  IRDR=IRDR+1
      GOTO09914
09913 CONTINUE
      Card(Lcard)=Tsym(1)
      Lcard=Lcard-1
      GOTO(09911,09910,09909),Idiag
      IF(List.AND.Lst.EQ.1)WRITE(6,1997)Cardn,Mark,(Card(ii),ii=1,Lcard)
      GOTO09908
09911 CONTINUE
      WRITE(6,1997)Cardn,Mark,Card,Diagn
      Idiag=0
      GOTO09908
09910 CONTINUE
      WRITE(0,1997)Cardn,Mark,Card,Diagn
      Idiag=0
      WRITE(6,09996)Card,Diagn
      GOTO09908
09909 CONTINUE
      WRITE(0,1997)Cardn,Mark,Card,Diagn
      Idiag=0
      WRITE(6,1997)Cardn,Mark,Card,Diagn
09908 CONTINUE
      IF(Incl00.EQ.0)THEN
      READ(7,09995,IOSTAT=ENDIN)CARD
      ELSE
      READ(INCL00,09995,IOSTAT=ENDIN)CARD
      ENDIF
      IF(ENDIN.EQ.0)THEN
      LCARD=80
09907 IF(.NOT.(CARD(LCARD).EQ.Tsym(1).AND.Lcard.GT.1))GOTO09906
      LCARD=LCARD-1
      GOTO09907
09906 CONTINUE
      ENDIF
      Cardn=Cardn+1
      GOTO09920
09919 CONTINUE
      IF(.NOT.(Endin.EQ.0))GOTO09904
      SR=1
      RDR=3
      Goto2000
1003  CONTINUE
      Lcard1=Lcard+1
      DO09901I=LCard1,80
      Card(I)=Tsym(2)
09901 CONTINUE
      WRITE(6,1998)Cardn,Mark,Card,Diagn
      IF(.NOT.(Idiag.GT.0))GOTO09898
      WRITE(0,1998)Cardn,Mark,Card,Diagn
      Idiag=0
09898 CONTINUE
      GOTO09903
09904 CONTINUE
      IF(.NOT.(Incl00.EQ.0))GOTO09895
      SR=0
      Goto2000
      GOTO09894
09895 CONTINUE
      List=Oldlis(Incl00)
      Lst=Oldlst(Incl00)
      Close(Incl00)
      Incl00=Incl00-1
      cardn=cardn-1
      write(6,09990)Incl00
      Endin=0
      if(Incl00.EQ.0)Mark=Tsym(1)
09894 CONTINUE
09903 CONTINUE
      GOTO09926
09925 CONTINUE
2000  Goto(2001,2002,2003,2004,2005,2006,2007,2008,2009),ANLS
2001  Mark=Tsym(1)
      Cl2(1)=Tsym(3)
      Lind(1)=C
      Cl2(1)=Tsym(18)
      Dig0=C
      Cl2(1)=Tsym(24)
      Dig9=C
      Cl2(1)=Tsym(4)
      Colon=C
      Cnode=1
      Lnodes=2
      Ltext=1
      Atext(1)=1
      Ason(1)=2
      Nofson(1)=0
      Headln(1)=0
      Plind(1)=1
      Plind(2)=2
      Clind=2
      Tnode(1)=Tsym(2)
      Trace=Tsym(2)
      Outcom=.false.
      Opcon(1)=Tsym(2)
      Defr=.false.
      Alspre(1)=0
      Alsprc=0
      Alsrf=0
      Sals=0
      Calias=1
      Palias(1)=1
      Ndef=1
      Wspec=.false.
      Lastch=Tsym(1)
      ANLS=2
      Goto1000
2002  CONTINUE
09892 IF(.NOT.(SR.NE.0))GOTO09891
      S=1
09889 IF(.NOT.(S.NE.0))GOTO09888
      IF(.NOT.(Sals.NE.0))GOTO09886
      IF(.NOT.(AlsRf.EQ.1))GOTO09883
      Talfin(Ndef)=Ltext
      Ndef=Ndef+1
      AlsRf=0
      LSR(1)=OSrdr
09883 CONTINUE
2008  Continue
      Iclass=Aclass(SR+1)
      Ips=(Sals-1)*8+Iclass
      Pals=PPals(Ips)
      Sals=SSals(Ips)
      GOTO(09880,09879,09878,09877,09876,09875,09874,09873,09872,09871,0
     *9870,09869,09868),Pals
      GOTO09867
09880 CONTINUE
      Anls=8
      goto1000
      GOTO09867
09879 CONTINUE
      Alpred(Ndef)=Alsprc
      Alsprc=Ndef
      Anls=8
      goto1000
      GOTO09867
09878 CONTINUE
      Palias(Ndef+1)=Calias
      Talbeg(Ndef)=Ltext
      If(Iclass.EQ.2)SQuote=LSR(1)
      Anls=8
      goto1000
      GOTO09867
09877 CONTINUE
      Palias(Ndef+1)=Calias
      Talbeg(Ndef)=Ltext
      GOTO09867
09876 CONTINUE
      C3=UP(SR+1)
      Nalias(Calias)=Cl3(1)
      Calias=Calias+1
      Anls=8
      goto1000
      GOTO09867
09875 CONTINUE
      OSrdr=LSR(1)
      LSR(1)=Tsym(1)
      AlsRf=1
      GOTO09867
09874 CONTINUE
      SQuote=LSR(1)
      Anls=8
      goto1000
      GOTO09867
09873 CONTINUE
      IF(.NOT.(SQuote.EQ.LSR(1)))GOTO09866
      OSrdr=Tsym(1)
      LSR(1)=Tsym(1)
      AlsRf=1
      Sals=1
09866 CONTINUE
      GOTO09867
09872 CONTINUE
09998 Ltextd=Ltext
      TEXT(Ltxdef)=Posald(1)
      TEXT(Ltxdef+1)=Posald(2)
      TEXT(Ltxdef+2)=Posald(3)
      TEXT(Ltxdef+3)=Posald(4)
      IF(.NOT.(lproc))GOTO09863
      S=14
      GOTO09862
09863 CONTINUE
      S=1
09862 CONTINUE
      If(Fort.AND.LSR(1).EQ.Tsym(8))LSR(1)=Tsym(1)
      GOTO09867
09871 CONTINUE
      Palias(Ndef+1)=Calias
      Talbeg(Ndef)=Ltext
      Remlab=Llab
      DO09860isamp=1,5
      c2=Remlab/10000
      Remlab=Mod(Remlab,10000)*10
      c2=c2+Dig0
      text(ltext)=Mc2(1)
      ltext=ltext+1
09860 CONTINUE
      Llab=Llab-1
      Talfin(Ndef)=Ltext
      Ndef=Ndef+1
      IF(.NOT.(lproc))GOTO09857
      Sals=0
      DO09854i=1,4
      Nalias(Calias)=RETL(i)
      Calias=Calias+1
09854 CONTINUE
      i=Palias(Ndef-1)
09851 IF(.NOT.(i.LT.Palias(Ndef)))GOTO09850
      Nalias(calias)=Nalias(i)
      Calias=Calias+1
      i=i+1
      GOTO09851
09850 CONTINUE
      Ndefpr(Nproc)=Ndef-1
      Palias(Ndef+1)=Calias
      Talbeg(Ndef)=Ltext
      Alpred(Ndef)=Alsprc
      INR=Nproc
      I6R002=1
      GOTO09988
09985 CONTINUE
      IF(.NOT.(Ipw.GT.4))GOTO09848
      Ipw=Ipw-1
      DO09845I=4,Ipw
      C2=Dig0
      RETRT(I)=Mc2(1)
09845 CONTINUE
09848 CONTINUE
      DO09842I=1,6
      TEXT(Ltext+I-1)=RETRT(I)
09842 CONTINUE
      Ltext=Ltext+6
      Alsprc=Ndef
      Talfin(Ndef)=Ltext
      Ndef=Ndef+1
      IF(.NOT.(Nc1st(Nproc).EQ.0))GOTO09839
      Nc1st(Nproc)=256
      Retlab(256)=Llab
09839 CONTINUE
09857 CONTINUE
      If(Sals.EQ.0)goto09998
      GOTO09867
09870 CONTINUE
      DO09836Lroot=1,6
      Root(Lroot)=Droot(Lroot)
09836 CONTINUE
      Lroot=6
      Alpred(Ndef)=Alsprc
      Alsprc=Ndef
      Defr=.true.
      Anls=8
      goto1000
      GOTO09867
09869 CONTINUE
      Lroot=Lroot+1
      Root(Lroot)=LSR(1)
      GOTO09867
09868 CONTINUE
      Palias(Ndef+1)=Calias
      Talbeg(Ndef)=Ltext
      DO09833Pos=1,Lroot
      TEXT(Ltext)=Root(Pos)
      Ltext=Ltext+1
09833 CONTINUE
      IF(.NOT.(Sals.NE.0.OR.Defr))GOTO09830
      Pos=Lroot
      Mc2(1)=Root(Pos)
09827 IF(.NOT.(C2.EQ.Dig9.AND.Pos.GT.1))GOTO09826
      C3=Dig0
      Root(Pos)=Cl3(1)
      Pos=Pos-1
      Mc2(1)=Root(Pos)
      GOTO09827
09826 CONTINUE
      IF(.NOT.(C2.GE.Dig0.AND.C2.LT.Dig9))GOTO09824
      C2=C2+1
      Root(Pos)=Mc2(1)
      GOTO09823
09824 CONTINUE
      CallDtcdia(Diagn,15,Zero,Idiag,Retcod)
      Sals=0
09823 CONTINUE
09830 CONTINUE
      Talfin(Ndef)=Ltext
      Ndef=Ndef+1
      IF(.NOT.(Sals.EQ.0.AND.Defr))GOTO09821
      Defr=.false.
      DO09818Lroot=1,6
      DRoot(Lroot)=Root(Lroot)
09818 CONTINUE
09821 CONTINUE
      Goto09998
09867 CONTINUE
09886 CONTINUE
      Sclass=Tclass(SR+1)
      CC=TCC(SR+1)
      IPS=(S-1)*20+Sclass
      P=PP(IPS)
      S=SS(IPS)
      RF=RFF(IPS)
      GOTO(09815,09814,09813,09812,09811,09810,09809,09808,09807,09806,0
     *9805,09804,09803,09802,09801,09800,09799,09798,09797,09796,09795,0
     *9794,09793,09792,09791,09790,09789,09788,09787,09786,09785,09784,0
     *9783,09782,09781,09780,09779),P
      GOTO09778
09815 CONTINUE
      Lslsl=0
      GOTO09778
09814 CONTINUE
      C=SR
      Text(ltext)=LSR(1)
      ltext=ltext+1
      GOTO09778
09813 CONTINUE
      C2=CC
      c3=14
      text(ltext)=CL3(1)
      ltext=ltext+1
      text(ltext)=Mc2(1)
      ltext=ltext+1
      GOTO09778
09812 CONTINUE
      NUM=SR-Dig0
      C2=SR
      text(ltext)=Mc2(1)
      ltext=ltext+1
      GOTO09778
09811 CONTINUE
      NUM=NUM*10+SR-Dig0
      C2=SR
      text(ltext)=Mc2(1)
      ltext=ltext+1
      GOTO09778
09810 CONTINUE
09777 IF(.NOT.(NUM.GT.0.AND.SR.NE.0.AND.SR.NE.1))GOTO09776
      C2=SR
      text(ltext)=Mc2(1)
      ltext=ltext+1
      ANLS=4
      Goto1000
2004  NUM=NUM-1
      GOTO09777
09776 CONTINUE
      IF(.NOT.(SR.EQ.0.OR.SR.EQ.1))GOTO09774
      RF=1
      WRITE(6,1995)
      RETCOD=3
      WRITE(0,1995)
      GOTO09773
09774 CONTINUE
      C2=SR
      text(ltext)=Mc2(1)
      ltext=ltext+1
09773 CONTINUE
      GOTO09778
09809 CONTINUE
09999 I6R001=2
      GOTO09989
09983 CONTINUE
      IF(.NOT.(FOUND7))GOTO09771
      c2=Slcode(Lp7)
      GOTO(09768,09767,09766,09765,09764,09763,09762,09761,09760,09759,0
     *9758,09757,09756,09755),Ip7
      GOTO09754
09768 CONTINUE
      c3=14
      text(ltext)=CL3(1)
      ltext=ltext+1
      text(ltext)=Mc2(1)
      ltext=ltext+1
      GOTO09754
09767 CONTINUE
      c3=14
      text(ltext)=CL3(1)
      ltext=ltext+1
      text(ltext)=Mc2(1)
      ltext=ltext+1
      Jcase=jcase+1
      Ncase(jcase)=0
      Lcase(Jcase)=ltext
      ltext=ltext+1
      GOTO09754
09766 CONTINUE
      c3=14
      text(ltext)=CL3(1)
      ltext=ltext+1
      text(ltext)=Mc2(1)
      ltext=ltext+1
      IF(.NOT.(Jcase.GT.0))GOTO09753
      c2=Ncase(jcase)
      text(lcase(jcase))=Mc2(1)
      jcase=jcase-1
      GOTO09752
09753 CONTINUE
      CallDtcdia(Diagn,9,Zero,idiag,retcod)
09752 CONTINUE
      GOTO09754
09765 CONTINUE
      c3=14
      text(ltext)=CL3(1)
      ltext=ltext+1
      text(ltext)=Mc2(1)
      ltext=ltext+1
      Ncase(jcase)=Ncase(jcase)+1
      GOTO09754
09764 CONTINUE
      IF(.NOT.(Sals.EQ.0))GOTO09750
      Ip77=Lp7-18
      GOTO(09747,09746,09745,09744,09743,09742),Ip77
      GOTO09741
09747 CONTINUE
      c3=14
      text(ltext)=CL3(1)
      ltext=ltext+1
      text(ltext)=Mc2(1)
      ltext=ltext+1
      Sals=1
      Ltxdef=Ltext
      Ltext=Ltext+4
      GOTO09741
09746 CONTINUE
      c3=14
      text(ltext)=CL3(1)
      ltext=ltext+1
      text(ltext)=Mc2(1)
      ltext=ltext+1
      Sals=6
      Ltxdef=Ltext
      Ltext=Ltext+4
      GOTO09741
09745 CONTINUE
      c3=14
      text(ltext)=CL3(1)
      ltext=ltext+1
      text(ltext)=Mc2(1)
      ltext=ltext+1
      Sals=8
      Ltxdef=Ltext
      Ltext=Ltext+4
      Lroot=0
      GOTO09741
09744 CONTINUE
      c3=14
      text(ltext)=CL3(1)
      ltext=ltext+1
      text(ltext)=Mc2(1)
      ltext=ltext+1
      Sals=3
      Ltxdef=Ltext
      Ltext=Ltext+4
      CallDtcdia(Diagn,13,Zero,Idiag,Retcod)
      Trace=Tsym(22)
      Alpred(Ndef)=Alsprc
      Alsprc=Ndef
      DO09740I=1,8
      Nalias(calias)=Tmess(I)
      Calias=Calias+1
09740 CONTINUE
      Palias(Ndef+1)=Calias
      Talbeg(Ndef)=Ltext
      GOTO09741
09743 CONTINUE
      Outcom=.true.
      CallDtcdia(Diagn,14,Zero,Idiag,Retcod)
      GOTO09741
09742 CONTINUE
      c3=14
      text(ltext)=CL3(1)
      ltext=ltext+1
      text(ltext)=Mc2(1)
      ltext=ltext+1
      Nproc=Nproc+1
      C2=Nproc
      Text(Ltext)=MC2(1)
      Text(Ltext+1)=MC2(2)
      Ltext=Ltext+2
      C2=35
      c3=14
      text(ltext)=CL3(1)
      ltext=ltext+1
      text(ltext)=Mc2(1)
      ltext=ltext+1
      Lproc=.true.
      C2=3
      c3=14
      text(ltext)=CL3(1)
      ltext=ltext+1
      text(ltext)=Mc2(1)
      ltext=ltext+1
      Sals=6
      Ltxdef=Ltext
      Ltext=Ltext+4
09741 CONTINUE
      GOTO09749
09750 CONTINUE
      CallDtcdia(Diagn,16,Zero,Idiag,Retcod)
09749 CONTINUE
      GOTO09754
09763 CONTINUE
      C1=C2
      C2=35
      c3=14
      text(ltext)=CL3(1)
      ltext=ltext+1
      text(ltext)=Mc2(1)
      ltext=ltext+1
      C2=C1
      c3=14
      text(ltext)=CL3(1)
      ltext=ltext+1
      text(ltext)=Mc2(1)
      ltext=ltext+1
      GOTO09754
09762 CONTINUE
      Lcall=.true.
      GOTO09754
09761 CONTINUE
      IF(.NOT.(Incl00.LT.5))GOTO09737
      s=18
      Lists=List
      Ifn=0
      nwords=0
      Lastch=Tsym(1)
      IF(.NOT.(Lp7.EQ.27))GOTO09734
      Lsts=Lst
      GOTO09733
09734 CONTINUE
      Lsts=0
09733 CONTINUE
      GOTO09736
09737 CONTINUE
      CallDtcdia(Diagn,18,Zero,Idiag,Retcod)
09736 CONTINUE
      GOTO09754
09760 CONTINUE
      c3=14
      text(ltext)=CL3(1)
      ltext=ltext+1
      text(ltext)=Mc2(1)
      ltext=ltext+1
      Fort=.True.
      Pascal=.False.
      Cl2(1)=Tsym(8)
      Tclass(c+1)=15
      Tcc(c+1)=0
      Cl2(1)=Tsym(11)
      Tclass(c+1)=16
      Aclass(c+1)=4
      TCC(c+1)=4
      Cl2(1)=Tsym(28)
      Tclass(c+1)=15
      Aclass(c+1)=8
      TCC(c+1)=0
      Cl2(1)=Tsym(2)
      Tclass(c+1)=18
      Aclass(c+1)=6
      Tclass(13+1)=19
      Tcc(13+1)=35
      Cl2(1)=Tsym(1)
      Tclass(c+1)=15
      PP(2*20+2)=7
      SS(2*20+2)=1
      RFF(2*20+2)=1
      PP(14*20+17)=22
      SS(14*20+17)=1
      RFF(14*20+17)=1
      Cl2(1)=Tsym(15)
      Tcc(c+1)=5
      Cl2(1)=Tsym(16)
      Tcc(c+1)=6
      Cl2(1)=Tsym(17)
      Tclass(c+1)=10
      Cl2(1)=Tsym(14)
      Tclass(c+1)=11
      Cl2(1)=Tsym(5)
      Tclass(c+1)=12
      Cl2(1)=Tsym(13)
      Tclass(c+1)=11
      Cl2(1)=Tsym(19)
      Tclass(c+1)=11
      Cl2(1)=Tsym(20)
      Tclass(c+1)=11
      Cl2(1)=Tsym(29)
      Tclass(c+1)=7
      Cl2(1)=Tsym(30)
      Tclass(c+1)=7
      PP(12+9*20)=16
      PP(9+3*20)=15
      RFF(9+3*20)=0
      PP(12+6*20)=14
      RFF(12+6*20)=0
      PP(12+3*20)=12
      RFF(12+3*20)=0
      GOTO09754
09759 CONTINUE
      c3=14
      text(ltext)=CL3(1)
      ltext=ltext+1
      text(ltext)=Mc2(1)
      ltext=ltext+1
      Fort=.False.
      Pascal=.False.
      Cl2(1)=Tsym(11)
      Tclass(c+1)=16
      Aclass(c+1)=4
      TCC(c+1)=4
      Cl2(1)=Tsym(28)
      Tclass(c+1)=15
      Aclass(c+1)=8
      TCC(c+1)=0
      Cl2(1)=Tsym(8)
      Tclass(c+1)=19
      Tcc(c+1)=35
      Cl2(1)=Tsym(2)
      Tclass(c+1)=18
      Aclass(c+1)=6
      Tclass(13+1)=20
      Tcc(13+1)=0
      Cl2(1)=Tsym(1)
      Tclass(c+1)=1
      PP(2*20+2)=0
      SS(2*20+2)=3
      RFF(2*20+2)=0
      PP(14*20+17)=22
      SS(14*20+17)=1
      RFF(14*20+17)=1
      Cl2(1)=Tsym(15)
      Tcc(c+1)=5
      Cl2(1)=Tsym(16)
      Tcc(c+1)=6
      Cl2(1)=Tsym(17)
      Tclass(c+1)=10
      Cl2(1)=Tsym(14)
      Tclass(c+1)=11
      Cl2(1)=Tsym(5)
      Tclass(c+1)=12
      Cl2(1)=Tsym(13)
      Tclass(c+1)=11
      Cl2(1)=Tsym(19)
      Tclass(c+1)=11
      Cl2(1)=Tsym(20)
      Tclass(c+1)=11
      Cl2(1)=Tsym(29)
      Tclass(c+1)=7
      Cl2(1)=Tsym(30)
      Tclass(c+1)=7
      PP(12+9*20)=16
      PP(9+3*20)=15
      RFF(9+3*20)=0
      PP(12+6*20)=14
      RFF(12+6*20)=0
      PP(12+3*20)=12
      RFF(12+3*20)=0
      GOTO09754
09758 CONTINUE
      c3=14
      text(ltext)=CL3(1)
      ltext=ltext+1
      text(ltext)=Mc2(1)
      ltext=ltext+1
      Fort=.False.
      Pascal=.True.
      Outcom=.false.
      Cl2(1)=Tsym(8)
      Tclass(c+1)=15
      Tcc(c+1)=0
      IF(.NOT.(Lp7.NE.33))GOTO09731
      Cl2(1)=Tsym(11)
      Tclass(c+1)=15
      Aclass(c+1)=8
      TCC(c+1)=0
      Cl2(1)=Tsym(28)
      Tclass(c+1)=16
      Aclass(c+1)=4
      TCC(c+1)=4
09731 CONTINUE
      Cl2(1)=Tsym(2)
      Tclass(c+1)=18
      Aclass(c+1)=6
      Tclass(13+1)=19
      Tcc(13+1)=35
      Cl2(1)=Tsym(1)
      Tclass(c+1)=15
      PP(14*20+17)=22
      SS(14*20+17)=1
      RFF(14*20+17)=1
      PP(2*20+2)=7
      SS(2*20+2)=1
      RFF(2*20+2)=1
      Cl2(1)=Tsym(15)
      Tcc(c+1)=0
      Cl2(1)=Tsym(16)
      Tcc(c+1)=0
      Cl2(1)=Tsym(17)
      Tclass(c+1)=15
      Cl2(1)=Tsym(14)
      Tclass(c+1)=15
      Cl2(1)=Tsym(5)
      Tclass(c+1)=15
      Cl2(1)=Tsym(13)
      Tclass(c+1)=15
      Cl2(1)=Tsym(19)
      Tclass(c+1)=15
      Cl2(1)=Tsym(20)
      Tclass(c+1)=15
      Cl2(1)=Tsym(29)
      Tclass(c+1)=6
      Cl2(1)=Tsym(30)
      Tclass(c+1)=6
      PP(12+9*20)=11
      PP(9+3*20)=11
      RFF(9+3*20)=1
      PP(12+6*20)=11
      RFF(12+6*20)=1
      PP(12+3*20)=11
      RFF(12+3*20)=1
      IF(.NOT.(Lp7.EQ.33))GOTO09728
      Cl2(1)=Tsym(2)
      Tclass(c+1)=15
      Aclass(c+1)=8
      Cl2(1)=Tsym(12)
      Tclass(c+1)=17
      PP(14*20+17)=27
      SS(14*20+17)=1
      RFF(14*20+17)=0
09728 CONTINUE
      GOTO09754
09757 CONTINUE
      List=.True.
      CallDtcdia(Diagn,21,Zero,idiag,retcod)
      GOTO09754
09756 CONTINUE
      List=.False.
      CallDtcdia(Diagn,19,Zero,idiag,retcod)
      GOTO09754
09755 CONTINUE
      Endin=1
      ntr=.True.
      CallDtcdia(Diagn,17,Zero,idiag,retcod)
      Write(6,1997)Cardn,Mark,Card,Diagn
      SR=0
      Goto2000
09754 CONTINUE
      GOTO09770
09771 CONTINUE
      Text(ltext)=Tsym(6)
      Ltext=Ltext+1
      DO09725islsl=1,Lslsl
      Text(ltext)=Slsl(Islsl)
      Ltext=Ltext+1
09725 CONTINUE
      CallDtcdia(Diagn,20,Zero,Idiag,retcod)
09770 CONTINUE
      GOTO09778
09808 CONTINUE
      IF(.NOT.(LCard.EQ.80))GOTO09722
      WRITE(0,1996)
      WRITE(6,1996)
      RETCOD=MAX0(RETCOD,2)
09722 CONTINUE
      Goto09999
      GOTO09778
09807 CONTINUE
      IF(.NOT.(Lslsl.LT.16))GOTO09719
      Lslsl=Lslsl+1
      Slsl(Lslsl)=LSR(1)
      GOTO09718
09719 CONTINUE
      CALLDtcdia(Diagn,1,Zero,Idiag,Retcod)
09718 CONTINUE
      GOTO09778
09806 CONTINUE
      IF(.NOT.(CC.NE.0))GOTO09716
      C1=CC
      Wspec=.true.
      GOTO09715
09716 CONTINUE
      C1=SR
      Wspec=.false.
09715 CONTINUE
      GOTO09778
09805 CONTINUE
      C2=C1
      if(Wspec)then
      c3=14
      text(ltext)=CL3(1)
      ltext=ltext+1
      text(ltext)=Mc2(1)
      ltext=ltext+1
      Wspec=.false.
      else
      text(ltext)=Mc2(1)
      ltext=ltext+1
      endif
      GOTO09778
09804 CONTINUE
      C2=8
      c3=14
      text(ltext)=CL3(1)
      ltext=ltext+1
      text(ltext)=Mc2(1)
      ltext=ltext+1
      GOTO09778
09803 CONTINUE
      WRITE(0,1995)
      WRITE(6,1995)
      retcod=3
      GOTO09778
09802 CONTINUE
      C2=7
      c3=14
      text(ltext)=CL3(1)
      ltext=ltext+1
      text(ltext)=Mc2(1)
      ltext=ltext+1
      GOTO09778
09801 CONTINUE
      C2=9
      c3=14
      text(ltext)=CL3(1)
      ltext=ltext+1
      text(ltext)=Mc2(1)
      ltext=ltext+1
      GOTO09778
09800 CONTINUE
      C2=10
      c3=14
      text(ltext)=CL3(1)
      ltext=ltext+1
      text(ltext)=Mc2(1)
      ltext=ltext+1
      GOTO09778
09799 CONTINUE
      IF(.NOT.(SR.EQ.1.AND.NCOMEN.NE.0))GOTO09713
      IF(.NOT.(Outcom))GOTO09710
      S=12
      GOTO09709
09710 CONTINUE
      S=11
09709 CONTINUE
      GOTO09712
09713 CONTINUE
      Clind=MAX0(Clind-Llind,2)
      Llind=0
      WRITE(6,1994)
      WRITE(0,1994)
      RETCOD=3
09712 CONTINUE
      GOTO09778
09798 CONTINUE
      IF(.NOT.(Outcom))GOTO09707
      C2=41
      c3=14
      text(ltext)=CL3(1)
      ltext=ltext+1
      text(ltext)=Mc2(1)
      ltext=ltext+1
      S=12
09707 CONTINUE
      LinReq=Cardn
      GOTO09778
09797 CONTINUE
      IF(.NOT.(Lcall))GOTO09704
      Begnam=Ltext
      GOTO09703
09704 CONTINUE
      C2=CC
      c3=14
      text(ltext)=CL3(1)
      ltext=ltext+1
      text(ltext)=Mc2(1)
      ltext=ltext+1
      IF(.NOT.(Sals.EQ.0))GOTO09701
      C2=Alsprc
      Text(Ltext)=MC2(1)
      Ltext=Ltext+1
      Text(Ltext)=MC2(2)
      Ltext=Ltext+1
09701 CONTINUE
09703 CONTINUE
      Lalias1=ltext
      GOTO09778
09796 CONTINUE
      IF(.NOT.(Lproc))GOTO09698
      Ipw=Talbeg(Ndef-2)-1
      DO09695I=1,5
      TEXT(Ltext+I-1)=TEXT(I+Ipw)
09695 CONTINUE
      Ltext=Ltext+5
      DO09692I=1,9
      TEXT(Ltext+I-1)=CONL(I)
09692 CONTINUE
      Ltext=Ltext+9
      C2=35
      c3=14
      text(ltext)=CL3(1)
      ltext=ltext+1
      text(ltext)=Mc2(1)
      ltext=ltext+1
      Lproc=.false.
      GOTO09696
09698 CONTINUE
      IF(.NOT.(Lcall))GOTO09697
      Text(Ltext)=Tsym(1)
      Ltext=Ltext+1
      Ncall=Ncall+1
      Iproc=0
      Found7=.false.
      Lalias=Ltext-Begnam-1
09689 IF(.NOT.(Iproc.LT.Nproc.AND..NOT.Found7))GOTO09688
      Iproc=Iproc+1
      I=Ndefpr(Iproc)
      IF(.NOT.(Lalias.EQ.Palias(I+1)-Palias(I)))GOTO09686
      Jp7=0
      Found7=.true.
      KP7=Palias(i)
09683 IF(.NOT.((Jp7.LT.Lalias).AND.Found7))GOTO09682
      Jp7=Jp7+1
      Cl2(1)=TEXT(begnam+Jp7-1)
      c=Up(c+1)
      Found7=Cl2(1).EQ.Nalias(KP7)
      KP7=KP7+1
      GOTO09683
09682 CONTINUE
09686 CONTINUE
      GOTO09689
09688 CONTINUE
      IF(.NOT.(Found7))GOTO09680
      Ret(Iproc)=Ret(Iproc)+1
      IF(.NOT.(Ret(Iproc).EQ.1))GOTO09677
      Nc1st(Iproc)=Ncall
      GOTO09676
09677 CONTINUE
      i=Lastc(Iproc)
      Nextc(i)=Ncall
09676 CONTINUE
      Lastc(Iproc)=Ncall
      KP7=Ndefpr(Iproc)+1
      Ipw=Talbeg(KP7)
      DO09674I=1,6
      TEXT(Begnam+I-1)=TEXT(Ipw+I-1)
09674 CONTINUE
      Ltext=Begnam+6
      Text(Ltext)=Tsym(5)
      Ltext=Ltext+1
      INR=Ret(Iproc)
      I6R002=2
      GOTO09988
09982 CONTINUE
      DO09671I=Ipw,6
      Mc2(1)=RETRT(I)
      text(ltext)=Mc2(1)
      ltext=ltext+1
09671 CONTINUE
      C2=35
      c3=14
      text(ltext)=CL3(1)
      ltext=ltext+1
      text(ltext)=Mc2(1)
      ltext=ltext+1
      IF(.NOT.(Fort))GOTO09668
      DO09665I=1,6
      TEXT(Ltext+I-1)=FBlank(I)
09665 CONTINUE
      Ltext=Ltext+6
09668 CONTINUE
      DO09662I=1,4
      TEXT(Ltext+I-1)=LGOTO(I)
09662 CONTINUE
      Ltext=Ltext+4
      Jp7=Ndefpr(Iproc)
      Kp7=Talbeg(Jp7)-1
      DO09659I=1,5
      TEXT(Ltext+I-1)=TEXT(Kp7+i)
09659 CONTINUE
      Ltext=Ltext+5
      C2=35
      c3=14
      text(ltext)=CL3(1)
      ltext=ltext+1
      text(ltext)=Mc2(1)
      ltext=ltext+1
      Remlab=Llab
      DO09656isamp=1,5
      c2=Remlab/10000
      Remlab=Mod(Remlab,10000)*10
      c2=c2+Dig0
      text(ltext)=Mc2(1)
      ltext=ltext+1
09656 CONTINUE
      DO09653I=1,9
      TEXT(Ltext+I-1)=CONL(I)
09653 CONTINUE
      Ltext=Ltext+9
      C2=35
      c3=14
      text(ltext)=CL3(1)
      ltext=ltext+1
      text(ltext)=Mc2(1)
      ltext=ltext+1
      Retlab(Ncall)=Llab
      Llab=Llab-1
      GOTO09679
09680 CONTINUE
      CALLDtcdia(Diagn,23,Zero,Idiag,Retcod)
09679 CONTINUE
      Lcall=.false.
      GOTO09696
09697 CONTINUE
      DO09650kkk=Lalias1,Ltext-1
      Cl2(1)=Text(kkk)
      c=Up(c+1)
      Text(kkk)=Cl2(1)
09650 CONTINUE
      Text(Ltext)=Tsym(1)
      Ltext=Ltext+1
09696 CONTINUE
      GOTO09778
09795 CONTINUE
      NCOMEN=NCOMEN+1
      IF(.NOT.(Outcom))GOTO09647
      IF(.NOT.(Ncomen.EQ.1))GOTO09644
      C2=41
      c3=14
      text(ltext)=CL3(1)
      ltext=ltext+1
      text(ltext)=Mc2(1)
      ltext=ltext+1
09644 CONTINUE
      S=12
09647 CONTINUE
      GOTO09778
09794 CONTINUE
      IF(.NOT.(NCOMEN.EQ.0))GOTO09641
      C2=C1
      text(ltext)=Mc2(1)
      ltext=ltext+1
      GOTO09640
09641 CONTINUE
      IF(.NOT.(Outcom))GOTO09638
      S=12
      GOTO09637
09638 CONTINUE
      S=11
09637 CONTINUE
09640 CONTINUE
      GOTO09778
09793 CONTINUE
      IF(NCOMEN.NE.0)S=15
      IF(.NOT.(Outcom))GOTO09635
      TEXT(LTEXT)=LSR(1)
      LTEXT=LTEXT+1
09635 CONTINUE
      GOTO09778
09792 CONTINUE
      IF(.NOT.(NCOMEN.NE.0))GOTO09632
      NCOMEN=NCOMEN-1
      IF(.NOT.(NCOMEN.EQ.0))GOTO09629
      S=1
      IF(.NOT.(Outcom))GOTO09626
      C2=42
      c3=14
      text(ltext)=CL3(1)
      ltext=ltext+1
      text(ltext)=Mc2(1)
      ltext=ltext+1
09626 CONTINUE
09629 CONTINUE
09632 CONTINUE
      GOTO09778
09791 CONTINUE
      IF(.NOT.(NCOMEN.EQ.0))GOTO09623
      S=1
      IF(.NOT.(Outcom))GOTO09620
      C2=42
      c3=14
      text(ltext)=CL3(1)
      ltext=ltext+1
      text(ltext)=Mc2(1)
      ltext=ltext+1
09620 CONTINUE
      GOTO09622
09623 CONTINUE
      If(Outcom)S=12
09622 CONTINUE
      IF(.NOT.(Llind.NE.0))GOTO09617
      Ipk1=Ason(Cnode)
      Cpk1=Nofson(Cnode)
      Foundk=.False.
      Ipk2=Plind(Lnodes)
      Llind=Clind-Ipk2
09614 IF(.NOT.(Cpk1.GT.0.AND..NOT.Foundk))GOTO09613
      IF(.NOT.(Llind.EQ.Plind(Ipk1+1)-Plind(Ipk1)))GOTO09611
      ip7=0
      Foundk=.True.
      JP7=Plind(Ipk1)
09608 IF(.NOT.(ip7.LT.Llind.AND.Foundk))GOTO09607
      If(Lind(jp7+ip7).NE.Lind(Ipk2+ip7))Foundk=.False.
      ip7=ip7+1
      GOTO09608
09607 CONTINUE
09611 CONTINUE
      Ipk1=Ipk1+1
      Cpk1=Cpk1-1
      GOTO09614
09613 CONTINUE
      IF(.NOT.(Foundk))GOTO09605
      CALLDtcdia(Diagn,2,Zero,Idiag,Retcod)
      Clind=Clind-Llind
      GOTO09604
09605 CONTINUE
      IF(.NOT.(Trace.EQ.Tsym(22)))GOTO09602
      Tnode(Lnodes)=Tsym(22)
      GOTO09601
09602 CONTINUE
      Tnode(Lnodes)=Tsym(2)
09601 CONTINUE
      IF(.NOT.((Fort.OR.Pascal).AND.ichar(CARD(Irdr+1)).NE.13))GOTO09599
      Opcon(Lnodes)=Tsym(22)
      GOTO09598
09599 CONTINUE
      Opcon(Lnodes)=Tsym(2)
09598 CONTINUE
      Headln(Lnodes)=LinReq
      Atext(Lnodes)=0
      Alspre(Lnodes)=Alsprc
      Ason(Lnodes)=0
      Nofson(Lnodes)=0
      Lnodes=Lnodes+1
      Plind(Lnodes)=Clind
      Nofson(Cnode)=Nofson(Cnode)+1
      C2=2
      c3=14
      text(ltext)=CL3(1)
      ltext=ltext+1
      text(ltext)=Mc2(1)
      ltext=ltext+1
09604 CONTINUE
      Llind=0
09617 CONTINUE
      GOTO09778
09790 CONTINUE
      TEXT(LTEXT)=LSR(1)
      LTEXT=LTEXT+1
      GOTO09778
09789 CONTINUE
      IF(.NOT.((NCOMEN.EQ.0)))GOTO09596
      If(Fort)Alsrf=0
      IF(.NOT.(Outcom.AND.(Sals.EQ.0.OR.Sals.EQ.5)))GOTO09593
      C2=41
      c3=14
      text(ltext)=CL3(1)
      ltext=ltext+1
      text(ltext)=Mc2(1)
      ltext=ltext+1
      S=17
      If(.NOT.Fort)Rf=1
      GOTO09592
09593 CONTINUE
      IF(.NOT.((Pascal.OR.Fort).AND.Irdr.NE.1))GOTO09590
      C2=35
      c3=14
      text(ltext)=CL3(1)
      ltext=ltext+1
      text(ltext)=Mc2(1)
      ltext=ltext+1
09590 CONTINUE
      Irdr=lcard
09592 CONTINUE
      GOTO09595
09596 CONTINUE
      IF(.NOT.(Outcom))GOTO09587
      S=12
      GOTO09586
09587 CONTINUE
      S=11
09586 CONTINUE
09595 CONTINUE
      GOTO09778
09788 CONTINUE
      IF(.NOT.(TNode(Cnode).EQ.Tsym(22)))GOTO09584
      Enter=0
      I6R003=1
      GOTO09987
09984 CONTINUE
09584 CONTINUE
      C2=CC
      c3=14
      text(ltext)=CL3(1)
      ltext=ltext+1
      text(ltext)=Mc2(1)
      ltext=ltext+1
      GOTO09778
09787 CONTINUE
      IF(.NOT.(SR.EQ.13))GOTO09581
      C2=42
      c3=14
      text(ltext)=CL3(1)
      ltext=ltext+1
      text(ltext)=Mc2(1)
      ltext=ltext+1
      S=1
      GOTO09580
09581 CONTINUE
      TEXT(LTEXT)=LSR(1)
      LTEXT=LTEXT+1
09580 CONTINUE
      GOTO09778
09786 CONTINUE
      IF(.NOT.(Outcom))GOTO09578
      If(S.NE.13)S=12
      TEXT(LTEXT)=LSR(1)
      LTEXT=LTEXT+1
09578 CONTINUE
      GOTO09778
09785 CONTINUE
      Clind=MAX0(Clind-Llind,2)
      IF(.NOT.(Outcom))GOTO09575
      C2=41
      c3=14
      text(ltext)=CL3(1)
      ltext=ltext+1
      text(ltext)=Mc2(1)
      ltext=ltext+1
      S=12
      Irdr=Irdr-Llind-1
09575 CONTINUE
      Llind=0
      GOTO09778
09784 CONTINUE
      IF(.NOT.(LSR(1).EQ.Tsym(8)))GOTO09572
      S=1
      goto09997
      GOTO09569
09572 CONTINUE
      IF(.NOT.(Lastch.EQ.Tsym(1).AND.LSR(1).NE.Tsym(1)))GOTO09571
      Nwords=Nwords+1
      Lastch=LSR(1)
      ifn=ifn+1
      						C=SR
      			Fn(ifn)=Cl2(1)
      GOTO09569
09571 CONTINUE
      IF(.NOT.(Lastch.EQ.Tsym(1).AND.LSR(1).EQ.Tsym(1)))GOTO09570
      Lastch=LSR(1)
      GOTO09569
09570 CONTINUE
      Lastch=LSR(1)
      ifn=ifn+1
      						C=SR
      				Fn(ifn)=Cl2(1)
09569 CONTINUE
      GOTO09778
09783 CONTINUE
09997 continue
      L=Ifn
09568 IF(.NOT.(L.GT.1.AND.Fn(L).NE.Tsym(21).AND.Fn(L).NE.'/'))GOTO09567
      L=L-1
      GOTO09568
09567 CONTINUE
      If(Fn(L).EQ.Tsym(21).AND.L.EQ.Ifn)Then
      FnINCL(Ifn:)='.inc'
      Ifn=Ifn+4
      ElseIf(Fn(L).EQ.'/'.OR.L.EQ.1)Then
      FnINCL(Ifn+1:)='.inc'
      Ifn=Ifn+4
      Endif
      OPEN(Incl00+1,FILE=FNINCL(1:IFN),status='OLD',IOSTAT=IRC)
      DO09565iii=1,ifn
      Fn(iii)=Tsym(1)
09565 CONTINUE
      IF(.NOT.(irc.NE.0))GOTO09562
      CallDtcdia(Diagn,12,Zero,Idiag,Retcod)
      GOTO09561
09562 CONTINUE
      Incl00=Incl00+1
      Oldlis(Incl00)=List
      Oldlst(Incl00)=Lst
      List=Lists
      Lst=Lsts
      Irdr=Lcard
      rf=1
      Anls=9
      goto1000
2009  Continue
      write(6,09990)Incl00
      Mark=Tsym(22)
09561 CONTINUE
      GOTO09778
09782 CONTINUE
      C=UP(SR+1)
      Lind(Clind)=C
      Clind=Clind+1
      Llind=Llind+1
      GOTO09778
09781 CONTINUE
      If(Squote2.EQ.LSR(1))S=1
      TEXT(LTEXT)=LSR(1)
      LTEXT=LTEXT+1
      GOTO09778
09780 CONTINUE
      SQuote2=LSR(1)
      TEXT(LTEXT)=LSR(1)
      LTEXT=LTEXT+1
      GOTO09778
09779 CONTINUE
      C2=C1
      if(Wspec)then
      c3=14
      text(ltext)=CL3(1)
      ltext=ltext+1
      text(ltext)=Mc2(1)
      ltext=ltext+1
      Wspec=.false.
      else
      text(ltext)=Mc2(1)
      ltext=ltext+1
      endif
      TEXT(LTEXT)=LSR(1)
      LTEXT=LTEXT+1
09778 CONTINUE
      IF(.NOT.(MAX(RF,ALSRF).EQ.0))GOTO09559
      ANLS=3
      Goto1000
2003  CONTINUE
09559 CONTINUE
      GOTO09889
09888 CONTINUE
      IF(.NOT.(Opcon(Cnode).EQ.Tsym(22)))GOTO09556
      Cl2(1)=TEXT(Ltext-3)
      IF(.NOT.(C.EQ.35))GOTO09553
      TEXT(Ltext-3)=TEXT(Ltext-1)
      Ltext=Ltext-2
09553 CONTINUE
09556 CONTINUE
      GOTO09550
09981 CONTINUE
      S=Sinit
      Llind=0
09547 IF(.NOT.(S.NE.0))GOTO09546
      Enhead=Enhead+1
      Cl2(1)=Card(Enhead)
      C=Up(c+1)
      IF(.NOT.(Cl2(1).EQ.Tsym(21)))GOTO09544
      Iclass=3
      GOTO09540
09544 CONTINUE
      IF(.NOT.(Cl2(1).EQ.Tsym(6)))GOTO09543
      Iclass=2
      GOTO09540
09543 CONTINUE
      IF(.NOT.(Cl2(1).EQ.Tsym(4).OR.Cl2(1).EQ.Tsym(5)))GOTO09542
      Iclass=4
      GOTO09540
09542 CONTINUE
      IF(.NOT.(Cl2(1).EQ.Tsym(1)))GOTO09541
      Iclass=5
      GOTO09540
09541 CONTINUE
      Iclass=1
09540 CONTINUE
      IPS=(S-1)*5+Iclass
      P=PPind(ips)
      S=SSind(IPS)
      GOTO(09539,09538,09537,09536,09535,09534),P
      GOTO09533
09539 CONTINUE
      Llind=1
      Cind(Llind)=C
      GOTO09533
09538 CONTINUE
      Llind=Llind+1
      Cind(Llind)=C
      GOTO09533
09537 CONTINUE
      Enhead=Enhead-1
      GOTO09533
09536 CONTINUE
      Sinit=2
      GOTO09533
09535 CONTINUE
      Sinit=1
      GOTO09533
09534 CONTINUE
      Llind=0
09533 CONTINUE
      GOTO09547
09546 CONTINUE
      IF(.NOT.(Llind.NE.0))GOTO09532
      Ison=Ason(Path)
      Cson=Nofson(Path)
      Erhead=.True.
09529 IF(.NOT.(Cson.GT.0.AND.Erhead))GOTO09528
      IF(.NOT.(Llind.EQ.Plind(Ison+1)-Plind(Ison)))GOTO09526
      ip7=0
      Erhead=.False.
      JP7=Plind(Ison)
09523 IF(.NOT.(ip7.LT.Llind.AND..NOT.Erhead))GOTO09522
      If(Lind(jp7+ip7).NE.Cind(ip7+1))Erhead=.True.
      ip7=ip7+1
      GOTO09523
09522 CONTINUE
      IF(.NOT.(.NOT.Erhead))GOTO09520
      Path=Ison
09520 CONTINUE
09526 CONTINUE
      Ison=Ison+1
      Cson=Cson-1
      GOTO09529
09528 CONTINUE
      Llind=0
09532 CONTINUE
      GOTO(09980,09978),I6R004
09550 CONTINUE
      FOUND=.False.
09517 IF(.NOT.((.NOT.FOUND).AND.(SR.NE.0)))GOTO09516
      Enhead=1
      Path=1
      Erhead=.False.
      Sinit=1
09514 IF(.NOT.(.NOT.Erhead.AND.(Card(Enhead+1).NE.Tsym(4).AND.Card(Enhea
     *d+1).NE.Tsym(5))))GOTO09513
      I6R004=1
      GOTO09981
09980 CONTINUE
2331  CONTINUE
      GOTO09514
09513 CONTINUE
      IF(.NOT.(.NOT.Erhead))GOTO09511
      Areq=Headln(Path)
      IF(.NOT.(Card(Enhead+1).EQ.Tsym(4)))GOTO09508
      FOUND=.True.
      IF(.NOT.(Atext(Path).EQ.0))GOTO09505
      Atext(Path)=Ltext
      Ason(Path)=Lnodes
      Nofson(Path)=0
      Headln(Path)=Cardn
      Cnode=Path
      Alsprc=Alspre(Path)
      Trace=Tnode(Path)
      Cl2(1)=Card(Enhead+2)
      C=Up(C+1)
      If(Cl2(1).EQ.Offtrc)Tnode(Path)=Tsym(2)
      IF(Cl2(1).EQ.Lstno)LIST=.False.
      IF(Cl2(1).EQ.Lstyes)LIST=.True.
      IF(.NOT.(Trace.EQ.Tsym(22).AND.Cl2(1).NE.Offtrc))GOTO09502
      Nhead=Enhead+1
      DO09499I=1,Nhead
      Hcard(I)=Card(I)
09499 CONTINUE
      Enter=1
      I6R003=2
      GOTO09987
09979 CONTINUE
09502 CONTINUE
      GOTO09504
09505 CONTINUE
      Gfound=.true.
      Erhead=.true.
09504 CONTINUE
09508 CONTINUE
09511 CONTINUE
      IF(.NOT.(Erhead))GOTO09496
      CALLDtcdia(Diagn2,5,Zero,Idiag,Retcod)
      IF(.NOT.(Gfound))GOTO09493
      CALLDtcdia(Diagn,22,HEADLN(PATH),Idiag,Retcod)
      Gfound=.false.
      Found=.false.
      GOTO09492
09493 CONTINUE
      CALLDtcdia(Diagn,3,Zero,Idiag,Retcod)
09492 CONTINUE
      GOTO09495
09496 CONTINUE
      CALLDtcdia(Diagn,4,Areq,Idiag,Retcod)
      IF(.NOT.(FOUND))GOTO09490
      ANLS=5
      Goto1000
2005  CONTINUE
      GOTO09489
09490 CONTINUE
      RPath=Path
      Enhead=Enhead+1
      Path=1
      Sinit=1
09487 IF(.NOT.(.NOT.Erhead.AND.Card(Enhead+1).NE.Tsym(4)))GOTO09486
      I6R004=2
      GOTO09981
09978 CONTINUE
2336  CONTINUE
      GOTO09487
09486 CONTINUE
      IF(.NOT.(.NOT.Erhead))GOTO09484
      Areq=Headln(Path)
      Cl2(1)=Card(Enhead+2)
      C=Up(C+1)
      IF(Cl2(1).EQ.Lstno)LIST=.False.
      IF(Cl2(1).EQ.Lstyes)LIST=.True.
      IF(.NOT.(Atext(Path).NE.0))GOTO09481
      Atext(RPath)=Atext(Path)
      Ason(RPath)=Ason(Path)
      Nofson(RPath)=Nofson(Path)
      Headln(RPath)=Cardn
      CALLDtcdia(Diagn2,6,Areq,Idiag,Retcod)
      GOTO09480
09481 CONTINUE
      CALLDtcdia(Diagn2,7,Areq,Idiag,Retcod)
      Refnfn=.True.
09480 CONTINUE
      GOTO09483
09484 CONTINUE
      CALLDtcdia(Diagn2,8,Zero,Idiag,Retcod)
      Refnfn=.True.
09483 CONTINUE
09489 CONTINUE
09495 CONTINUE
      IF(.NOT.(.NOT.FOUND))GOTO09478
      ANLS=6
      Goto1000
2006  CONTINUE
      WRITE(6,1993)Diagn2
      IF(Refnfn)WRITE(0,1993)Diagn2
      Refnfn=.False.
09475 IF(.NOT.((SR.NE.0).AND.(SR.NE.1)))GOTO09474
      ANLS=7
      Goto1000
2007  CONTINUE
      GOTO09475
09474 CONTINUE
09478 CONTINUE
      GOTO09517
09516 CONTINUE
      GOTO09892
09891 CONTINUE
      Nbyte=Ltext
      Nodtot=Lnodes-1
      Return
09992 format(7x,'-- Synonym List --')
09993 Format(1X,'->Error',1X,80A1,1X,'Error in TREFOR $PROFILE')
09996 Format(1X,'->Error',1X,80A1,1X,34A1)
09995 Format(80A1)
1997  FORMAT(1X,I4,A1,3X,80A1,1X,34A1)
1998  FORMAT(1X,I4,A1,80A1,1X,34A1)
1996  FORMAT(79X,'Service word in danger')
1995  FORMAT(79X,'Char. constant not completed')
1994  FORMAT(79X,'Request or comment not closed ')
1993  FORMAT(9X,80X,1X,34A1)
09990 Format(1x,'====>   Level( ',I1,' )')
      End
