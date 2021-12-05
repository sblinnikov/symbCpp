// hydrogen1.cpp

#include <iostream>
#include "symbolicc++.h"
using namespace std;

int main(void)
{
    Symbolic a("a"), ep("ep"), hb("hb"), m("m");
    Symbolic pi("pi"), q("q"), r("r");
    Symbolic C("C"), En("En");
    Symbolic u = C*exp(-a*r);
    Symbolic r1 = df(u,r,2) + (2/r)*df(u,r) + (2*m)/(hb^2)*En*u+ (2*m*q*q)/(4*pi*ep*hb*hb)*(1/r)*u;
    cout << "r1 = " << r1 << endl;
    Symbolic r2 = r1/u;
    cout << "r2 = " << r1 << endl;
    Symbolic r3 = r2*r;
    cout << "r3 = " << r1 << endl;
    Symbolic r4 = r3.coeff(r,1);
    cout << "r4 = " << r1 << endl;
    Symbolic r5 = r3.coeff(r,0);
    cout << "r5 = " << r1 << endl;
    Equations solna = solve(r5==0,a);
    Equations solnEn = solve(r4[solna]==0,En);
    cout << solna << endl;
    cout << solnEn << endl;
    
    return 0;
    
}
