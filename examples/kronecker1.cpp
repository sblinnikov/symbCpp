// kronecker1.cpp
#include <iostream>
#include "symbolicc++.h"
using namespace std;
int main(void)
{
int n = 3;
Matrix<Symbolic> I(n,n);
I.identity();
Matrix<Symbolic> X1(n,n);
X1[0][0] = 0; X1[0][1] = 0; X1[0][2] = 0;
X1[1][0] = 0; X1[1][1] = 0; X1[1][2] = -1;
X1[2][0] = 0; X1[2][1] = 1; X1[2][2] = 0;
Matrix<Symbolic> X2(n,n);
X2[0][0] = 0; X2[0][1] = 0; X2[0][2] = 1;
X2[1][0] = 0; X2[1][1] = 0; X2[1][2] = 0;
X2[2][0] = -1;
X2[2][1] = 0; X2[2][2] = 0;
Matrix<Symbolic> X3(n,n);
X3[0][0] = 0; X3[0][1] = -1; X3[0][2] = 0;
X3[1][0] = 1; X3[1][1] = 0; X3[1][2] = 0;
X3[2][0] = 0; X3[2][1] = 0; X3[2][2] = 0;
Matrix<Symbolic> R1(n*n,n*n);
Matrix<Symbolic> R2(n*n,n*n);
Matrix<Symbolic> C(n*n,n*n);
Matrix<Symbolic> T(n*n,n*n);
R1 = kron(X1,I) + kron(I,X1);
R2 = kron(X2,I) + kron(I,X2);
C = R1*R2-R2*R1;  // commutator
cout << "C = " << C << endl;
T = C - (kron(X3,I) + kron(I,X3));
cout << "T = " << T << endl;
return 0;
}
