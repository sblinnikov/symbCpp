// pade.cpp

#include <iostream>
#include "symbolicc++.h"
using namespace std;

Symbolic Taylor(Symbolic u,Symbolic &x,int n)
{
  Symbolic series = u[x==0];
  int fac = 1, j;
  for (j=1; j<=n; j++)
  {
   u = df(u,x);
   fac = fac*j;
   series += u[x==0]/fac*(x^j);
  }
return series;
}

Symbolic Pade(const Symbolic &f,Symbolic &x,int N,int M)
{
int i, j, k, N1 = N+1, M1 = M+1, n = M + N1;
Symbolic y, z;
Symbolic a("a",n);
Symbolic P(Symbolic(0),N1,N1), Q(Symbolic(0),N1,N1);
y = Taylor(f,x,n);
for(i=0;i<n;i++) a(i) = y.coeff(x,i);
for(i=0;i<N;i++)
 for(j=0;j<N1;j++)
   {
    k = M-N+i+j+1;
    if(k >= 0) P(i,j) = Q(i,j) = a(k);
    else       P(i,j) = Q(i,j) = 0;
   }

for (i=0;i<N1 ;i++)
{
 for(j=N-i;j<M1 ;j++)
 {
   k = j-N+i;
   if(k >= 0) P(N,i) += a(k)*(x^j);
 }
 Q(N,i) = x^(N-i);
}
y = det(P);
z = det(Q);
return y/z;
}

int main(void)
{
Symbolic x("x"), f;
f = sin(x);
cout << Pade(f,x,1,1) << endl;
cout << Pade(f,x,2,2) << endl;
cout << Pade(f,x,3,3) << endl;
return 0;
}
