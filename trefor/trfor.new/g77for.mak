# Makefile for building trefor from *.for source
FC = g77
FFLAGS =
DEL = rm -f


trefor : trfunix.o df1unix.o df2unix.o dtcdiunx.o
	$(FC) trfunix.o df1unix.o df2unix.o dtcdiunx.o -o trefor

trfunix.o : trfunix.for
	$(FC) $(FFLAGS) -c trfunix.for

df1unix.o : df1unix.for
	$(FC) $(FFLAGS) -c df1unix.for

df2unix.o : df2unix.for
	$(FC) $(FFLAGS) -c df2unix.for

dtcdiunx.o : dtcdiunx.for
	$(FC) $(FFLAGS) -c dtcdiunx.for

clean:
	$(DEL) *.o trefor
