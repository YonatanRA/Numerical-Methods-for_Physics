function [x,error,iter] = iterpf(f,x,nmax,tol)%ITERACION PUNTO FIJO
%se uso p=1 en la convergencia
f=inline(f);
cont=1;
iter=1;
while cont
    fx=f(x);
    error=abs(x-fx);
    iter=iter+1;
    x=fx;
    if error<tol
        cont=0;
    elseif iter>nmax
        cont=0;
    end
end
end




