# Makefile for building trefor from *.f source after trefor trefor
FC = lf95
FFLAGS = --sav
DEL = rm -f


trefor : trfunix.o df1unix.o df2unix.o dtcdiunx.o
	$(FC) trfunix.o df1unix.o df2unix.o dtcdiunx.o -o trefor

trfunix.o : trfunix.f
	$(FC) $(FFLAGS) -c trfunix.f

df1unix.o : df1unix.f
	$(FC) $(FFLAGS) -c df1unix.f

df2unix.o : df2unix.f
	$(FC) $(FFLAGS) -c df2unix.f

dtcdiunx.o : dtcdiunx.f
	$(FC) $(FFLAGS) -c dtcdiunx.f

clean:
	$(DEL) *.o trefor
