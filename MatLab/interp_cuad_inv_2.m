function x=interp_cuad_inv(func,a,b,nmax,tol)
% Búsqueda de raíces de función por método de interpolación cuadrática inversa.
f=inline(func);
c=(a+b)/2; %Punto medio intervalo
fprintf('  n     alfa      f(alfa)\n')
for  i=1:nmax,
    fa=f(a);
    fb=f(b);
    fc=f(c);
    p=ifn([fa,fc,fb],[a,c,b]); %Cálculo interpolante 3 puntos (grado <=2) (se obtiene como x=p(y))
    p=inline(p);
    x=p(0);
    fx=f(x);
    fprintf(' %2d % .8f % .1e\n',i,x,fx)
    if abs(fx)<tol,
        return
    end
    a=b;
    b=c;
    c=x;
end
x=c;