# Makefile for building trefor from *.for source
FC = ifort
FFLAGS = -c -save -intconstant

DEL = rm -f

trefor : trfunix.o df1unix.o df2unix.o dtcdiunx.o
	$(FC) -i-dynamic trfunix.o df1unix.o df2unix.o dtcdiunx.o -o trefor

trfunix.o : trfunix.for
	$(FC) $(FFLAGS) trfunix.for

df1unix.o : df1unix.for
	$(FC) $(FFLAGS) df1unix.for

df2unix.o : df2unix.for
	$(FC) $(FFLAGS) df2unix.for

dtcdiunx.o : dtcdiunx.for
	$(FC) $(FFLAGS) dtcdiunx.for

clean:
	$(DEL) *.o trefor
