%Terminar...crear la funcion biseccion (f,a,b,tol)
a=1
b=2
ntol=10^-5
t=(log2((b-a)/ntol)/log2(2))
n=ceil(t);%siguiente entero mayor
f=inline('sqrt(x)*sin(x)-x^3+2')
a(1)=a
b(1)=b
for i=1:n
    x(i)=(a(i)+b(i))/2
    fa=f(a(i))
    fx=f(x(i))
    if fa*fx<0
        x(i)=b(i+1)
    else
        x(i)=a(i+1)
    end
    x(n)=x
end



