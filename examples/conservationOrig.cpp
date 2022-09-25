// conservation.cpp
#include <iostream>
#include "symbolicc++.h"
using namespace std;
int main(void)
{
Symbolic psi("psi"), psis("psis"), x("x"), t("t"), V("V");
Symbolic hb("hb"), i("i"), m("m");
psi = psi[x,t];
psis = psis[x,t];
Symbolic rho = psis*psi;
Symbolic r1 = df(rho,t);
Symbolic r2 = r1[df(psi,t)==i*hb/(2*m)*df(psi,x,2)-i*V*psi];
Symbolic r3 = r2[df(psis,t)==-i*hb/(2*m)*df(psis,x,2)+i*V*psis];
Symbolic s = -i*hb/(2*m)*(psis*df(psi,x)-psi*df(psis,x));
Symbolic r4 = df(s,x);
cout << "result = " << r4 + r3 << endl;
return 0;
}

// The output is
//
// result = 0

