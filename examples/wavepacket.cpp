// wavepacket.cpp
#include <iostream>
#include "symbolicc++.h"
using namespace std;
int main(void)
{
using SymbolicConstant :: i;
Symbolic xt ("xt"), tt ("tt"), B("B");
Symbolic f1 = B/(sqrt(1+i*tt));
Symbolic f2 = exp(-(xt*xt)/(2*(1+i*tt)));
Symbolic psit = f1*f2;
Symbolic res1 = df(psit,xt,2)/2;
res1 = res1/f2;
Symbolic res2 = i*df(psit,tt);
res2 = res2/f2;
Symbolic result1 = res1 + res2;
cout << "result1 = " << result1 << endl << endl;
Symbolic f1s = f1[i==-i];
Symbolic f2s = f2[i==-i];
Symbolic psist = f1s*f2s;
Symbolic res3 = df(psist,xt,2)/2;
res3 = res3/f2s;
Symbolic res4 = -i*df(psist,tt);
res4 = res4/f2s;
Symbolic result2 = res3 + res4;
cout << "result2 = " << result2 << endl << endl;
return 0;
}
