// conservation.cpp

#include <iostream>
#include "symbolicc++.h"
using namespace std;

int main(void)
{
Symbolic psi("psi"), psis("psis"), x("x"), t("t"), V("V");
Symbolic hb("hb"), i("i"), m("m"), a("a");
psi = psi[x,t]; 
psis = psis[x,t];
Symbolic rho = psis*psi;
Symbolic r1 = df(rho,t);
Symbolic r2 = r1[df(psi,t)==i*hb/(2*m)*df(psi,x,2)-i*V*psi];
Symbolic r3 = r2[df(psis,t)==-i*hb/(2*m)*df(psis,x,2)+i*V*psis];

Symbolic s = -i*hb/(2*m)*(psis*df(psi,x)-psi*df(psis,x));
Symbolic r4 = df(s,x);
cout << "result must be zero" << endl; 
cout << "result =" << r4 + r3 << endl; 
//In SymbolicC++ differentiation is df and  integration is integrate. 
//For example:
cout << "df((x^3)+2*x,x) must be  3*x^(2)+2" << endl;
cout << df((x^3)+2*x,x) << endl; // 3*x^(2)+2
cout << "integrate((x^2)+1,x) must be  1/3*x^(3)+x" << endl;
cout << integrate((x^2)+1,x) << endl; // 1/3*x^(3)+x
//command for solving equations is solve. For example:
cout << solve((x^2)+(a+1)*x+a==0, x) << endl;
return 0;
}
