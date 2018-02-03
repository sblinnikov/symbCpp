#!/bin/tcsh
# check other levels of optimization:
icpc -I include -c -O0 src/*.cpp
ar cvr ~/lib/libsymbc.a *.o
ar ts  ~/lib/libsymbc.a
exit

