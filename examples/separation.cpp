#include <iostream>
#include "symbolicc++.h"
using namespace std;

int main(void)
{
Symbolic x("x"), t("t"), Tm("Tm"), V("V"), u("u");
Symbolic hb("hb"), i("i"), m("m");
Tm = Tm[t]; 
u = u[x]; 
V = V[x];
Symbolic psi = Tm*u;
// Schroedinger equation 
Symbolic r1 = i*hb*df(psi,t)+df(psi,x,2)*(hb^2)/(2*m)-V*psi;
Symbolic r2 = r1/Tm/u;
Symbolic r3 = r2.coeff(hb,2) + r2.coeff(hb,0);
Symbolic r4 = r2.coeff(hb,1);
cout << "r1 = " << r1 << endl;
cout << "r2 = " << r2 << endl;
cout << "r3 = " << r3 << endl;
cout << "r4 = " << r4 << endl;
 return 0;
}
