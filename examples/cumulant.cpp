// cumulant.cpp
#include <iostream>
#include "symbolicc++.h"
using namespace std;
Symbolic Taylor(Symbolic u,const Symbolic &x,int n)
{
Symbolic series = u[x==0];
int fac = 1;
for(int j=1; j<=n;j++)
{
u = df(u,x);
fac = fac*j;
series += (u[x==0]*(x^j)/fac);
}
return series;
}

int main(void)
{
int fac, n=4;
Symbolic x("x"), a("a",n), b("b",n);
Symbolic y, P, Q;
fac = 1;
P = a(0);
Q = 0;
for(int i=1;i<n;i++)
{
fac *= i;
P += a(i)*(x^i)/fac;
Q += b(i)*(x^i)/fac;
}
cout << "P = " << P << endl;
cout << "Q = " << Q << endl;
cout << endl;
y = Taylor(exp(Q),x,n);
cout << "Taylor series expansion of exp(Q) = " << endl;
cout << y << endl;
cout << "Coefficient of x:"<< endl;
cout << "exp(Q) => " << y.coeff(x,1) << endl;
cout << "  P    => " << P.coeff(x,1) << endl;
cout << "Coefficient of x^2:"<< endl;
cout << "exp(Q) => " << y.coeff(x,2) << endl;
cout << "  P    => " << P.coeff(x,2) << endl;
cout << "Coefficient of x^3:"<< endl;
cout << "exp(Q) => " << y.coeff(x,3) << endl;
cout << "  P    => " << P.coeff(x,3) << endl;
cout << "Coefficient of x^4:"<< endl;
cout << "exp(Q) => " << y.coeff(x,4) << endl;
cout << "  P    => " << P.coeff(x,4) << endl;
return 0;
}
