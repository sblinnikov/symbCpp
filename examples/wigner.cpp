// wigner.cpp
// install symbolicc as described in ../README and libsymbcgf to ~/lib
// compile with
// g++ -I /usr/local/include -L ~/lib -o wigner.exe wigner.cpp -fno-elide-constructors -lsymbcgf
// result saved in
// wigner.out
#include <iostream>
#include "symbolicc++.h"
using namespace std;

class exp_ddx
{
    private: Symbolic mu, x;
    public: exp_ddx(const Symbolic &mu,const Symbolic &x) :
        mu(mu), x(x) {}
        Symbolic operator *(const Symbolic &f)
{ return f[x==x+mu]; }
};

int main(void)
{
    Symbolic mu("mu"), x("x"), y("y"), f("f"), g("g");
    exp_ddx ex(mu,x),ex2(2*mu,y);
    Symbolic r;
    r = ex*f[x];
    cout << r << endl;
    r = ex*g[x];
    cout << r << endl;
    r = ex*f[x,y];
    cout << r << endl;
    r = ex*(sin(x)+(x^2));
    cout << r << endl;
    r = ex*(x^2)+ex2*((x+y)^2);
    cout << r << endl;
    return 0;
}
