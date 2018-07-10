
FFLAGS=  

trefor : trfunix.o df1unix.o df2unix.o dtcdiunx.o
	g77 trfunix.o df1unix.o df2unix.o dtcdiunx.o bctime.o -o trefor

trfunix.o : trfunix.f
	g77 $(FFLAGS) -c trfunix.f

df1unix.o : df1unix.f
	g77 $(FFLAGS) -c df1unix.f

df2unix.o : df2unix.f
	g77 $(FFLAGS) -c df2unix.f

dtcdiunx.o : dtcdiunx.f
	g77 $(FFLAGS) -c dtcdiunx.f

bctime.o: bctime.c
	gcc -c bctime.c
