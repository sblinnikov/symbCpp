# test diff in various forms
diff(sin(x),x);
diff(sin(x),x,x);
uu:=sin(x);
r0:=diff(uu,x$3); # 3rd derivative
# harmonic1.map from Steeb & Hardy, here harmonic1.mpl
ut := a*h(xi)*exp(-xi^2/2); # Ansatz
r1 := diff(ut,xi$2) - (xi^2)*ut +(lambda+1)*ut;
r2 := r1/(a*exp(-xi^2/2)); # Steeb & Hardy write here r1/ut, which is чушь
r3 := simplify(r2);
# this is Hermite ODE

