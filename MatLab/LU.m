function [L,U,p]=LU(A,tol)   %Descomposicion LU...funciona...1º LU....2ºlow para c...3º up para x
n=size(A,1);
p=1:n;
for k=1:n-1
    [piv m]=max(abs(A(k:n,k)));%pivotaje parcial
    if piv<tol;
        error('Matriz singular segun la tolerancia')
    end
    if m>1;  %intercambio de filas
        m=m+k-1;
        A([k m],:)=A([m k],:);
        p(k)=m;
    end
    for i=k+1:n %transformacion del bloque (n-k)·(n-k) 
        A(i,k)=A(i,k)/A(k,k);
       
        A(i,k+1:n)=A(i,k+1:n)-A(i,k)*A(k,k+1:n);
    end
end
L=A;
L(1,1)=1;
L(1,2:n)=zeros(1,n-1);
L(n,n)=1;
U=A;
U(n,1:n-1)=zeros(1,n-1);
for i=2:n-1
    L(i,i)=1;
    L(i,i+1:n)=zeros(1,n-i);
    U(i,1:i-1)=zeros(1,i-1);
end
end

