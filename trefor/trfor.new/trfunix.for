      ProgramTrefor
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
      REALCputim,Ttime
      real*4tcpuDimensiontmarr(2),Itmarr(3),Idtarr(3)
      INTEGER*4Id,Imn,Iy,Ih,Im,Is,Iss,Ih1,Im1,Is1,Iss1
      CHARACTER*8TIME/'00:00:00'/,PATH*80,Filename*80,FN*80,Temp*80,FT/'
     * TREFOR '/,FM*2/'A1'/,USER,WORK/'Unix'/
      CharacterDATE*10/'01/01/1999'/,LSTchar*1
      Integer*2Cardn/0/
      IntegerLTmp,len
      Logicalntr
      Integer*4Concod,Totcod
      IntegerHour,minute,second,hundredth
      Integer*4Month,Day,Year
      INTEGERDATE_TIME(8)
      CHARACTER*12REAL_CLOCK(3)
      CHARACTER*10tf90
      CHARACTER*5zonef90
      CALLDATE_AND_TIME(REAL_CLOCK(1),REAL_CLOCK(2),REAL_CLOCK(3),DATE_T
     *IME)
      write(Date,'(I4,''/'',I2,''/'',I2)')Date_time(1),Date_time(2),Date
     *_time(3)
      Hour=Date_time(5)
      minute=Date_time(6)
      second=Date_time(7)
      write(Time,'(I2,'':'',I2,'':'',I2)')Hour,minute,second
      Npar=iargc()
      callGetArg(1,Path)
      LPath=LENGTH(Path)
      OPEN(7,FILE=Path(1:LPath),status='OLD',IOSTAT=IRC)
      If(IRC.NE.0)stop28
      callGetArg(2,TEMP)
      if(Npar.LT.3)TEMP(:2)='./'
      LTMP=LENGTH(Temp)
      callGetArg(3,LSTchar)
      if(Npar.LT.4)LSTchar='1'
      read(LSTchar,'(I1)')LST
      If(Temp(LTMP:LTMP).NE.':'.AND.Temp(LTMP:LTMP).NE.'/')Then
      LTMP=LTMP+1
      Temp(LTMP:LTMP)='/'
      Endif
      Filename(1:LTMP)=Temp(1:LTMP)
      i=Lpath
09999 IF(.NOT.(Path(i:i).NE.'.'.AND.i.GE.1))GOTO09998
      i=i-1
      GOTO09999
09998 CONTINUE
      Filename(LTMP+1:)=Path(1:i-1)
      Lfn=LTMP+i-1
      OPEN(8,FILE=Filename(1:LFN)//'.f')
      If(LST.EQ.1)Then
      OPEN(6,FILE=Filename(1:LFN)//'.lst')
      ELSE
      OPEN(6,FILE='NUL')
      Endif
      NUMERR=0
      RETCOD=1
      cardn=0
      nodall=0
      Ttime=0.
      inbyte=0
      Ntrees=0
      WRITE(6,1111)DATE,TIME,Path(1:Lpath)
1111  FORMAT(1X,120('=')/1X,' LEVEL 4.1.3 (Apr 1993)   Unix Trefor    Da
     *te:',A,' Time:',A,'   File compiled: ',A/1X,120('='))
      Write(0,*)'Unix TREFOR ( Version 4.13 ) compiling file: "',Path(1:
     *Lpath),'"'
      Write(0,*)'Copyright (c) Weinstein et al. 1983-2008.'
09996 CONTINUE
      Llab=32757
      Ndef=1
      callcpu_time(tcpu)
      TimeB=tcpu
      NTREES=NTREES+1
      CALLDTCF1(ntr,cardn)
      CALLDTCF2
      Rewind3
      GOTO(09993,09992,09991),RETCOD
      GOTO09990
09993 CONTINUE
      CONCOD=0
      GOTO09990
09992 CONTINUE
      CONCOD=4
      GOTO09990
09991 CONTINUE
      CONCOD=8
09990 CONTINUE
      callcpu_time(tcpu)
      TimeE=tcpu
      CPutim=TimeE-TimeB
      IF(NUMERR.NE.0)WRITE(6,'('' ====>> Count of Trefor syntaxis errors
     *: '',I3)')NUMERR
      If(ntr.OR.Ntrees.GT.1)Then
      WRITE(6,'(1X,120(''='')/''  Trefor compiling time(sec) - '',F6.2, 
     *  ''     Length of compressed text(bytes) - '',I6/    2X,''Conditi
     *on code = '',I1,10X,    ''     Number of nodes - '',I4    )')Cputi
     *m,NBYTE,CONCOD,Nodtot
      Endif
      Write(6,'(1X,120(''=''))')
      nodall=nodall+nodtot
      ttime=ttime+cputim
      inbyte=inbyte+nbyte
      iconcd=max(iconcd,concod)
      TOTCOD=max(Totcod,retcod)
      IF(.NOT.(.NOT.ntr))GOTO09996
      WRITE(6,'('' Number of Trees Compiled -'',I3,8X,''Total Trefor com
     *piling time(sec)  -    '',F6.2,5X,'' Total number of nodes - '',I6
     *,/,      '' Highest Condition code='',I6,7X,      '' Total Length 
     *of compressed text(bytes):'',I8, 6X,''Count for Local indeces:'',I
     *6,/,      '' (c) Copyright  Weinstein et al. 1983-2008'',      36X
     *,''User: '',A8,'' at  '',A8,  /1X,120(''=''))')NTREES,tTIME,NODALL
     *,ICONCD,INBYTE,CLIND,USER,WORK
      GOTO(09989,09988,09987),TOTCOD
      GOTO09986
09989 CONTINUE
      STOP0
      GOTO09986
09988 CONTINUE
      STOP4
      GOTO09986
09987 CONTINUE
      STOP8
09986 CONTINUE
      END
      IntegerfunctionLENGTH(Needle)
      Character*(*)Needle
      LENGTH=LEN(Needle)
09985 IF(.NOT.(LENGTH.GT.0.AND.Needle(LENGTH:LENGTH).EQ.' '))GOTO09984
      LENGTH=LENGTH-1
      GOTO09985
09984 CONTINUE
      Return
      end
