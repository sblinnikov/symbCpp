#include <iostream>
#include "symbolicc++.h"
using namespace std;

int main(void)
{
  Symbolic x("x");
  cout << integrate(x+1, x) <<endl;       // => 1/2*x^(2)+x
  Symbolic y("y");
  cout << df(y, x) << endl;               // => 0
  cout << df(y[x], x) << endl;            // => df(y[x],x)
  cout << df(exp(cos(y[x])), x) << endl ;
                             // => -sin(y[x])*df(y[x],x)*e^cos(y[x])
  return 0;
}

