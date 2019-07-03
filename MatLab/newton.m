function x = newton(F,xo,nmax,cot)%Newton-Raphson
syms x
F1=diff(F,x);
f=x-(F/F1);
x = puntofijonew(f,xo,nmax,cot);%meter simplificar para resultados raros del cociente
end   %Tambien hay k poner errant^2 en punto fijo para k converja el cociente de errores
%e_n+1/e_n^2.....la convergencia de este metodo es cuadratica