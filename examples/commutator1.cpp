//commutator1.cpp
// install symbolicc as described in ../README for libsymbcgf
// compile with (if dir inclide is above):
// g++ -I ../include -L ~/lib -o commutator1.exe commutator1.cpp -fno-elide-constructors -lsymbcgf
// result saved in
// commutator1.out

#include <iostream>
#include "symbolicc++.h"
using namespace std;
const int n = 3;
Symbolic x("x",n);
Symbolic commutator(const Symbolic &V,const Symbolic &W)
{
    Symbolic U(Symbolic(0),V.rows());
    for(int k=0;k<n;k++)
        for(int j=0;j<n;j++)
            U(k) += (V(j)*df(W(k),x(j))-W(j)*df(V(k),x(j)));
        return U;

}
int main(void)
{
    Symbolic hbar("hbar");
    using SymbolicConstant::i;
    Symbolic Lx("",n), Ly("",n), Lz("",n), R("",n);
    Lx(0) = 0;
    Lx(1) = i*hbar*x(2);
    Lx(2) = -i*hbar*x(1);
    Ly(0) = -i*hbar*x(2);
    Ly(1) = 0;
    Ly(2) = i*hbar*x(0);
    Lz(0) = i*hbar*x(1);
    Lz(1) = -i*hbar*x(0);
    Lz(2) = 0;
// [Lx,Ly]
    R = commutator(Lx,Ly);
     cout << R << endl;
     cout << endl;
// [Lx,Ly] = -[Ly,Lx]
     R = commutator(Lx,Ly) + commutator(Ly,Lx);
     cout << R << endl;
     cout << endl;
     // [Lx,Ly+Lz] = [Lx,Ly]+[Lx,Lz]
     R = commutator(Lx,Ly+Lz)-commutator(Lx,Ly)-commutator(Lx,Lz);
     cout << R << endl;
     cout << endl;
     // Jacobi identity [[Lx,Ly],Lz]+[[Lz,Lx],Ly]+[[Ly,Lz],Ly]=0
     R = commutator(commutator(Lx,Ly),Lz)+ commutator(commutator(Lz,Lx),Ly)+ commutator(commutator(Ly,Lz),Lx);
     cout << R << endl;
     return 0;

    }

//     The output is
//
//     [-hbar^(2)*x1]
//     [hbar^(2)*x0]
//     [  0   ]
//
//     For the other two solutions we ﬁnd the zero vector.
