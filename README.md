# symbCpp

SymbolicC++ was originally written as a collection of header files
for C++. Many of the functions and classes provided are template
functions and classes and in general cannot be compiled in as part
of a library.

This project attempts to extract the parts of SymbolicC++ that can
be compiled as part of a library and so create the include / library
infrastructure. The src and include directories are populated by
scripts from the SymbolicC++ header files.

#Install

## Installation to /usr/local

To install to /usr/local:

1.  ./configure
2.  make
3.  make install

To compile a program using SymbolicC++ with GCC:

  g++ -o program program.cpp -lsymbolicc++

To run the program:

  ./program
 
A brief PDF document describing SymbolicC++ is provided 
(doc/introsymb.tex, produce doc/introsymb.pdf from it)
and is installed as /usr/local/share/doc/SymbolicC++.pdf.


## Installation elsewhere 

This section describes installation to a directory "where_to_install".
The directory must be a full path, i.e. it should not begin with "./" or
"../".

To install:

1.  ./configure --prefix=where_to_install
2.  make
3.  make install

** If the directory is a standard system directory, proceed as described
** in the section "Installation to /usr/local" above.

# Compile

To compile a program using SymbolicC++ with GCC (all on one line):

>  g++ -I where_to_install/include
>      -L where_to_install/lib
>      -o program program.cpp -lsymbolicc++

# Run

When running the program, make sure that the dynamic libraries can be located,
for example by modifying /etc/ld.so.conf or by setting the LD_LIBRARY_PATH
(for Bourne shell compatible shells)
```bash
  $ ./program 
  Shared object "libsymbolicc++.so.3" not found
  $ LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:where_to_install/lib
  $ export LD_LIBRARY_PATH
  $ ./program 
  ...
```

## Documentation

A brief PDF document describing SymbolicC++ is provided
(doc/introsymb.tex, produce doc/introsymb.pdf from it)

and is installed as where_to_install/share/doc/SymbolicC++.pdf.


# Important remarks

Description above does not work due to error:
```shell
/usr/local/lib//libsymbolicc++.so: undefined reference to `Number<int>::Number(int const&)'
/usr/local/lib//libsymbolicc++.so: undefined reference to `Number<double>::Number(double const&)'
collect2: error: ld returned 1 exit status
```

Next lines work (option -fno-elide-constructors is needed on 64bit systems, not on 32bit):
```shell
 cd examples/
 g++ -o test1.exe test1.cpp -fno-elide-constructors ../src/*.cpp
 g++ -o matrix.exe matrix.cpp -fno-elide-constructors ../src/*.cpp
``` 

but it works only if include/ dir is in a known place, e.g. in /usr/local, 
if not, then do in this directory:
```shell
 g++ -I include -o matrix.exe examples/matrix.cpp -fno-elide-constructors src/*.cpp
```
or put after -I the path to the place where you have copied the include/ dir from this directory


Now gflibsymb.sh works which has lines
```shell
#!/bin/tcsh
g++ -I include -c -fno-elide-constructors  src/*.cpp
ar cvr ~/lib/libsymbcgf.a *.o
ar ts  ~/lib/libsymbcgf.a
exit
```

This builds libsymbcgf.a in HOME/lib. Then quick translation is possible:
- g++ -I ./include -L ~/lib -o test1.exe examples/test1.cpp -fno-elide-constructors -lsymbcgf
- g++ -I ./include -L ~/lib -o matrix.exe examples/matrix.cpp -fno-elide-constructors -lsymbcgf

For 32bit systems use gf32libsymb.sh, and commands like 
- g++ -I ./include -L ~/lib -o test1.exe examples/test1.cpp -lsymbcgf
- g++ -I ./include -L ~/lib -o bose.exe examples/bose.cpp -lsymbcgf
- g++ -I ./include -L ~/lib -o separation.exe examples/separation.cpp -lsymbcgf


For intel icpc  use library built with iclibsymb.sh and
- icpc -I ./include -L ~/lib -o test1.exe examples/test1.cpp  -lsymbc
- icpc -I ./include -L ~/lib -o matrix.exe examples/matrix.cpp -lsymbc

