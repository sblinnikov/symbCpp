// momentum.cpp
// install symbolicc as described in ../README for libsymbcgf
// compile with (if dir include is above):
// g++ -I ../include -L ~/lib -o momentum.exe momentum.cpp -fno-elide-constructors -lsymbcgf
// result saved in
// momentum.out

#include <iostream>
#include "symbolicc++.h"
using namespace std;
int main(void)
{
    int i, j;
    Symbolic com("com"), q("q",3), p("p",3), hb("hb");
    Equations rules;q = ~q; p = ~p; // noncommutative
    for(i=0;i<3;i++)
        for(j=0;j<3;j++)
            rules = (rules,
                     com[q(i),q(j)]==0,
                     com[p(i),p(j)]==0,
                     com[q(i),p(j)]==hb*SymbolicConstant::i*(i==j),
                     com[p(i),q(j)]==-hb*SymbolicConstant::i*(i==j),
                     com[(q(i))^2,p(j)]==
                       q(i)*com[q(i),p(j)]+com[q(i),p(j)]*q(i),
                     com[(p(i))^2,q(j)]==
                       p(i)*com[p(i),q(j)]+com[p(i),q(j)]*p(i)
                    );
    Symbolic q2, p2;
    for(i=0;i<3;i++)
        { q2 += (q(i))^2;
          p2 += (p(i))^2; }
    cout << "q2 = " << q2 << endl << "p2="<<p2<<endl;
    for(i=0;i<3;i++){
                Symbolic com1, com2;
                for(j=0;j<3;j++){ com1 += com[(q(j))^2,p(i)];
                    com2 += com[(p(j))^2,q(i)]; }
                    cout << com[q2,p(i)] <<"="<<com1.subst_all(rules) << endl;
                    cout << com[p2,q(i)] <<"="<<com2.subst_all(rules) << endl;
                    }
    return 0;
}

// The output is given by
// q2 = q0^(2)+q1^(2)+q2^(2)
// p2 = p0^(2)+p1^(2)+p2^(2)
// com[q0^(2)+q1^(2)+q2^(2),p0] = 2*q0*hb*i
// com[p0^(2)+p1^(2)+p2^(2),q0] = -2*p0*hb*i
// com[q0^(2)+q1^(2)+q2^(2),p1] = 2*q1*hb*i
// com[p0^(2)+p1^(2)+p2^(2),q1] = -2*p1*hb*i
// com[q0^(2)+q1^(2)+q2^(2),p2] = 2*q2*hb*i
// com[p0^(2)+p1^(2)+p2^(2),q2] = -2*p2*hb*i

