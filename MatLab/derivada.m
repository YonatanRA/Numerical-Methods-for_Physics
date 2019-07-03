function df=derivada(f,a,b,n) 
%funcion a,b intervalo y n puntos
f=inline(f);
y=linspace(a,b,n);
h=(b-a)/(n-1);
for i=2:n-1
    df(i)=(f(y(i)+h)-f(y(i)-h))/(2*h);
end
df(1)=(-3*f(a)+4*f(a+h)-f(a+2*h))/(2*h);
df(n)=(f(b-2*h)-4*f(b-h)+3*f(b))/(2*h);
plot(y,df);
hold on
f=sym(char(f));
ezplot(diff(f),[a,b]);
end

