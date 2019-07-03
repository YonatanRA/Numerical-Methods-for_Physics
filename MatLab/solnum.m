function [tnu,soln]=solnum(f,t0,tf,ci,n)

%  f     segundo miembro del sistema de ecuaciones diferenciales
%  t0    t inicial
%  tf    t final
%  ci    condicion inicial
%  n     numero de subintervalos

ne=size(f,1);
for i=1:ne
    F(i,1)=sym(f(i,:));
end
h=(tf-t0)/n;
hm=h/2;
hc=2*h/3;
tnu=linspace(t0,tf,n+1);
y=ci;
soln=y;
for i=1:n
    t=tnu(i);
    k1=eval(F);
    
    t=t+hm ; y=soln(:,end)+hm*k1;  k2=eval(F);
    
             y=soln(:,end)+hc*k2;  k3=eval(F);
t=tnu(i);
    y=soln(:,end);
    yn=soln(:,end)+h/5*(k1+2*k2+3*k3);    
    soln=[soln yn];
    y=yn;
    
end
end

    
    