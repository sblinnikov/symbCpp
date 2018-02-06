// harmonic2.cpp
#include <iostream>
#include "symbolicc++.h"
using namespace std;

int main(void)
{
Symbolic a("a"), xi("xi"), m("m"), lam("lambda"), x("x");
Symbolic f = a[m]*(xi^m)+a[m+1]*(xi^(m+1))+a[m+2]*(xi^(m+2)); 
Symbolic R1 = df(f,xi);
R1 = -2*R1*xi;
cout << "R1 =" << R1 << endl;

Symbolic R2 = df(f,xi,2);
cout << "R2 def =" << R2 << endl;

R2 = R2 [m==m+2];
cout << "R2 m+2 =" << R2 << endl;

Symbolic R3 = R2 + R1 + lam*f;
cout << "R3 =" << R3 << endl;
Symbolic R4 = R3/(xi^m);
cout << "R4 =" << R4 << endl;
Symbolic R5 = R4.coeff(xi,2);
cout << "R5 =" << R5 << endl;
Symbolic R6 = R5[m==m-2];
cout << "R6 =" << R6 << endl << endl;
Equations R7 = solve(R6==0,a[m+2]);
cout << R7 << endl; 
//Equations R8 = solve(R6==0,x);
//cout << R8 << endl; 
return 0;
}
