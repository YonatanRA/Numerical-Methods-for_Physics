function [x,Nor]=uptrian(U,c) %matriz triangular superior U
n=length (c);%longitud de c
x=zeros(n,1);% vector x
x(n)=c(n)/U(n,n);
for i=n-1:-1:1
    x(i)=(c(i)-U(i,i+1:n)*x(i+1:n))/U(i,i);% esta introducido el producto escalar
end

Nor=norm(U*x-c);%norma del  error

end
