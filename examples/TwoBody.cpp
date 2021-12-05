// TwoBody.cpp

#include <iostream>
#include "symbolicc++.h"
using namespace std;
int main(void)
{
    Symbolic M("M"), m1("m1"), m2("m2");
    Symbolic T = ((Symbolic(-1),0,0,Symbolic(1),0,0),
                  (Symbolic(0),Symbolic(-1),0,0,Symbolic(1),0),
                  (Symbolic(0),0,Symbolic(-1),0,0,Symbolic(1)),
                  (m1/M,0,0,m2/M,0,0),
                  (Symbolic(0),m1/M,0,0,m2/M,0),
                  (Symbolic(0),0,m1/M,0,0,m2/M));
    cout << "T = " << T << endl;
    Symbolic d = T.determinant();
    d = d[m2==M-m1];
    cout << "d= " << d << endl;
    Symbolic TI = T.inverse();
    TI = TI[m2==M-m1];
    cout << "TI = " << TI << endl;
    return 0;
    
}
