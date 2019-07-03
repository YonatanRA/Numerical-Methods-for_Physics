function [x,n] = bisecc_t(func,a,b,tol)
f=inline(func);  %funcion
n=ceil(log((b-a)/tol)/log(2)); %numero iteraciones segun tolerancia
fa=f(a);  %renombrar f(a)
for i=1:n;
     x=(a+b)/2;
     c=f(x);
     fprintf('%2d % .8f % .1e \n',i,x,c) 
     if fa*c<0;
         b=x;
     elseif fa*c>0;
         a=x;
     end
end


