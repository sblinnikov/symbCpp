//  inthelium.cpp
#include <iostream>
#include "symbolicc++.h"
using namespace std;

int main(void)
{
  Symbolic s("s"), r1("r1"), r2("r2");
  Symbolic g = 1/sqrt((r1^2)+(r2^2)-2*r1*r2*s);
  Symbolic res1 = integrate(g,s);
  cout << res1 << endl;
  Symbolic res2 = res1[s==1]-res1[s==-1];
  cout << res2 << endl;
  return 0;
}
