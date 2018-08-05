# symbCpp

The source for this project is mostly taken from [http://issc.uj.ac.za/symbolic/symbolic.html "Official website"](http://issc.uj.ac.za/symbolic/symbolic.html)

(seems to be not updated after 2010) with examples from

Quantum Mechanics Using Computer Algebra: Includes Sample Programs in C++, SymbolicC++, Maxima, Maple, and Mathematica
W.-H. Steeb, Yorick Hardy World Scientific, 2010 - Mathematics - 234 pages.

The goal of this project is not developing SymbolicC++, but rather
showing simple recipes to work with it and developing
examples for Quantum Mechanics in SymbolicC++, as well as Maxima (wxMaxima) and Mathematica.
The examples are in the directory examples, see also doc.

SymbolicC++ was originally written as a collection of header files
for C++. Many of the functions and classes provided are template
functions and classes and in general cannot be compiled in as part
of a library.

This project attempts to extract the parts of SymbolicC++ that can
be compiled as part of a library and so create the include / library
infrastructure. The src and include directories are populated by
scripts from the SymbolicC++ header files.

## Install

### Installation to /usr/local

To install to /usr/local:
```shell
$  ./configure
$  make
$  make install
```

To compile a program using SymbolicC++ with GCC:
```shell
$  g++ -o program program.cpp -lsymbolicc++
```

To run the program:
```shell
$  ./program
```

A brief PDF document describing SymbolicC++ is provided
(doc/introsymb.tex, produce doc/introsymb.pdf from it)
and is installed as /usr/local/share/doc/SymbolicC++.pdf.


### Installation elsewhere

This section describes installation to a directory "where_to_install".
The directory must be a full path, i.e. it should not begin with "./" or
"../".

To install:
```shell
$ ./configure --prefix=where_to_install
$  make
$  make install
```

** If the directory is a standard system directory, proceed as described
** in the section "Installation to /usr/local" above.

## Compile

To compile a program using SymbolicC++ with GCC (all on one line):
```shell
  g++ -I where_to_install/include
      -L where_to_install/lib
      -o program program.cpp -lsymbolicc++
```

## Run

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
and is installed as **where_to_install**/share/doc/SymbolicC++.pdf.


## Important remarks

Description above, taken from the Official site for SymbolicC++, does not work due to the error:
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
```shell
g++ -I ./include -L ~/lib -o test1.exe examples/test1.cpp -fno-elide-constructors -lsymbcgf
g++ -I ./include -L ~/lib -o matrix.exe examples/matrix.cpp -fno-elide-constructors -lsymbcgf
g++ -I ./include -L ~/lib -o loperators.exe examples/loperators.cpp -fno-elide-constructors -lsymbcgf

```

For 32bit systems use gf32libsymb.sh, and commands like
```shell
g++ -I ./include -L ~/lib -o test1.exe examples/test1.cpp -lsymbcgf
g++ -I ./include -L ~/lib -o bose.exe examples/bose.cpp -lsymbcgf
g++ -I ./include -L ~/lib -o separation.exe examples/separation.cpp -lsymbcgf
```

For intel icpc  use library built with iclibsymb.sh and
```shell
icpc -I ./include -L ~/lib -o test1.exe examples/test1.cpp  -lsymbc
icpc -I ./include -L ~/lib -o matrix.exe examples/matrix.cpp -lsymbc
```

## Addendum for numerics

### TREFOR

Use directory trefor to build a useful  preprocessor for structured program design 
in fortran.

TREFOR==TREe FORtran

Read README there

### Examples in Structured Programming

Directory trefor/StructProgramming has elementary examples from D.Gries etc. written in trefor (trn)
 
