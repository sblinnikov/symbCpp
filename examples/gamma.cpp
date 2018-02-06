// gamma.cpp

#include <iostream>
#include "symbolicc++.h"

int main(void)
{
using SymbolicConstant::i;
Symbolic I = Symbolic("",2,2).identity();
// Pauli matrices:
Symbolic sx = ((Symbolic(0),Symbolic(1)),
               (Symbolic(1),Symbolic(0)));
Symbolic sy = ((Symbolic(0),         -i),
               (          i,Symbolic(0)));
Symbolic sz = ((Symbolic(1),Symbolic(0)),
               (Symbolic(0),Symbolic(-1)));
// gamma matrices:
Symbolic g1 = kron(sy,sx), g2 = kron(sy,sy);
cout << "typo in g1=kron(sy,sz) in Steeb Hardy p.172 corrected, it must be kron(sy,sx)" << endl;
Symbolic g3 = kron(sy,sz), g4 = kron(sz,I);
cout << "g1 =" << g1 << endl;
cout << "g2 =" << g2 << endl;
cout << "g3 =" << g3 << endl;
cout << "g4 =" << g4 << endl;
Symbolic g5 = g1*g2*g3*g4;
cout << "g5 =" << g5 << endl;
cout << "all coincides with M.Veltman Diagrammatica, p.72" << endl;
return 0;
}
