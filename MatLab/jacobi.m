function [x,iteracion,error]=jacobi(A,b,nmax,tol,p) %metodo de jacobi
n=size(A,1);
iter=1;
x=zeros(n,1);
xant=zeros(n,1);
error=tol+1;
while(error > tol && iter <= nmax)
    for i=1:n;
        x(i)=(b(i)-(A(i,[1:i-1,i+1:n])*xant([1:i-1,i+1:n])))/A(i,i);
    end
    error = norm(x-xant,p);
    %fprintf('%2d % .1e\n',iter ,error)
    xant=x;
    iter=iter+1;
    iteracion=iter-1;
    %fprintf('%2d % .1e\n',norm(A*x-b,inf))
end
%fprintf('%2d % .1e\n',iter-1,error)
end
