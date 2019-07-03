function[c,Nor1]=lowtrian(L,b,p) %matriz triangular inferior L
n=length(b);%longitud del vector b
c=zeros(n,1);% vector c
c(n)=b(n)/L(n,n);

if p(1)>1; %primer valor
    b([1,p(1)])=b([p(1),1]);
    c(1)=b(1);
end

for i=2:n
    if p(i)>i;
        b([i,p(i)])=b([p(i),i]);
    end
    c(i)=(b(i)-L(i,1:i-1)*c(1:i-1))/L(i,i);% esta introducido el producto escalar
end

Nor1=norm(L*c-b');%norma del  error...si sale error es por trasposicion

end