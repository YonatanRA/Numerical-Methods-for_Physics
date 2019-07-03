function [L,U,p]=desLU(A,tol)%Descomposicion LU
n=length(A(1,:));

for k=1:n-1
    for i=k+1:n
        max(max(A(i,k)))=aik;
        if aik<tol;
            break
        end
        A(i,k)=A(i,k)/aik;
    end
    for j=k+1:n
        A(i,j)=A(i,j)-();
        
            
        
    

