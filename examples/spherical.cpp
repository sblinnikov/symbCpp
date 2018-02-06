// spherical.cpp

#include <iostream>
#include <map>
#include "symbolicc++.h"

using namespace std;

using SymbolicConstant::i;
using SymbolicConstant::pi;

int factorial(int n)
{
int result=1;
for(int i=2; i<=n; i ++) result *= i;
return result;
}

Symbolic legendre(const int &n,const Symbolic &x)
{
  static UniqueSymbol u;
  // store computed polynomials for efficiency
  static map<int,Symbolic> l;
  map<int,Symbolic>::iterator i = l.find(n);
  if(n <= 0) return 1;
  if(n==1) return x;
  if(i != l.end()) return (i->second)[u==x];
  l[n] = ((2*n-1)*u*legendre(n-1,u)+(1-n)*legendre(n-2,u))/n;
  return l[n][u==x];
  }

Symbolic asslegendre(const int &l,const int &m,
		     const Symbolic &x)
{
  static UniqueSymbol u;
  // store computed polynomials for efficiency
  static map<pair<int,int>,Symbolic> al;
  pair<int,int> lm = make_pair(l,m);
  map<pair<int,int>,Symbolic>::iterator i = al.find(lm);
  if(i != al.end()) return (i->second)[u==x];
  al [lm]= ((1-u*u)^(Symbolic(abs(m))/2))
      *df(legendre(l,u),u,abs(m));
  return al[lm][u==x];
}

Symbolic Y(int l,int m,const Symbolic &phi,const Symbolic &w)
{
  Symbolic a, b, u("u"), result;
  int absm = abs(m);
  a = asslegendre(l,m,u);
  a = a[u==cos(w)];
  if(m>0 && m%2) a = -a;
  b = sqrt((2*l+1)*factorial(l-absm)/(4*factorial(l+absm)*pi));
  result = a*b*exp(i*m*phi);
  return result;
}

int main(void)
{
  int n=6;
  Symbolic phi ("phi "), w("w"), result;

  for(int i=0;i<=n;i++)
  {
   for(int j=-i;j<=i;j++)
    {
     result = Y(i,j,phi,w);
     result = result [cos(w)*cos(w)==1-sin(w)*sin(w)];
     cout << "Y(" << i <<"," << j << ") = " << result << endl;
    }
     cout << endl;
  }
    return 0;
}
