function [x,n] = bisecc(func,a,b,nmax,tol)
f=inline(func);  %Funcion
n=ceil(log((b-a)/tol)/log(2)); %Número de iteraciones segun tolerancia
fa=f(a);  %renombrar f(a)
fprintf(' n    x          f(x)\n') 
for k=1:nmax;
     x=(a+b)/2;
     c=f(x);
     fprintf('%2d % .8f % .1e \n',k,x,c) %Imprime resultados 
     if fa*c<0;
         b=x;
     elseif fa*c>0;
         a=x;
     end
     if abs(c)<tol % Corta el bucle segun la tolerancia
         return
     end
end
end


