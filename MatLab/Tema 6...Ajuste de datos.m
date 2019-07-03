%Tema 6....ajuste de datos

%Ajuste por minimos cuadrados
xd=[1,1.1,1.2,1.3,1.4]
pol=inline('-2+x./2+3*x.^3')
yd=pol(xd)
[p,c]=amc(xd,yd,3,1) %ajuste minimos cuadrados
%se evalua p y se hace (yi-p(xi))^2
vec=yd-subs(p,'x',xd)
error=sum(vec.*vec)
double (error)
% se hacen numeros aleatorios...con randn es normal....con rand es uniforme
randn(1,5)
randn(5,5)

%Ajuste por minimos cuadrados para cualquier funcion
b=char('x','cos(x)','sin(x)')
xd=[1,1.5,2,2.5,3]
pol=inline('x/3-2*cos(x)+3*sin(x)')
yd=pol(xd)
[p,c]=amcf(xd,yd,b,1)
vpa(p,3)
vec=yd-subs(p,'x',xd)%error
error=vec*vec.'
double(error)

yn=yd+0.05*randn(1,5)%para meter una distorsion
[p,c]=amcf(xd,yn,b,1)
vpa(p,3)
vec=yn-subs(p,'x',xd)
error=vec*vec.'
double(error)

%Ajustar por cualquier funcion
x=rand(1,200);
x=2*x; %para estar entre 0 y 2
%se mete una semilla c(1)=3, c(2)=-2 y c(3)=5
y=3*x-2*exp(-5*x);
plot(x,y) %mal pintado
plot(x,y,'x')
x=sort(x);% se pone ordenado
y=3*x-2*exp(-5*x);
plot(x,y); %ahora si
c=ajuste('fun',x,y,[2.5,-1.7,6])%Ahora el programa ajuste por una funcion f.m o fun.m con una semilla muy parecida.
%Si se cambian los valores de la semilla:
c=ajuste('fun',x,y,[2.5,1.7,1]) %se ve como ajusta
c=ajuste('fun',x,y,[-2.5,1.7,-3]) %aqui ya cambia el mucho el ajuste y no devuelve los coeficientes semilla originales
%Ahora metiendo ruido en los datos:
yn=y+0.5*randn(1,200);
c=ajuste('fun',x,yn,[2.5,-1.7,3])%realiza el ajuste de una nube de puntos
%Ahora se prueba el programa ejemplo
ejemplo %[3,0.2,1] por ejemplo...con y sin ruido





