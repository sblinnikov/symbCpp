#assume(a::'real');
u := x*exp(-a*x);
res1 := -hb*hb/(2*m)*diff(u, x, x) + c*x*u;
res20 := int(u*res1, x); # = 0 .. infinity);
res2 := simplify(res20);
res3 := -subs(x=0,res2);
res4 := int*(u*u, x); # = 0 .. infinity);
normTrial := -subs(x=0,res4);
expe := res3/normTrial;
minim := diff(expe, a);
res5 := solve(minim = 0, a);
#diff(y^2, y);
Int(1/(2*x - 5)^3, x=4..infinity) = int(1/(2*x - 5)^3, x=4..infinity);
# res4a:=int(y^2*exp(-2a*y), y = 0 .. infinity);
#int((sin(y))/(y),y=0..infinity) ( );



