// fexpansion.cpp

#include <iostream>
#include "symbolicc++.h"
using namespace std;

int main(void)
{
using SymbolicConstant::i;
using SymbolicConstant::pi;
Symbolic x("x"), k("k"); 
Symbolic f1 = 2*x;
Symbolic f2 = 2* (1-x);
Symbolic r1 = integrate(f1*exp(-2*i*pi*k*x), x, 0, Symbolic (1)/2);
Symbolic r2 = integrate(f2*exp(-2*i*pi*k*x), x, Symbolic (1)/2,1 );
Symbolic ak = r1 + r2;
Symbolic a0 = integrate(f1,x,0,Symbolic(1)/2)
            + integrate(f2,x,Symbolic(1)/2,1);
cout << "a0 =" << a0 << endl;
cout << "ak =" << ak << endl;
return 0;
}
