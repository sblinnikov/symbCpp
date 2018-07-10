
FFLAGS = 

trefor : trfunix.o df1unix.o df2unix.o dtcdiunx.o
	ifort trfunix.o df1unix.o df2unix.o dtcdiunx.o -o trefor

trfunix.o : trfunix.f
	ifort $(FFLAGS) -c trfunix.f

df1unix.o : df1unix.f
	ifort $(FFLAGS) -c df1unix.f

df2unix.o : df2unix.f
	ifort $(FFLAGS) -c df2unix.f

dtcdiunx.o : dtcdiunx.f
	ifort $(FFLAGS) -c dtcdiunx.f
