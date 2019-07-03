function [lambda,x]=potencia(A,x,nmax,tol)
%devuelve valor propio
iter=1;
error=tol+1;
laman=0;
errant=1;

while(error > tol && iter <= nmax)
    y=A*x;
    [mayor m]=max(abs(y));
    lambda=x(m)*y(m);
    error=abs(lambda-laman);
    iter=iter+1;
    errant=error;
    x=y/mayor;
    laman=lambda;
end
end
