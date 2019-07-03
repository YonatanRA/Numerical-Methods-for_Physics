function s=simp(f,a,b,m)  %funcion,intervalo y subintervalos.... simpson compuesta
f=inline(f);
h=(b-a)/(2*m);
x=linspace(a,b,2*m+1);
v(1)=(h/3)*f(a);
for j=2:2:2*m
    v(j)=4*h*f(x(j))/3;
    v(j+1)=2*h*f(x(j+1))/3;
end
v(2*m+1)=(h/3)*f(b);
s=sum(v);
end
