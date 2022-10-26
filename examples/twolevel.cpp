// In the SymbolicC++ program we solve (6) numerically with the Lie series technique
// and evaluate the probabilities
// |c1(τ)|2,|c2(τ)|2,|c1(τ)|2+|c2(τ)|2=1. (8)
// We  have
// c1=c1r+ic1c,c2=c2r+ic2c and set
// c1r=x(0),c1i=x(1),c2r=x(2),c2i=x(3),τ=x (4).
// The output of the Symbolic C++ program is pr1=0.837222
// pr2=0.1627672 
// runs slowly, several minutes

// twolevel.cpp
#include <iostream>
#include "symbolicc++.h"
int main(void)
{
Symbolic V("V",5), x("x",5), W("W",2,2), om("om");
W(1,0) = W(0,1);
V(0) = cos(x(4))*W(0,0)*x(1)+cos(x(4))*cos(om*x(4))*W(0,1)*x(3)-cos(x(4))*sin(om*x(4))*W(0,1)*x(2);
V(1) = -cos(x(4))*W(0,0)*x(0)-cos(x(4))*cos(om*x(4))*W(0,1)*x(2)-cos(x(4))*sin(om*x(4))*W(0,1)*x(3);
V(2) = cos(x(4))*cos(om*x(4))*W(1,0)*x(1)+cos(x(4))*sin(om*x(4))*W(1,0)*x(0)+cos(x(4))*W(1,1)*x(3);
V(3) = -cos(x(4))*cos(om*x(4))*W(1,0)*x(0)+cos(x(4))*sin(om*x(4))*W(1,0)*x(1)-cos(x(4))*W(1,1)*x(2);
V(4) = 1;
Symbolic Q("Q",5);
for(int i=0;i<5;i++){
 Q(i)=0;
 for(int j=0; j<5; j++) Q(i) += V(j)*df(V(i),x(j));
 }
 Symbolic xs("xs",5);
 // initial value
 xs(0) = 1.0;
 xs(1) = 0.0;
 xs(2) = 0.0;
 xs(3) = 0.0;
 xs(4) = 0.0;
 double ep = 0.01, count = 0.0;
 // ep is the step length
 Symbolic newx("n",5);
 for(int k=0;k<5;k++) {
  newx(k) = x(k) + ep*V(k) + ep*ep/2*Q(k);newx(k) = newx(k)[om==0.1,W(0,0)==0.5,W(0,1)==0.5,W(1,1)==0.5];
 }
 for(;count<=20.0;count+=ep)
 {cerr << "\r      \r" << count;
 cerr.flush();
 Equations values = (x(0)==xs(0),x(1)==xs(1),x(2)==xs(2),x(3)==xs(3),x(4)==xs(4));
 for(int l=0;l<5;l++) xs(l) = newx(l)[values];}
 cerr << endl;
 Symbolic pr1 = xs(0)*xs(0)+xs(1)*xs(1);
 Symbolic pr2 = xs(2)*xs(2)+xs(3)*xs(3);
 cout << "pr1=" << pr1 << endl;
 cout << "pr2=" << pr2 << endl;
 return 0;
 }
