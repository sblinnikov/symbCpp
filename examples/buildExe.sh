#!/bin/tcsh
g++ -I ../include -L ~/lib -o $1.exe $1.cpp -fno-elide-constructors -lsymbcgf
echo $1.exe is ready to run...
exit

