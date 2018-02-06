#include <iostream>
#include "symbolicc++.h"
using namespace std;

int main(void)
{
 // The operator b is the annihilation operator and bd is the creation operator
 Symbolic b("b"), bd("bd"), vs("vs");

 b = ~b; bd = ~bd; vs = ~vs;

 Equations rules = (b*bd == bd*b + 1, b*vs == 0);

 // Example 1
 Symbolic result1 = b*bd*b*bd;
 cout << "result1 = " << result1.subst_all(rules) << endl;
 cout << "result1*vs = " << (result1*vs).subst_all(rules) << endl;

 // Example 2
 Symbolic result2 = (b+bd)^4;
 cout << "result2 = " << result2.subst_all(rules) << endl;
 cout << "result2*vs = " << (result2*vs).subst_all(rules) << endl;

 return 0;
}
