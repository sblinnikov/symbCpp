// unitary1.cpp
// compile with
// g++ -I ./include -L ~/lib -o unitary1.exe unitary1.cpp -fno-elide-constructors -lsymbcgf
// result saved in
// unitary1.out

#include <iostream>
#include <list>
#include <symbolicc++.h>
using namespace std;

list<Symbolic> mgs(const list<Symbolic> &x,
                   list<Symbolic> G = list<Symbolic>())
{list<Symbolic>::const_iterator xj;
list<Symbolic>::iterator y;
Symbolic gj;

for(xj=x.begin();xj!=x.end();xj++)
{
gj = *xj;
for(y = G.begin();y != G.end();y++)
 gj -= ((*y).transpose()*(*xj))*(*y);
 if(gj != 0*gj)
 G.push_back(gj/sqrt(gj.transpose()*gj));
} 
return G;
} 

Symbolic unitary(const Symbolic &psi,const Symbolic &phi)
{
int n = psi.rows();
 list<Symbolic> e, gpsi, gphi;
 list<Symbolic>::iterator j, k;
 Symbolic U = 0;
 for(int i=0;i<n;i++)
 {
 Symbolic ei("ei",n);
 ei *= 0; ei(i) = 1;
 e.push_back(ei);
 }
 
 gpsi.push_back(psi); gphi.push_back(phi);
 list<Symbolic> G_psi = mgs(e,gpsi);
 list<Symbolic> G_phi = mgs(e,gphi);
 
 for (j =G_psi. begin(), k=G_phi.begin();j!=G_psi.end();j++, k++)
  U += (*k)*j->transpose();
return U;
}

int main(void)
{
Symbolic psi, phi;
Symbolic sqrt2 = sqrt(Symbolic(2)), sqrt3 = sqrt(Symbolic(3));
cout << "Hadamard transform" << endl;
psi = Symbolic("psi",2); phi = Symbolic("phi",2);
psi(0) = 1; psi(1) = 0;
phi(0) = 1/sqrt2; phi(1) = 1/sqrt2;
cout << unitary(psi, phi) << endl;
cout << "Bell basis transform" << endl;
psi = Symbolic("psi",4); phi = Symbolic("phi",4);
psi(0) = 0; psi(1) = 0; psi(2) = 0; psi(3) = 1;
phi(0) = 1/sqrt2; phi(1) = 0; phi(2) = 0; phi(3) = 1/sqrt2;
cout << unitary(psi, phi) << endl;
cout << "GHZ -> W state transform" << endl;
psi = Symbolic("psi",8); phi = Symbolic("phi",8);
psi(0) = 1/sqrt2;
psi(1) = psi(2) = psi(3) = psi(4) = psi(5) = psi(6) = 0;
psi(7) = 1/sqrt2;
phi(0) = 0; phi(1) = 1/sqrt3; phi(2) = 1/sqrt3; 
phi(3) = 0; phi (4) = 1/sqrt3;
phi (5) = phi (6) = phi(7) = 0;
cout << unitary(psi,phi) << endl; 
return 0;
}
