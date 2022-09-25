// Casimir1.cpp
#include <iostream>
#include "symbolicc++.h"
using namespace std;
int main(void)
{
using SymbolicConstant::i;
Symbolic b("b"), bd("bd"), j("j"), k("k");
b = ~b; bd = ~bd; // noncommutative
Equations rules = (b[1]*bd[1]==1+bd[1]*b[1],
b[2]*bd[2]==1+bd[2]*b[2],
bd[2]*bd[1]==bd[1]*bd[2],
b[2]*b[1]==b[1]*b[2],
b[1]*bd[2]==bd[2]*b[1],
b[2]*bd[1]==bd[1]*b[2]);
Symbolic K0("K0"), Kp("Kp"), Km("Km");
K0 = (bd[1]*b[1]+bd[2]*b[2]+1)/2;
Kp = bd[1]*bd[2];
Km = b[1]*b[2];
Symbolic C1 = Km*Kp-Kp*Km; // commutator
C1 = C1.subst_all(rules);
cout << "C1=" << C1 << endl;
Symbolic C2 = K0*Kp-Kp*K0; // commutator
C2 = C2.subst_all(rules);
cout << "C2=" << C2 << endl;
Symbolic C3 = K0*Km-Km*K0; // commutator
C3 = C3.subst_all(rules);
cout << "C3=" << C3 << endl;
Symbolic C = K0*K0-(Kp*Km+Km*Kp)/2; // Casimir operator
C = C.subst_all(rules);
cout << "C=" << C << endl;
Symbolic R1 = K0*C-C*K0; // commutator with Casimir
R1 = R1.subst_all(rules);
cout << "R1=" << R1 << endl;
Symbolic R2 = Kp*C-C*Kp; // commutator with Casimir
R2 = R2.subst_all(rules);
cout << "R2=" << R2 << endl;
Symbolic R3 = Km*C-C*Km; // commutator with Casimir
R3 = R3.subst_all(rules);
cout << "R3=" << R3 << endl;
return 0;
}
