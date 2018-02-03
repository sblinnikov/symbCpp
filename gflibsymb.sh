#!/bin/tcsh
rm -i *.o
g++ -I include/ -c -fno-elide-constructors  src/*.cpp
ar cvr ~/lib/libsymbcgf.a *.o
ar ts  ~/lib/libsymbcgf.a
/bin/rm *.o
exit

