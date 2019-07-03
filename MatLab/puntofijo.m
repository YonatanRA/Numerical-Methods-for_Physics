function x = puntofijo(f,x,nmax,cot)
f=inline(f);
errant=1;
for i=1:nmax;
     c=f(x);
     error = abs(x - c);
     k=error/errant;% cambiar aqui errant^2 para metodo de newton
     fprintf('%2d % .8f % .1e % .8f % .8f \n',i,x,c,k,error)
     errant=error;
     x=c;
     if error  < cot;
         return
     end
end