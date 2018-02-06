// matrixrep.cpp

#include <iostream>
#include "symbolicc++.h"
using namespace std;
int main (void)
{
Symbolic X("X"), K("K"), L("L"), pi("pi"), i("i");
Symbolic F = exp(i*K*X)/sqrt(2*pi);
Symbolic G = exp(-i*L*X)/sqrt(2*pi);
Equations rules = (exp(2*i*K*pi)==1,exp(2*i*L*pi)==1,
		   exp(-i*pi) ==-1, exp(i*pi) ==-1,
		   exp(i*K*pi+i*L*pi)==cos(pi*(L+K)),
		   cos(2*L*pi+pi) ==-1);
Symbolic R1 = integrate(F*X*G[L==K],X); // case K == L
cout << "R1 =" << R1 << endl;
Symbolic R2 = R1[X==pi]-R1[X==-pi];
cout << "R2[L==K] = " << R2 << endl;
// case K != L
R1 = integrate(F*X*G,X);
cout << "R1 = "<< R1 << endl;
R2 = R1[X==pi]-R1[X==-pi];
cout << "R2[L==K+I] = " << R2[L==K+1,rules] << endl;
// Special case K == L+1
cout << "R2[K==L+i] = " << R2[K==L+1,rules] << endl;
return 0;
}
