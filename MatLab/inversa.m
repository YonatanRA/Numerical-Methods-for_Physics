function [Ainv]=inversa(A) %calculo de la inversa
n=size(A,1);
[L,U,p]=LU(A,0);

for i=1:n
    v=zeros(1,n);
    v(i)=1;
    [c]=lowtrian(L,v,p);
    Ainv(:,i)=uptrian(U,c);
end
end


    









