/* Scattering in One-Dimension, Steeb Hardy Ch.30,  p.69 */

// scattering.cpp
#include <iostream>
#include "symbolicc++.h"
using namespace std;

int main(void)
{
    using SymbolicConstant::i;
    Symbolic A("A"), B("B"), C("C"), D("D"), E("E"), F("F"), G("G");
    Symbolic p1("p1"), p2("p2"), q("q"), d("d"), hb("hb");

    Symbolic ul = A*exp(i*p1*q/hb)+B*exp(-i*p1*q/hb);
    Symbolic um = G*exp(i*p2*q/hb)+F*exp(-i*p2*q/hb);
    Symbolic ur = C*exp(i*p1*q/hb);
    Symbolic ul1 = df(ul,q);
    Symbolic um1 = df(um,q);
    Symbolic ur1 = df(ur,q);

    Symbolic B1 = ul[q==0]-um[q==0];
    Symbolic B2 = um[q==d]-ur[q==d];
    Symbolic B3 = ul1[q==0]-um1[q==0];
    Symbolic B4 = um1[q==d]-ur1[q==d];

    Equations L1 = solve(B1==0,F);
    cout << L1 << endl;
    Equations L2 = solve(B3[L1]==0,G);
    cout << L2 << endl;
    Equations L3 = solve(B2[L1][L2]==0,C);
    cout << L3 << endl;
    Equations L4 = solve(hb*B4[L1][L2][L3]==0,B);
    cout << L4 << endl;

    Symbolic res = rhs(L4,B)/A;
    cout << "B/A = " << res << endl << endl;
    Symbolic denom =
       -i*(((p1+p2)^2)*exp(-i*p2*d/hb)-((p1-p2)^2)*exp(i*p2*d/hb))/2/p2;
    Symbolic numer = res.coeff(1/denom);
    cout << "numerator = " << i*2*p2*exp(i*p2*d/hb)*numer << endl;
    cout << "denominator = " << i*2*p2*exp(i*p2*d/hb)*denom << endl;
    return 0;
}

/* The output simplifies to equation (7).

numerator = p2^(2)*e^(2*i*p2*d*hb^(-1))-p2^(2)-e^(2*i*p2*d*hb^(-1))*p1^(2)+p1^(2)
denominator = p1^(2)+2*p2*p1+p2^(2)-e^(2*i*p2*d*hb^(-1))*p1^(2)+2*p2*e^(2*i*p2*d*hb^(-1))*p1-p2^(2)*e^(2*i*p2*d*hb^(-1))


In the program we evaluate B/A for the case $E>V_0$.

We find that
\[
{B \over A}= frac{ (p_1^2−p_2^2)(1−e^{2ip_2d/\hbar)}}{(p_1+p_2)^2−(p_1−p_2)^2 e^{2ip2d/\hbar}}.     (7)
\]
Exercise. Solve the case for $E<V_0$.

*/

