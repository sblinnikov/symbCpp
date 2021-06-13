
# https://www.researchgate.net/publication/266836869_Chebyshev_Spectral_Methods_and_the_Lane-Emden_Problem/link/5472b44d0cf2d67fc035c9ed/download
# In place of n in standard polytropic relation P=K\rho^{1+1/n} the author uses m
# Author's typos corrected and the code tested in Maple 20
#
Digits:=30; # variable precision
N:=20; # no. of interpolation points
m:= 1; # 5/2; 4; 3; 1/2; -- 0.5 does not work, use 1/2 -- Lane-Emden exponent
itermax:= 20; # no. of Newton iterations
with(LinearAlgebra);
D0Mat:= Matrix(N,N):
D1Mat:= Matrix(N,N):
D2Mat:= Matrix(N,N):
xCheb:= Vector(N):
fa:= Vector(N+1,orientation=column):
ya0:= Vector(N,orientation=column):
for ii from 1 by 1 to N do # compute grid points xCheb;
 ta[ii]:=evalf( Pi*(ii-1)/(N-1));
 xCheb[ii]:=evalf(0.5*(1+cos(ta[ii])));
od:
for ii from 2 to (N-1) do # differentiation matrices:
  t:=ta[ii]; ss:=evalf( sin(t)) ;
  cc:=evalf( cos(t));
  for j from 1 by 1 to N do
    D0Mat[ii,j]:=evalf(cos((j-1)*t));
    pt:=evalf(-(j-1)*sin((j-1)*t) );
    ptt:=evalf(- (j-1)*(j-1)*D0Mat[ii,j]);
    D1Mat[ii,j]:=evalf(-2*pt/ss);
    D2Mat[ii,j]:=evalf(4*(ptt/(ss*ss)-cc*pt/(ss*ss*ss)));
od: od:
# apply non-trig formulas at the endpoints;
for j from 1 to N do
  D0Mat[1,j] := 1;
  D0Mat[N,j]:= (-1)^(j+1);
  D1Mat[1,j]:=evalf(2*(j-1)^2);
  D1Mat[N,j]:=evalf(2*(-1)^j *(j-1)^2);
  D2Mat[1,j]:=evalf((j-1)^2 *((j-1)^2 -1 )*(4/3));
  D2Mat[N,j]:=evalf(-(-1)^j *(j-1)^2 *( (j-1)^2 - 1)*4/3) ;
od:
for ii from 1 to N do
ya0[ii]:=evalf(cos((Pi/2)*xCheb[ii]));
od:
print("ya0=",ya0);
xi0:=3.0;
  # ya0, xi0 are first guess for Newton iteration;
a0:=LinearSolve(<D0Mat|ya0 >); # Chebyshev coeffs of ya0(x);
a:=a0:
xi:=xi0;
Jacobian:=Matrix(N+1,N+1):
for iter from 1 to itermax do
  # begin Newton-Kantorovich iteration;
  ya:=MatrixVectorMultiply(D0Mat,a);
  for ii from 1 to (N-2) do
     fa[ii]:= - xi*xi*ya[ii+1]**m;
      for j from 1 to N do fa[ii]:= fa[ii] - D2Mat[ii+1,j]*a[j]
         - (2 / xCheb[ii+1] ) * D1Mat[ii+1,j]*a[j];
  od: od:
  yatzero:=0;
  for j from 1 to N do
     yatzero:=evalf(yatzero + D0Mat[N,j]*a[j]):
  od;
  fa[N+1]:=-( yatzero-1);
  fa[N-1]:=0;
  fa[N]:=0;
  Jacobian[N+1,N+1]:= 0;
  for ii from 1 to (N-2) do
      for j from 1 by 1 to N do
        Jacobian[ii,j]:= D2Mat[ii+1,j]+(2 /xCheb[ii+1])*D1Mat[ii+1,j]
        + xi*xi * m * ya[ii+1]**(m-1) * D0Mat[ii+1,j] ;
  od: od:
  for j from 1 to N do
    Jacobian[N-1,j]:= D0Mat[1,j];
    Jacobian[N,j] := D1Mat[N,j];
    Jacobian[N+1,j]:= D0Mat[N,j];
  od:
  for ii from 1 to (N-2) do
    Jacobian[ii,N+1] := 2*xi* ya[ii+1]**m;
  od:
  Jacobian[N,N+1]:= 0;
  Jacobian[N-1,N+1]:= 0;
  delta_a_and_xi:=LinearSolve( <Jacobian|fa>);
  for j from 1 to N do
    a[j]:= evalf( a[j] + delta_a_and_xi[j] );
  od:
  xidelta:=delta_a_and_xi[N+1];
  xi:=xi+xidelta;
  print(iter,xidelta);
od:
print("xi=",xi);
print("Pi=",evalf(Pi));
printf("xi = %30.24e \n",xi);
printf("Pi = %30.24e \n",Pi); # Pi was always printed here with a spurious number appended
                              # when xi and Pi were in one operator
for j from 1 to N do
  printf("%18.17e ...\n",a[j]);
od:
with(numapprox):
with(orthopoly,T):
thetaCheb:= proc(x) local tht,jj; # evaluates Chebyshev expansion;
  tht:=0;
  for jj from 1 to N do
    tht:=tht+a[jj]*T(jj-1,2*x-1);
  od:
end proc:
tht01:=evalf(thetaCheb(0.1));
tht05:=evalf(thetaCheb(0.5));
tht1:=evalf(thetaCheb(1));
with(plots):
r2:=chebyshev(cos(x),x,0.1);
plot({cos(x),r2},x=-1..1);
plot(T(0,x),x=-1..1);
plot(5/8*T(0,2*x-1)-1/2*T(1,2*x-1)-1/8*T(2,2*x-1),x=0..1); # this plot is for m==0
plot([thetaCheb(x),sin(Pi*x)/(Pi*x)],x=0..1); # this is for m==1
# polytropic mass mu:
xi^3*int(thetaCheb(x)^m*x^2, x = 0 .. 1);
# polytropic mass mu numerically:
mu:=xi^3*evalf(Int(thetaCheb(x)^m*x^2, x = 0 .. 1));
# dimensionless moment of inertia:
iota:=xi^5*evalf(Int(thetaCheb(x)^m*x^4, x = 0 .. 1));
k:=2*iota/(3*mu*xi^2);


