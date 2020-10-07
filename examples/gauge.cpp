// gauge.cpp
#include <iostream>
#include "symbolicc++.h"
using namespace std;

// Consider the partial differential Schroedinger equations under local gauge transformation
//  program we show that that after the transformation the two forms of equation are equivalent
//  the out of symbolic variable R must be zero

int main(void)
{
Symbolic i = sqrt(Number<int>(-1));
Symbolic x1("x1"), x2("x2"), x3("x3"), t("t");
Symbolic h("h"), m("m"), q("q");
Symbolic G("G"), GP("GP"), p("p"), pp("pp");
Symbolic A1("A1"), A2("A2"), A3("A3"),
         AP1("AP1"), AP2("AP2"), AP3("AP3"), U("U"), UP("UP");
Symbolic ep("ep");

G = G[x1,x2,x3,t]; GP = GP[x1,x2,x3,t];
p = p[x1,x2,x3,t]; pp = pp[x1,x2,x3,t]; ep = ep[x1,x2,x3,t];

A1 = A1[x1,x2,x3,t]; AP1 = AP1[x1,x2,x3,t];
A2 = A2[x1,x2,x3,t]; AP2 = AP2[x1,x2,x3,t];
A3 = A3[x1,x2,x3,t]; AP3 = AP3[x1,x2,x3,t];
U = U[x1,x2,x3,t]; UP = UP[x1,x2,x3,t];
GP = i*h*df(pp,t)+
     h*h/(2*m)*(df(pp,x1,2)+df(pp,x2,2)+df(pp,x3,2))+
     (-i*q*h)/(2*m)*(AP1*df(pp,x1)+AP2*df(pp,x2)+AP3*df(pp,x3))+
     (-i*q*h)/(2*m)*(df(pp*AP1,x1)+df(pp*AP2,x2)+df(pp*AP3,x3))-
     q*q/(2*m)*(AP1*AP1*pp+AP2*AP2*pp+AP3*AP3*pp)-q*UP*pp;
cout << GP << endl << endl;
G = GP[pp==p*exp(i*ep),AP1==A1+h/q*df(ep,x1),
       AP2==A2+h/q*df(ep,x2),AP3==A3+h/q*df(ep,x3),
       UP==U-h/q*df(ep,t)];
cout << G << endl << endl;
G = G*exp(-i*ep);
G = G[p==pp,A1==AP1,A2==AP2,A3==AP3,U==UP];
Symbolic R = GP - G;
cout << "R =" << R << endl;
return 0;
}
