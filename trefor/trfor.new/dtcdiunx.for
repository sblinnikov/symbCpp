      SUBROUTINEDTCDIA(DIAGN,NTEXT,PARAM,Idiag,Retcod)
      Character*34DIAGN
      IntegerNTEXT,Idiag
      INTEGER*2PARAM
      Integer*4Retcod
      Character*34TTEXT(23)/'Error in service word             ','Local 
     *index repeated              ','   The node is not requested      '
     *,'   The node requested in line    *','   Text ignored until the n
     *ode end','   Its  design begins in line    *','No design for node 
     *from line     *','Reference to nonexistent node     ','Case or Sel
     *ect not opened.        ','Alias not identified              ','Unr
     *ecognizable symbol in Fileid.  ','Unable to open include file.    
     *  ','Caution: TREFOR TRACE active!     ','Caution: COMMENTS will b
     *e output! ','Deflist basis is too short        ','Forbidden alias 
     *definition        ','Current tree completed.           ','Include 
     *level e xceeds max.level! ','Print full listing forced.        ','
     *Warning:Unknown service word !!!  ','Print full listing started.  
     *     ','   Node head already in line     *','Procedure not found  
     *             '/
      Character*1CASTER/'*'/,CZERO/'0'/
      INTEGER*2I5,J5,K5
      Character*1MK5(2)
      EQUIVALENCE(K5,MK5(1))
      DIAGN=TTEXT(NTEXT)
      IF(.NOT.(Diagn(34:34).EQ.Caster))GOTO09999
      DIAGN(34:34)=CZERO
      I5=PARAM
      J5=34
09996 IF(.NOT.(I5.NE.0))GOTO09995
      K5=I5/10
      K5=I5-K5*10+48
      DIAGN(J5:j5)=MK5(1)
      I5=I5/10
      J5=J5-1
      GOTO09996
09995 CONTINUE
09999 CONTINUE
      GOTO(09993,09992,09991,09990,09989,09988,09987,09986,09985,09984,0
     *9983,09982,09981,09980,09979,09978,09977,09976,09975,09974,09973,0
     *9972,09971),Ntext
      Idiag=1
      GOTO09970
09993 CONTINUE
      Retcod=3
      Idiag=2
      GOTO09970
09992 CONTINUE
      Retcod=3
      Idiag=2
      GOTO09970
09991 CONTINUE
      Retcod=max0(Retcod,2)
      Idiag=3
      GOTO09970
09990 CONTINUE
      GOTO09970
09989 CONTINUE
      Idiag=1
      GOTO09970
09988 CONTINUE
      GOTO09970
09987 CONTINUE
      Retcod=max0(Retcod,2)
      Idiag=2
      GOTO09970
09986 CONTINUE
      Retcod=max0(Retcod,2)
      Idiag=2
      GOTO09970
09985 CONTINUE
      Retcod=3
      Idiag=2
      GOTO09970
09984 CONTINUE
      Retcod=3
      Idiag=2
      GOTO09970
09983 CONTINUE
      Retcod=3
      Idiag=2
      GOTO09970
09982 CONTINUE
      Retcod=max0(Retcod,2)
      Idiag=2
      GOTO09970
09981 CONTINUE
      Idiag=3
      GOTO09970
09980 CONTINUE
      Idiag=3
      GOTO09970
09979 CONTINUE
      Retcod=3
      Idiag=2
      GOTO09970
09978 CONTINUE
      Retcod=3
      Idiag=2
      GOTO09970
09977 CONTINUE
      Idiag=3
      GOTO09970
09976 CONTINUE
      Idiag=2
      Retcod=3
      GOTO09970
09975 CONTINUE
      Idiag=1
      GOTO09970
09974 CONTINUE
      Idiag=1
      Retcod=max0(Retcod,2)
      GOTO09970
09973 CONTINUE
      Idiag=1
      GOTO09970
09972 CONTINUE
      Idiag=2
      Retcod=3
      GOTO09970
09971 CONTINUE
      Idiag=2
      Retcod=3
09970 CONTINUE
      RETURN
      END
