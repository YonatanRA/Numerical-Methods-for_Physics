function i=trapc(f,a,b,m) %funcion,intervalo y subintervalos.... trapezoidal compuesta
f=inline(f);
h=(b-a)/m;
x=linspace(a,b,m+1);
v(1)=(h/2)*f(a);
v(m+1)=(h/2)*f(b);
for j=2:m,
    v(j)=h*f(x(j));
end
i=sum(v);
end
