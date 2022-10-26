// harmonic1.cpp

#include <iostream>
#include "symbolicc++.h"
using namespace std;

int main(void)
{
Symbolic A("A"), XI("XI"), H("H"), lam("lambda");
H = H[XI];

Symbolic UT = A*H*exp(-(XI^2)/2);
Symbolic R1 = df(UT,XI,2) - (XI^2)*UT + (lam+1)*UT;

cout << "R1="<<R1<<endl;
R1 = R1*H/UT;
cout << "R1="<<R1<<endl;
return 0;
}

// The output is
//
// R1 = A*df(H[XI],XI,XI)*e^(-1/2*XI^(2))
//      -2*A*df(H[XI],XI)*XI*e^(-1/2*XI^(2))
//      +lambda*A*H[XI]*e^(-1/2*XI^(2))
// R1 = df(H[XI],XI,XI)-2*df(H[XI],XI)*XI+lambda*H[XI]
