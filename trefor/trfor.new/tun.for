      Character*1Tsym(30)/' ','-','%',':','=','_','''',';','$','*','@',' 
     */','!','&','>','<','^','0','[',']','.','+',',','9','?','"','C','#' 
     *,'H','h'/ 
      Character*1DCLASS(256)/256*' '/ 
      Integer*2Aclass(256)/256*8/,Wclass(256,2)/512*6/,Class(256)/256*1/ 
     *,Tclass(256)/256*15/,TCC(256)/256*0/,Slcode(36)/14,15,16,17,18,19, 
     *20,21,22,24,27,28,30,23,29,26,31,25,4*3,36,32,33,36,2*36,37,38,3*3 
     *9,3*36/,Refsw(36)/13*1,2,2,3,3,4,6*5,6,7,8,8,9,10,3*11,12,13,14/ 
      Character*1Letter(52)/'a','A','b','B','c','C','d','D','e','E','f', 
     *'F','g','G','h','H','i','I','j','J','k','K','l','L','m','M','n','N 
     *','o','O','p','P','q','Q','r','R','s','S','t','T','u','U','v','V', 
     *'w','W','x','X','y','Y','z','Z'/ 
      Character*1Digits(10)/'1','2','3','4','5','6','7','8','9','0'/ 
      Character*1CL2(2) 
      Integer*2C 
      Equivalence(C,CL2(1)) 
      Character*16Sword(36)/'DO/','OD/','IF/','FI/','THEN/','ELSE/','WHI 
     *LE/','LEAVE/','ITERATE/','OF/','REPEAT/','UNTIL/','OTHER/','CASE/' 
     *,'SELECT/','ESAC/','END/','/','DEFINE/','LABEL/','DEFLIST/','TRACE 
     */','OUTCOM/','PROC/','RETURN/','CALL/','INCLUDE/','INCLUDEN/','FOR 
     *TRAN/','TREFOR/','PASCAL/','REXX/','C/','ONPRINT/','OFFPRINT/','EN 
     *DOFTREE/'/ 
      IntegerCpoint,Point 
      Integer*2Pslsl(36+1) 
      Character*1Tslsl(64*16) 
      Integer*2Low,colon,Up(256) 
      C=0 
      CL2(1)=Tsym(4) 
      colon=c 
      DO32744i=1,52 
      CL2(1)=letter(i) 
      Tclass(c+1)=6 
32744 CONTINUE 
      DO32741i=1,10 
      CL2(1)=Digits(i) 
      Tclass(c+1)=2 
32741 CONTINUE 
      CL2(1)=Tsym(25) 
      Tclass(c+1)=6 
      CL2(1)=Tsym(29) 
      Tclass(c+1)=7 
      CL2(1)=Tsym(30) 
      Tclass(c+1)=7 
      CL2(1)=Tsym(1) 
      Tclass(c+1)=1 
      CL2(1)=Tsym(6) 
      Tclass(c+1)=3 
      CL2(1)=Tsym(7) 
      Tclass(c+1)=8 
      CL2(1)=Tsym(26) 
      Tclass(c+1)=8 
      CL2(1)=Tsym(2) 
      Tclass(c+1)=18 
      CL2(1)=Tsym(5) 
      Tclass(c+1)=12 
      CL2(1)=Tsym(10) 
      Tclass(c+1)=13 
      CL2(1)=Tsym(4) 
      Tclass(c+1)=14 
      CL2(1)=Tsym(11) 
      Tclass(c+1)=16 
      TCC(c+1)=4 
      CL2(1)=Tsym(12) 
      Tclass(c+1)=17 
      		CL2(1)=Tsym(8) 
      Tclass(c+1)=11 
      TCC(c+1)=35 
      	Tclass(13+1)=20 
      CL2(1)=Tsym(13) 
      Tclass(c+1)=11 
      TCC(c+1)=12 
      CL2(1)=Tsym(14) 
      Tclass(c+1)=11 
      TCC(c+1)=11 
      CL2(1)=Tsym(15) 
      Tclass(c+1)=09 
      TCC(c+1)=5 
      CL2(1)=Tsym(16) 
      Tclass(c+1)=04 
      TCC(c+1)=6 
      CL2(1)=Tsym(17) 
      Tclass(c+1)=10 
      TCC(c+1)=13 
      	CL2(1)=Tsym(19) 
      Tclass(c+1)=11 
      TCC(c+1)=66 
      	CL2(1)=Tsym(20) 
      Tclass(c+1)=11 
      TCC(c+1)=67 
      	Tclass(0+1)=05 
      TCC(0+1)=1 
      Tclass(1+1)=05 
      TCC(1+1)=1 
      Write(6,32749)(Tclass(i),i=1,256) 
32749 Format(1X,'INTEGER*2 TCLASS(256)/',16(/1X,20(i2,',')),'/;') 
      Write(6,32748)(TcC(i),i=1,256) 
32748 Format(1X,'INTEGER*2 TCC(256)/',16(/1X,16(i2,',')),'/;') 
      DO32738i=1,52 
      CL2(1)=letter(i) 
      Dclass(c+1)=Tsym(10) 
32738 CONTINUE 
      DO32735	i=1,10 
      CL2(1)=Digits(i) 
      Dclass(c+1)=Tsym(10) 
32735 CONTINUE 
      Write(6,32747)(Dclass(i),i=1,256) 
32747 Format(1X,'@CHARACTER DCLASS(256)/',16(/1X,16('''',A1,'''',',')),' 
     */;') 
      CL2(1)=Tsym(1) 
      Aclass(c+1)=1 
      Aclass(13+1)=1 
      CL2(1)=Tsym(7) 
      	Aclass(c+1)=2 
      CL2(1)=Tsym(26) 
      	Aclass(c+1)=2 
      Aclass(0+1)=3 
      Aclass(1+1)=3 
      CL2(1)=Tsym(11) 
      Aclass(c+1)=4 
      CL2(1)=Tsym(6) 
      Aclass(c+1)=5 
      DO32732	i=1,52 
      CL2(1)=letter(i) 
      Aclass(c+1)=5 
32732 CONTINUE 
      DO32729	i=1,10 
      CL2(1)=Digits(i) 
      Aclass(c+1)=5 
32729 CONTINUE 
      CL2(1)=Tsym(25) 
      Aclass(c+1)=5 
      CL2(1)=Tsym(2) 
      Aclass(c+1)=6 
      CL2(1)=Tsym(23) 
      Aclass(c+1)=7 
      Write(6,32750)(Aclass(i),i=1,256) 
32750 Format(1X,'INTEGER*2 ACLASS(256)/',16(/1X,16(i2,',')),'/;') 
      C=0 
      DO32726	i=1,256 
      Up(i)=i-1 
32726 CONTINUE 
      DO32723	j=1,26 
      			i=2*j-1 
      CL2(1)=Letter(i) 
      Low=c 
      CL2(1)=Letter(2*j) 
      Up(Low+1)=c 
32723 CONTINUE 
      Write(6,32751)(Up(i),i=1,256) 
32751 Format(1X,'INTEGER*2 UP(256)/',16(/1x,16(i3,',')),'/;') 
      Class(0+1	)=2 
      	Class(5+1	)=3 
      	Class(6+1	)=3 
      Class(7+1	)=3 
      Class(8+1	)=3 
      Class(9+1	)=3 
      Class(10+1	)=3 
      Class(11+1	)=3 
      Class(12+1	)=3 
      Class(13+1	)=3 
      Class(14+1	)=4 
      	Class(15+1	)=5 
      Class(16+1	)=6 
      Class(17+1	)=7 
      Class(18+1	)=8 
      Class(19+1	)=9 
      Class(20+1	)=10 
      Class(21+1	)=11 
      Class(22+1	)=12 
      Class(23+1	)=13 
      Class(24+1	)=14 
      Class(25+1	)=15 
      Class(26+1	)=16 
      Class(27+1	)=17 
      Class(28+1	)=18 
      Class(29+1	)=19 
      Class(30+1	)=20 
      Class(31+1	)=21 
      Class(66	+1)=22 
      Class(67+1)=23 
      Class(35+1)=24 
      		Class(32+1)=25 
      		Class(33+1)=26 
      Write(6,32746)(Class(i),i=1,256) 
32746 Format(1X,'INTEGER*2  CLASS(256)/',16(/1X,16(I3,',')),'/;') 
      Wclass(Colon+1,1)=5 
      		Wclass(13	+1,1)=11 
      Wclass(14+1,1)=2 
      CL2(1)=Tsym(1) 
      Wclass(c+1,1)=7 
      DO32720	i=1,10 
      CL2(1)=Digits(i) 
      Wclass(c+1,1)=1 
32720 CONTINUE 
      Wclass(0+1,2)=3 
      Wclass(35+1,2)=2 
      Wclass(55+1,2)=4 
      		Wclass(37+1,2)=8 
      Wclass(38+1,2)=9 
      Wclass(39+1,2)=10 
      Wclass(41	+1,2)=12 
      Wclass(42	+1,2)=13 
      Write(6,32745)((Wclass(i,j),i=1,256),j=1,2) 
32745 Format(1X,'INTEGER*2 WCLASS(256,2)/',32(/1X,16(i2,',')),'/;') 
      ii=64 
      Kword=1 
      Point=1 
      Pslsl(Kword)=Point 
32717 IF(.NOT.(Kword.LE.36))GOTO32716 
      Cpoint=1 
32714 IF(.NOT.(Cpoint.LE.16.AND.SWord(Kword)(Cpoint:Cpoint).NE.'/'))GOTO 
     *32713 
      Tslsl(Point)=SWord(Kword)(Cpoint:Cpoint) 
      Point=Point+1 
      Cpoint=Cpoint+1 
      GOTO32714 
32713 CONTINUE 
      Kword=Kword+1 
      Pslsl(Kword)=Point 
      GOTO32717 
32716 CONTINUE 
      Write(6,32757)ii+1,(Pslsl(i),i=1,36+1),(Pslsl(36+1),i=1,ii-36) 
32757 Format(1X,'INTEGER*2 PSLSL(',i3,')/',23(/1X,15(i3,','))) 
      Write(6,32756)64*16,(Tslsl(i),i=1,Point-1),(' ',i=1,64*16-Point+1) 
32756 Format(1X,'@CHARACTER TSLSL(',i4,')/',100(/1X,16('''',A1,'''',',') 
     *)) 
      Write(6,32754)ii,(Refsw(i),i=1,36),(Refsw(36),i=1,ii-36) 
      Write(6,32753)ii,(Slcode(i),i=1,36),(Slcode(36),i=1,ii-36) 
      Write(6,32752)ii,(I,i=1,36),(36,i=1,ii-36) 
32754 Format(1X,'INTEGER*2 REFSW(',i3,')/',23(/1X,15(i3,','))) 
32753 Format(1X,'INTEGER*2 SLCODE(',i3,')/',23(/,1X,15(i3,','))) 
32752 Format(1X,'INTEGER*2 ORDER(',i3,')/',23(/,1X,15(i3,','))) 
      End 
