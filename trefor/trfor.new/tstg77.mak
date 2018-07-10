
FFLAGS=  

trefor : trfunixtst.o df1unix.o df2unix.o dtcdiunx.o
	g77 trfunixtst.o df1unix.o df2unix.o dtcdiunx.o  -o trefor

trfunixtst.o : trfunixtst.f
	g77 $(FFLAGS) -c trfunixtst.f

df1unix.o : df1unix.f
	g77 $(FFLAGS) -c df1unix.f

df2unix.o : df2unix.f
	g77 $(FFLAGS) -c df2unix.f

dtcdiunx.o : dtcdiunx.f
	g77 $(FFLAGS) -c dtcdiunx.f
