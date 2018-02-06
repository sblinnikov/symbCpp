// heisenberg.cpp

#include <iostream>
#include "symbolicc++.h"
using namespace std;
int main(void)
{
  Symbolic sx("",2,2), sy("",2,2), sz("",2,2);
  Symbolic i("i"), hb("hb"), om("omega");
  sx = ((Symbolic(0) ,Symbolic(1)), (Symbolic(1) ,Symbolic(0)));
  sy = ((Symbolic(0),          -i),( i           ,Symbolic(0)));
  sz = ((Symbolic(1), Symbolic(0)),(Symbolic(0),Symbolic(-1)));
  cout << "sx = " << sx << endl;
  cout << "sy = " << sy << endl;
  cout << "sz = " << sz << endl;
  Symbolic H = hb*om*sz;
  Symbolic sxt = -i/hb*(sx*H-H*sx); // commutator
  Symbolic sxtt = -i/hb*(sxt*H-H*sxt); // commutator
  cout << "H = " << H << endl;
  cout << "sxt = " << sxt << endl;
  cout << "sxtt = " << sxtt << endl;
  cout << "sxtt = " << sxtt[i*i==-1] << endl;
  return 0;
}
