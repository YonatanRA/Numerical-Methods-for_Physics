function [tn,soln]=rk4vec(f,t0,tfin,y0,n)% rk vectorial....f=char('-y(2)','y(1)')...y0 es un vector tambien
ne=size(f,1);
for i=1:ne
    F(i,1)=sym(f(i,:));
end
h=(tfin-t0)/n;
hm=h/2;
tn=linspace(t0,tfin,n+1);
y=y0;
soln=y;
yn=y;
for i=1:n
    t=tn(i);             k1=eval(F); 
    t=t+hm ; y=yn+hm*k1 ;k2=eval(F);
    t=t+hm ; y=yn+hm*k2 ;k3=eval(F);
    t=t+h  ; y=yn+h*k3  ;k4=eval(F);
    yn=yn+(h/6)*(k1+2*k2+2*k3+k4);
    soln=[soln yn];
    y=yn;
end

