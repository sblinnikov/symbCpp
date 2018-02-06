// UnitaryHermitian.cpp
// compile with
// g++ -I ./include -L ~/lib -o UnitaryHermitian.exe UnitaryHermitian.cpp  -lsymbcgf

#include <iostream>
#include <list>
#include <symbolicc++.h>
using namespace std;

int main(void)
{using SymbolicConstant::i;
Symbolic eps ( "eps ");
Symbolic V = ((cos(eps) ,i*sin(eps)),
              (i*sin(eps),cos(eps)));
Symbolic dV = df(V,eps);
Symbolic VI = V[i==-i].transpose();
Symbolic K = -i*dV*VI;
K = K[(cos(eps)^2)==1-(sin(eps)^2)];

cout << "K = "  << K << endl;
return 0;	
}
