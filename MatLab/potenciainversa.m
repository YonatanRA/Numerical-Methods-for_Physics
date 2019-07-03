function [lambda,x]=potenciainversa(A,z,alfa,nmax,tol)%potencia inversa desplazada
n=size(A,1);
iter=1;
error=tol+1;
laman=0;
errant=1;
I=eye(n);
M=A-(alfa*I);
[L,U,p]=LU(M,tol);

while(error > tol && iter <= nmax)
    [c]=lowtrian(L,z',p);
    [x]=uptrian(U,c);
    [mayor m]=max(abs(x));
    lambda=(1/(z(m)*x(m)))+alfa;
    error=abs(lambda-laman);
    iter=iter+1;
    errant=error;
    z=x/mayor;
    laman=lambda;
end
end
%devuelve valor propio