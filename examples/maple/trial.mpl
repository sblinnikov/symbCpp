
assume(a::'real');
u := x*exp(-a*x);
res1 := -hb*hb/(2*m)*diff(u, x, x) + c*x*u;
res2 := int(u*res1, x = 0 .. infinity);#  
;
res3 := res2;
res4 := int*(u*u, x = 0 .. infinity);
normTrial := res4;
expe = res3/normTrial;
minim := diff(expe, a);
res5 := solve(minim = 0, a);
diff(y^2, y);
int(exp(-a^2*y^2), y = 0 .. infinity);#  = 
;
int((sin(y))/(y),y=0..infinity) ( );

