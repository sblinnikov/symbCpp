FFLAGS=-fast -O4  
trefor : trfunix.o df1unix.o df2unix.o dtcdiunx.o
            f77 $(FFLAGS) trfunix.o df1unix.o df2unix.o dtcdiunx.o -o trefor

trfunix.o : trfunix.f
            f77 $(FFLAGS) -c -cg89 trfunix.f


df1unix.o : df1unix.f
    f77 $(FFLAGS) -c -cg89 df1unix.f


df2unix.o : df2unix.f
    f77 $(FFLAGS) -c -cg89 df2unix.f


dtcdiunx : dtcdiunx.f
    f77 $(FFLAGS) -c -cg89 dtcdiunx.f


