// spin1.cpp
// install symbolicc as described in ../README for libsymbcgf
// compile with (if dir include is above):
// g++ -I ../include -L ~/lib -o spin1.exe spin1.cpp -fno-elide-constructors -lsymbcgf
// result saved in
// spin1.out

#include <iostream>
#include "symbolicc++.h"

using namespace std;

int main(void)
{
    using SymbolicConstant::i;
    Symbolic hb("hb"), sqrt2 = sqrt(Symbolic(2));
    Symbolic sp = (((Symbolic) 0,1,0),((Symbolic) 0,0,1),((Symbolic) 0,0,0))*sqrt2*hb;
    Symbolic sm = (((Symbolic) 0,0,0),((Symbolic) 1,0,0),((Symbolic) 0,1,0))*sqrt2*hb;
    Symbolic sx = (((Symbolic) 0,1,0),((Symbolic) 1,0,1),((Symbolic) 0,1,0))*hb/sqrt2;
    Symbolic sy = (((Symbolic) 0,-i,0),((Symbolic) i,0,-i),((Symbolic) 0,i,0))*hb/sqrt2;
    Symbolic sz = (((Symbolic) 1,0,0),((Symbolic) 0,0,0),((Symbolic) 0,0,-1))*hb;
    Symbolic U = (((Symbolic)-1,0,1),((Symbolic)-i,0,-i),((Symbolic) 0,sqrt2,0))/sqrt2;
    Symbolic Ud = U.transpose()[i==-i];
    Symbolic sxp = U*sx*Ud;cout << "sxp = " << sxp << endl;
    Symbolic eta("eta");
    Symbolic eeq = det(sxp-eta*sxp.identity());
    cout << "Eigenvalues of sxp : " << endl<< (solve(eeq/eta==0,eta),eta==0) << endl;
    Symbolic s2 = sx*sx+sy*sy+sz*sz;
    cout << "s2 = " << s2 << endl;
    return 0;
    }

// output is:
//
// sxp =
// [  0     0     0  ]
// [  0     0   -i*hb]
// [  0    hb*i   0  ]
//
// Eigenvalues of sxp :
// [ eta == -1/2*(4)^(1/2)*hb,
//   eta == 1/2*(4)^(1/2)*hb,
//   eta == 0 ]
//
// s2 =
// [2*hb^(2)     0        0   ]
// [    0    2*hb^(2)     0   ]
// [    0        0    2*hb^(2)]
