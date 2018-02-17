// su3.cpp
//  Lie Algebra su(3) and Commutation Relations
//
// The semi-simple Lie algebra su(m) consists of all m x m matrices X over C
// with the conditions
//
//            X* = -X                  (1)
//
// i.e, X is skew-hermitian and tr X = 0.
// Thus exp(X) is a unitary matrix. With U = exp(X) we have
//            U* = U^{-1} = exp(-X).   (2)
//
//  In the Symbolic C++ program we implement the matrices \lambda_1, ... \lambda_8,
// denoted as Li, with two commuting diagonal matrices L3 and L8 (i.e. rank of su(3) is two),
// and evaluate the commutator of \lambda_1  and \lambda_2 and also the trace of \lambda_1*\lambda_2^T,
// where T denotes the transpose.
//


#include <iostream>
#include "symbolicc++.h"
using namespace std;

int main(void)
{
using SymbolicConstant::i;
Symbolic L1 = (((Symbolic) 0,i,0),((Symbolic) i,0,0),
               ((Symbolic) 0,0,0));
Symbolic L2 = (((Symbolic) 0,1,0),((Symbolic) -1,0,0),
              ((Symbolic) 0,0,0));
Symbolic L3 = (((Symbolic) i,0,0),((Symbolic) 0,-i,0),
              ((Symbolic) 0,0,0));
Symbolic L4 = (((Symbolic) 0,0,i),((Symbolic) 0,0,0),
              ((Symbolic) i,0,0));
Symbolic L5 = (((Symbolic) 0,0,1),((Symbolic) 0,0,0),
              ((Symbolic) -1,0,0));
Symbolic L6 = (((Symbolic) 0,0,0),((Symbolic) 0,0,i),
              ((Symbolic) 0,i,0));
Symbolic LZ = (((Symbolic) 0,0,0),((Symbolic) 0,0,1),
              ((Symbolic) 0,-1,0));
Symbolic L8 = (((Symbolic) i,0,0),((Symbolic) 0,i,0),
              ((Symbolic) 0, 0, -2*i) )/sqrt(Symbolic(3));
// commutator
cout << L1*L2-L2*L1 << endl;
// trace
Symbolic tr;
tr = trace(L1*L2.transpose());
cout << "trace is " << tr << endl;
return 0;
}
