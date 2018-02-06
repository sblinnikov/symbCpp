// variance.cpp

#include <iostream>
#include "symbolicc++.h"
using namespace std;

int main(void)
{
using SymbolicConstant::i;
Symbolic theta("theta");
Symbolic sx = (((Symbolic) 0, 1),((Symbolic) 1, 0));
cout << " sx = (((Symbolic) 0, 1),((Symbolic) 1, 0)) gives Pauli matrix sigma_x" << endl;
cout << " sx == matrix((0, 1),( 1, 0))"  << endl;
Symbolic sx2 = sx*sx;
cout << " vector psi defined as psiT = (cos(theta),sin(theta))" << endl;
Symbolic psiT = (cos(theta),sin(theta));
cout << " Symbolic psi = psiT.transpose()" << endl;
Symbolic psi = psiT.transpose();
cout << " variance by definition is r1 = psiT*sx^2*psi-((psiT*sx*psi)^2)" << endl;
Symbolic r1 = psiT*sx2*psi-((psiT*sx*psi)^2);
cout << "r1 =" << r1[(sin(theta)^2)==1-(cos(theta)^2) ] << endl;

Symbolic h = (((Symbolic) 1/sqrt(Symbolic(2)),
               1/sqrt(Symbolic(2))),
//              (Symbolic) 1/sqrt(Symbolic(2))),
             ((Symbolic) 1/sqrt(Symbolic(2)),
              -1/sqrt(Symbolic(2))));
//             (Symbolic) -1/sqrt(Symbolic(2))));
Symbolic h2 = h*h;
Symbolic r2 = psiT*h2*psi-((psiT*h*psi)^2);
cout << "r2 =" << r2[(sin(theta)^2)==1-(cos(theta)^2)] << endl;

Symbolic sy = (((Symbolic) 0,-i),((Symbolic) i,0));
Symbolic phiT = 1/sqrt(Symbolic(2))*(Symbolic(1), 0, 0, 1);
Symbolic phi = phiT.transpose();
Symbolic result3 = phiT*(kron(sy,sy)*kron(sy,sy))*phi-((phiT*(kron(sy,sy))*phi)^2);
cout << "r3 ="<< result3 << endl;
return 0;
}
