// lplmlz.cpp
// install symbolicc as described in ../README for libsymbcgf
// compile with (if dir include is above):
// g++ -I ../include -L ~/lib -o lplmlz.exe lplmlz.cpp -fno-elide-constructors -lsymbcgf
// result saved in
// lplmlz.out

#include <iostream>
#include "symbolicc++.h"
using namespace std;

int main(void)
{
    using SymbolicConstant::i;
    Symbolic hb("hb"), u("u"), theta("theta"), phi("phi");
    u = u[theta,phi];
    Symbolic LP =
    hb*exp(i*phi)*(df(u,theta)+i*cos(theta)/sin(theta)*df(u,phi));
    Symbolic LM =
    hb*exp(-i*phi)*(-df(u,theta)+i*cos(theta)/sin(theta)*df(u,phi));
    Symbolic LZ = -i*hb*df(u,phi);
    // commutator of LM and LP
    cout << "The commutator is " << LM[u==LP]-LP[u==LM] << endl;

    // evaluation of L2 = (LX^2)+(LY^2)+(LZ^2)
    Symbolic L2 = LM[u==LP]/2+LP[u==LM]/2 + LZ[u==LZ];
    cout << "L2 = "<< L2 << endl;

    // commutator of L2 and LP
    cout << "RES = " << L2[u==LP]-LP[u==L2] << endl;
    return 0;
    }

//     The output is
//     The commutator is 2*hb^(2)*i*df(u[theta,phi],phi)
//     L2 = -hb^(2)*df(u[theta,phi],theta,theta)
//     -hb^(2)*cos(theta)*sin(theta)^(-1)*df(u[theta,phi],theta)
//     -hb^(2)*cos(theta)^(2)*sin(theta)^(-2)*df(u[theta,phi],phi,phi)
//     -hb^(2)*df(u[theta,phi],phi,phi
