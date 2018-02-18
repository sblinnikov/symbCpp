// loperators.cpp

#include <iostream>
#include "symbolicc++.h"
using namespace std;
int main(void)
{
using SymbolicConstant::i;
Symbolic x("x",3), hb("hb"), u("u");
u = u[x(0),x(1),x(2)];
Symbolic LX = -i*hb*(x(1)*df(u,x(2))-x(2)*df (u,x(1)));
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
