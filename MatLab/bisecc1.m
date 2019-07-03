function [x,n] = bisecc1(f,a,b,cot)
f=inline(f);  %funcion
n=ceil(log((b-a)/cot)/log(2)); %numero iteraciones segun tolerancia
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


