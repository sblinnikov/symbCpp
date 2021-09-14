// loperators.cpp
// install symbolicc as described in ../README for libsymbcgf
// compile with (if dir inclide is above):
// g++ -I ../include -L ~/lib -o loperators.exe loperators.cpp -fno-elide-constructors -lsymbcgf
// result saved in
// loperators.out

#include <iostream>
#include "symbolicc++.h"
using namespace std;

int main(void)
{
using SymbolicConstant::i;
Symbolic x("x",3), hb("hb"), u("u");
u = u[x(0),x(1),x(2)];
Symbolic LX = -i*hb*(x(1)*df(u,x(2))-x(2)*df(u,x(1)));
Symbolic LY = -i*hb*(x(2)*df(u,x(0))-x(0)*df(u,x(2)));
Symbolic LZ = -i*hb*(x(0)*df(u,x(1))-x(1)*df(u,x(0)));

// Commutator of LX and LY
cout << "The commutator is "<< LX[u==LY]-LY[u==LX]<< endl;

// Evaluation of L2 = (LX^2)+(LY^2)+(LZ^2)
Symbolic L2 = LX[u==LX]+LY[u==LY]+LZ[u==LZ];
cout << "L2 = "<< L2 << endl;

// Commutator of L2 and LX
cout << "RES =" << L2[u==LX]-LX[u==L2] << endl;
return 0;
}

// The output is
//
// The commutator is
// -hb^(2)*x1*df(u[x0,x1,x2],x0)+hb^(2)*x0*df(u[x0,x1,x2],x1)
// L2 = -hb^(2)*x1^(2)*df(u[x0,x1,x2],x2,x2)
// +2*hb^(2)*x1*df(u[x0,x1,x2],x1)
// +2*hb^(2)*x1*x2*df(u[x0,x1,x2],x1,x2)
// +2*hb^(2)*x2*df(u[x0,x1,x2],x2)
// -hb^(2)*x2^(2)*df(u[x0,x1,x2],x1,x1)
// -hb^(2)*x2^(2)*df(u[x0,x1,x2],x0,x0)
// +2*hb^(2)*x2*x0*df(u[x0,x1,x2],x2,x0)
// +2*hb^(2)*x0*df(u[x0,x1,x2],x0)
// -hb^(2)*x0^(2)*df(u[x0,x1,x2],x2,x2)
// -hb^(2)*x0^(2)*df(u[x0,x1,x2],x1,x1)
// +2*hb^(2)*x0*x1*df(u[x0,x1,x2],x0,x1)
// -hb^(2)*x1^(2)*df(u[x0,x1,x2],x0,x0)
// RES = 0
