// analy.cpp
#include <iostream>
#include "symbolicc++.h"
using namespace std;
int main(void)
{
Symbolic a("a"), b("b"), x("x"), En("En");
Symbolic u1 = exp(-a*(x^4)/4);
Symbolic V1 = (a^2)*(x^6)-3*a*(x^2);
Symbolic res1 = -df(u1,x,2)+V1*u1 - En*u1;
cout << "res1 = " << res1 << endl;
Symbolic res2 = res1/u1;
cout << "res2 = " << res2 << endl;
Equations res3 = solve(res2==0,En);
cout << res3 << endl;
// general case
Symbolic u2 = exp(-a*(x^4)/4-b*(x^2)/2);
Symbolic V2 = (a^2)*(x^6)+2*a*b*(x^4)+((b^2)-3*a)*(x^2);
Symbolic res4 = -df(u2,x,2)+V2*u2-En*u2;
cout << "res4 = " << res4 << endl;
Symbolic res5 = res4/u2;
cout << "res5 = " << res5 << endl;
Equations res6 = solve(res5==0,En);
cout << res6 << endl;
return 0;
}
//The output is given by
//res1 = -En*e^(-1/4*a*x^(4))
//res2 = -En[En==0]
//res4 = b*e^(-1/4*a*x^(4)-1/2*b*x^(2))-En*e^(-1/4*a*x^(4)-1/2*b*x^(2))
//res5 = b-En[En==b]
