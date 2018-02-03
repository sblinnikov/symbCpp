#!/bin/tcsh
#g++ -I include/ -c -fno-elide-constructors  src/*.cpp
g++ -I include/ -c  src/*.cpp
ar cvr ~/lib/libsymbcgf.a *.o
ar ts  ~/lib/libsymbcgf.a
exit

