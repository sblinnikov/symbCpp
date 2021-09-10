// wkb.cpp
// install symbolicc as described in ../README for libsymbcgf
// compile with (if dir inclide is above):
// g++ -I ../include -L ~/lib -o wkb.exe wkb.cpp -fno-elide-constructors -lsymbcgf
// result saved in
// wkb.out

#include <iostream>
#include "symbolicc++.h"
using namespace std;

int main(void)
{
using SymbolicConstant::i;
Symbolic S("S"), hb("hb"), A("A"), V("V"), EN("EN");
Symbolic x("x"), m("m");

S = S[x]; A = A[x]; V = V[x];
Symbolic u = exp(i*(S-i*hb*ln(A))/hb); // equation (2)

// eigenvalue equation (1)
Symbolic R1 = df(u,x,2) + (2*m)*(EN-V)*u;
cout << "R1 = " << R1 << endl;

// find equations (3)
Symbolic R2 = R1/u;
cout << "R2 = " << R2 << endl;
cout << (R2.coeff(i,1)==0) << endl;
cout << (R2.coeff(i,0)==0) << endl;
return 0;
}

// The output is
// R1 = i*df(S[x],x,x)*hb^(-1)*e^(i*S[x]*hb^(-1)+ln(A[x]))-df(S[x],x)^(2)*hb^(-2)*e^(i*S[x]*hb^(-1)+ln(A[x]))
// +2*i*df(S[x],x)*hb^(-1)*df(A[x],x)*A[x]^(-1)*e^(i*S[x]*hb^(-1)+ln(A[x]))+df(A[x],x,x)*A[x]^(-1)*e^(i*S[x]*hb^(-1)+ln(A[x]))+2*m*EN*e^(i*S[x]*hb^(-1)+ln(A[x]))-2*m*V[x]*e^(i*S[x]*hb^(-1)+ln(A[x]))
// R2 = i*df(S[x],x,x)*hb^(-1)-df(S[x],x)^(2)*hb^(-2)+2*i*df(S[x],x)*hb^(-1)*df(A[x],x)*A[x]^(-1)+df(A[x],x,x)*A[x]^(-1)+2*m*EN-2*m*V[x]
// df(S[x],x,x)*hb^(-1)+2*df(S[x],x)*hb^(-1)*df(A[x],x)*A[x]^(-1)==0
// -df(S[x],x)^(2)*hb^(-2)+df(A[x],x,x)*A[x]^(-1)+2*m*EN-2*m*V[x]==0
