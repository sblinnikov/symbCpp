/* Steeb Hardy Chapter 24 Radial Symmetric Potential and Bound States */
// scattering3.cpp
#include <iostream>
#include "symbolicc++.h"
using namespace std;

int main(void)
{
Symbolic u1("u1"), u2("u2"), v1("v1"), v2("v2"), r("r");
Symbolic hb("hb"), m("m"), en("en"), alp("alp"), alph("alph"),bet("bet"), V0("V0"), c1("c1"), c2("c2"), a("a");
u1 = u1[r]; u2 = u2[r]; v1 = v1[r]; v2 = v2[r];

Symbolic r1 = -(hb^2)/2/m*(df(u1,r,2)+(2/r)*df(u1,r))-en*u1;
cout << "r1 =" << r1 << endl;
Symbolic r2 = -(hb^2)/2/m*(df(u2,r,2)+(2/r)*df(u2,r))-(V0+en)*u2;
cout << "r2 =" << r2 << endl;
Symbolic r3 = r1[u1==v1/r,u2==v2/r]*2*m*r;
cout << "r3 =" << r3 << endl;
Symbolic r4 = r2[u1==v1/r,u2==v2/r]*2*m*r;
cout << "r4 =" << r4 << endl;
Symbolic r5 =r3[v1==c1*exp(-alp*r),v2==c2*sin(bet*r)]/exp(-alph*r);
cout << "r5 =" << r5 << endl;
Symbolic r6 =r4[v1==c1*exp(-alp*r),v2==c2*sin(bet*r)]/sin(bet*r);
cout << "r6 =" << r6 << endl;
Equations list1 = solve(r5/exp(-r*alp+r*alph)==0,alp);
cout << "list1' "<< endl << list1 << endl;
Equations list2 = solve(r6==0,bet);
cout << "list2' "<< endl << list2 << endl;

Symbolic nv1 = c1*exp(-alp*r);
Symbolic nv2 = c2*sin(bet*r);

Symbolic r7 = (df(nv1,r)/nv1-df(nv2,r)/nv2)[r==a];
cout << "r7 =" << r7 << endl;
Equations list3 = solve(r7==0,alp);
cout << "list3' "<< endl << list3 << endl;
return 0;
}


