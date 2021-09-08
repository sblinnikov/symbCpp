// morse.cpp
#include <iostream>
#include "symbolicc++.h"
using namespace std;

int main(void)
{
using SymbolicConstant::i;
Symbolic x("x"), y("y"), c1("c1"), c2("c2"), f("f");Symbolic Dy("Dy");
Dy = ~Dy;
y = ~y;
f=~f;
Equations rules;
rules = (rules,(f[y],Dy*f[y]==df(f[y],y)+f[y]*Dy));
Symbolic T1 = -1/(2*c1)*y*Dy*Dy + c2/(2*y) - c1*y/2;
Symbolic T2 = -i*y*Dy;Symbolic T3 = -1/(2*c1)*y*Dy*Dy + c2/(2*y) + c1*y/2;
Symbolic commT1T2 = (T1*T2-T2*T1).subst_all(rules);
cout << "[T1,T2]=" << commT1T2;
if(commT1T2==-i*T3) cout << " = -i*T3";
cout << endl;
Symbolic commT2T3 = (T2*T3-T3*T2).subst_all(rules);
cout << "[T2,T3]=" << commT2T3;
if(commT2T3==i*T1) cout << "=i*T1";
cout << endl;
Symbolic commT3T1 = (T3*T1-T1*T3).subst_all(rules);
cout << "[T3,T1]=" << commT3T1;
if(commT3T1==i*T2) cout << "=i*T2";
cout << endl;
Symbolic C = T3*T3-T2*T2-T1*T1;
cout << "C=" << C.subst_all(rules) << endl;
return 0;
}

// The output is
// [T1,T2]=1/2*y*Dy^(2)*c1^(-1)*i-1/2*y^(-1)*i*c2-1/2*y*i*c1=-i*T3
// [T2,T3]=1/2*y^(-1)*i*c2-1/2*y*i*c1-1/2*y*i*Dy^(2)*c1^(-1)=i*T1
// [T3,T1]=y*Dy=i*T2C=c2*c1
