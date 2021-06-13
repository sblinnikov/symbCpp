# from Journal of Computational and Applied Mathematics 244 (2013) 90–101
# Rational Chebyshev series for the Thomas–Fermi function: Endpoint
# singularities and spectral methods
#   John P. Boyd

#   Appendix. Maple code to solve the Thomas–Fermi equation
restart;
L:= 2; # map parameter
N:= 150; # number of basis functions & grid points, was 600;
Digits:= 15; # number of decimal digits of precision, was 40
itermax:= 6; # number of Newton iterations;
ncol:= N-2; # number of interior collocations points;
Mason25:= proc(y) local yh,vn,vd,vM; # evaluates Mason’s approximation;
  yh:= sqrt(y);
  vn:= 1+1.81061*yh+0.60112*y;
  vd:= 1+1.81061*yh+1.39515*y+0.77211*y*yh+0.21465*y*y+ 0.04793*yh*y*y;
  vM:= (vn/vd);
end proc:
with(LinearAlgebra);
fa:= Vector(N,orientation=column):
v:= Vector(N,orientation=column):
za:= Vector(N,orientation=column):
a:= Vector(N,orientation=column):
a0:= Vector(N,orientation=column);
# TL differentiation matrices D0,D1,D2 for 0th, d/dz, d**2/dz**2;
D0:= Matrix(ncol,N):
D1:= Matrix(ncol,N):
D2:= Matrix(ncol,N):
# collocation points za; TL computed by trigonometric identity;
for ii from 1 to ncol do
  ta[ii]:= evalf(Pi*(2*ii-1) / (2*ncol));
  tt:= ta[ii];
  za[ii]:= evalf(L*cot(tt/2)**2);
  for j from 1 to N do TL:= evalf(cos((j-1)*tt));
    # Compute derivatives using trigonometric definition and chain rule;
    PT:= evalf(-(j-1)*sin((j-1)*tt));
    PTT:= evalf(-(j-1)*(j-1)*TL);
    S := evalf(sin(tt/2));
    C := evalf(cos(tt/2));
    TLz:= evalf(-S * S * S * PT/ (L * C));
    TLzz:= evalf((S**5)*(2*C*S*PTT+(3-2*S*S)*PT)/(L*L * C*C*C* 2));
    D0[ii,j] := TL ;
    D1[ii,j]:= TLz ;
    D2[ii,j]:= TLzz;
od: od:
# Expand initialization v0 as TL series with coeffs a0=TLEXPMat*Mason25(za);
for ii from 1 by 1 to ncol do
  v0[ii]:= evalf(Mason25(za[ii]*za[ii]));
od:
TLEXPMat:= Matrix(ncol,ncol):
for ii from 1 to ncol do
  for j from 1 to ncol do
    TLEXPMat[ii,j]:= evalf((2/ncol)*cos((ii-1)*ta[j]));
od; od:
for j from 1 to ncol do
  TLEXPMat[1,j]:= evalf(TLEXPMat[1,j]*0.5);
od:
for ii from 1 by 1 to ncol do
  a0[ii]:= 0;
  for j from 1 by 1 to ncol do
    a0[ii]:= evalf(a0[ii]+TLEXPMat[ii,j]*v0[j]);
od: od:
a0[N-1]:= 0;
a0[N]:= 0;
a:= a0:
# Initialize Jacobian matrix and compute its last two rows;
Jacobian:= Matrix(N,N):
for j from 1 by 1 to N do
  Jacobian[N-1,j]:= evalf(cos((j-1)*Pi));
  Jacobian[N,j]:= 1;
od:
# Start of Newton–Kantorovich iteration; counter is ‘‘iter’’;
for iter from 1 by 1 to itermax do
  for ii from 1 by 1 to ncol do
    v:= 0;
    vz:= 0;
    vzz:= 0;
    for j from 1 by 1 to N do
      v:= evalf(v + D0[ii,j]*a[j]);
      vz:= evalf(vz + D1[ii,j]*a[j]);
      vzz:= evalf(vzz + D2[ii,j]*a[j]);
  od:
# fa is residual of TF ODE;
  fa[ii]:= evalf((v*vzz + vz*vz)*za[ii] - v*vz - 2*za[ii]*za[ii]*v*v*v);
  for j from 1 by 1 to N do Jacobian[ii,j]:= evalf(za[ii]*v * D2[ii,j]
     + (2*za[ii]*vz - v)*D1[ii,j] +(za[ii]*vzz - vz - 6*za[ii]*za[ii]*v*v)*D0[ii,j]);
  od: od:
# Apply boundary conditions: v(0)=1 (must be 0, as in vatzero below), v(infinity)=0;
  vatzero:= 0;
  vatinfinity:= 0;
  for j from 1 by 1 to N do
    vatzero:= evalf(vatzero + cos((j-1)*Pi)*a[j]);
    vatinfinity:= evalf(vatinfinity + a[j]);
  od;
  fa[N-1]:= vatzero - 1;
  fa[N]:= vatinfinity;
  delta_a:= LinearSolve(<Jacobian|fa>); # compute TL coeffs. delta_a of δn (z ).
  for j from 1 by 1 to N do
    a[j]:= evalf(a[j] - delta_a[j]);
  od:
  residualLoo[iter]:= max(seq(abs(fa[k]),k=1..N));
  print(iter,residualLoo[iter]);
od: # end of Newton iteration loop;
# Only plots & output below;
with(plots):
plot(Vector([1,3,4,6]),Vector([8,6,2,5]),style=point,symbol=asterisk,color="Blue");
anpoints := [seq([j,abs(a[j])],j=1..N)]:
plot(anpoints);
loglogplot(anpoints);
plot2:= loglogplot(anpoints,style=line):
guidepoints:= [seq([j,j**(-10.022)],j=1..N)]:
loglogplot(guidepoints);
plotguide:= loglogplot(guidepoints):
plots[display](plot2,plotguide);
vzzat0:= 0;
for j from 1 to N do
  j1:= j-1;
  vzzat0:= evalf(vzzat0 + a[j]*4*cos(j1*Pi)*((1/3)*j1**4+(2/3)*j1**2)/L**2);
od:
vzzat0exact:= -1.5880710226113753127186845;
errvzzat0:= evalf(abs(vzzat0-vzzat0exact));
print(N,vzzat0,errvzzat0);
