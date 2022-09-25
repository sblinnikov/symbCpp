Исходник куплен:
сблинникож^2гмаил.цом пупсик77БООКС
 https://www.worldscientific.com/worldscibooks/10.1142/7751#t=toc
 http://el.wspc.com/ls/click?upn=XRMJ9sAZlN4oZMtEZygnrPD39GK0YhzoD8N8abfOvc-2BOICq6BwRX2cp7wj-2BgCljkTeXBvGkEhadM7UuLxHlktW9ONa673nvbZR6wlP4OFTw-3Dl6-q_xztT1d6IVdXbsCpvZceCCTygKEB-2FA58J6nXZ-2BAle217KqVjKM-2FMEmmJaslsdebomYYfe4J8OS6fk799kpSWgq9kOw3sQ9tj5DMyQyH11qB8RiQJQGqO8xWyQc1lMLI96O9hLchjdEfwClIl-2FgJ-2BVFIjDguWrO4MMIDT7YFwprP-2BUyu3gkTxweKYPyYcZrjTHrJSzmPQQv2QOTRWtZm2-2BvxGh5RM6kpNzcu34yAce0xylIBeBWnPuUnlEABVGHBcyVOwUdFqvvVfEGG0-2FRZMAWBO0j5smVEPvr7oLag9wOsA-3D

Some musing examples in this repos...
Go to directory examples.

To run maxima examples run, e.g.

maxima 

>batch("hydrogen2.mac");

or rmaxima
>batch("hydrogen2.mac");

ctrl-d to exit

Here rmaxima is aliased to 
 rlwrap -a maxima 

Если установка через libsymbolic++ не работает:

Now gflibsymb.sh works which has lines

#!/bin/tcsh
g++ -I include -c -fno-elide-constructors  src/*.cpp
ar cvr ~/lib/libsymbcgf.a *.o
ar ts  ~/lib/libsymbcgf.a
exit


This builds libsymbcgf.a in HOME/lib. Then quick translation is possible:

g++ -I ./include -L ~/lib -o test1.exe examples/test1.cpp -fno-elide-constructors -lsymbcgf
g++ -I ./include -L ~/lib -o matrix.exe examples/matrix.cpp -fno-elide-constructors -lsymbcgf
g++ -I ./include -L ~/lib -o loperators.exe examples/loperators.cpp -fno-elide-constructors -lsymbcgf



For 32bit systems use gf32libsymb.sh, and commands like

g++ -I ./include -L ~/lib -o test1.exe examples/test1.cpp -lsymbcgf
g++ -I ./include -L ~/lib -o bose.exe examples/bose.cpp -lsymbcgf
g++ -I ./include -L ~/lib -o separation.exe examples/separation.cpp -lsymbcgf


For intel icpc  use library built with iclibsymb.sh and

icpc -I ./include -L ~/lib -o test1.exe examples/test1.cpp  -lsymbc
icpc -I ./include -L ~/lib -o matrix.exe examples/matrix.cpp -lsymbc
