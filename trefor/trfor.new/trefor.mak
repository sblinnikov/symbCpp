#TMP=E:\
#FL=FL /C /FPc /G0 /AL /Ox

.TRF.OBJ:
        TRF $*

trefor.exe:  trefor.obj df1pc.obj df2pc.obj dtcdia.obj
        link trefor.obj df1pc.obj df2pc.obj dtcdia.obj;

trefor.obj:     trefor.trf trfgen.inc trfcode.inc chargen.inc tree.inc

df1pc.obj:      df1pc.trf trfgen.inc trfcode.inc chargen.inc tree.inc

dtcdia.obj:     dtcdia.trf trfgen.inc trfcode.inc chargen.inc

df2pc.obj:      df2pc.trf trfgen.inc trfcode.inc chargen.inc tree.inc
