// transformation.cpp

#include <iostream>
#include "symbolicc++.h"
using namespace std;

int main(void)
{
Symbolic v("v"), x("x"), y("y"), z("z"), B("B"), P("P"), Q("Q");
Symbolic a("a"), lam("lam"), m("m"), hb("hb"), E("E"), V0("V0");
v =v[y];
B = B[x];
P = P[x];
Q = Q[x];
Symbolic res1 = (df(Q,x)^2)*df(v,y,2)
                + (df(Q,x,2)-2/P*df(P,x)*df(Q,x))*df(v,y)
                + (2/(P^2)*(df(P,x)^2)-1/P*df(P,x,2)+B)*v;

cout << "res1 = " << res1 << endl;

res1 = res1[P==(cosh(x/a)^(2*lam)),Q==-(sinh(x/a)^2),B==2*m/(hb^2)*(E+V0/(cosh(x/a)^2))];
// cout << "res1 = " << res1 << endl;

res1 = res1[cosh(x/a)==sqrt(1+(sinh(x/a)^2))];
// cout << "res1 = " << res1 << endl;

res1 = res1[lam==(sqrt(8*m*V0*(a^2)/(hb^2)+1)-1)/4];

cout << "res1 = " << res1 << endl;

Symbolic res2 = res1[sinh(x/a)==sqrt(-z)];
cout << "res2 = " << res2 << endl;

return 0;
}

// The output is
//
// res1 = df(Q[x],x)^(2)*df(v[y],y,y)+df(Q[x],x,x)*df(v[y],y)-2*P[x]^(-1)*df(P[x],x)*df(Q[x],x)*df(v[y],y)+2*P[x]^(-2)*df(P[x],x)^(2)*v[y]-P[x]^(-1)*df(P[x],x,x)*v[y]+B[x]*v[y]
//
// res1 = 4*sinh(x*a^(-1))^(4)*a^(-2)*df(v[y],y,y)+4*sinh(x*a^(-1))^(2)*a^(-2)*df(v[y],y,y)-6*sinh(x*a^(-1))^(2)*a^(-2)*df(v[y],y)-2*a^(-2)*df(v[y],y)+2*(8*m*V0*a^(2)*hb^(-2)+1)^(1/2)*sinh(x*a^(-1))^(2)*a^(-2)*df(v[y],y)+2*(sinh(x*a^(-1))^(2)+1)^(-1)*m*V0*hb^(-2)*sinh(x*a^(-1))^(2)*v[y]-1/2*(8*m*V0*a^(2)*hb^(-2)+1)^(1/2)*a^(-2)*v[y]+1/2*a^(-2)*v[y]+2*m*hb^(-2)*E*v[y]+2*m*hb^(-2)*V0*(sinh(x*a^(-1))^(2)+1)^(-1)*v[y]
//
// res2 = 4*z^(2)*a^(-2)*df(v[y],y,y)-4*z*a^(-2)*df(v[y],y,y)+6*z*a^(-2)*df(v[y],y)-2*a^(-2)*df(v[y],y)-2*(8*m*V0*a^(2)*hb^(-2)+1)^(1/2)*z*a^(-2)*df(v[y],y)-2*(-z+1)^(-1)*m*V0*hb^(-2)*z*v[y]-1/2*(8*m*V0*a^(2)*hb^(-2)+1)^(1/2)*a^(-2)*v[y]+1/2*a^(-2)*v[y]+2*m*hb^(-2)*E*v[y]+2*m*hb^(-2)*V0*(-z+1)^(-1)*v[y]

