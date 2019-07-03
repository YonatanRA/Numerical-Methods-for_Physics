x=rand(1,200);
 x=2*x; %para estar entre 0 y 2
%se mete una semilla c(1)=3, c(2)=-2 y c(3)=5
y=3*x-2*exp(-5*x);
plot(x,y) %mal pintado
plot(x,y,'x')
x=sort(x);% se pone ordenado
y=3*x-2*exp(-5*x);
plot(x,y); %ahora si
c=ajuste('fun',x,y,[2.5,-1.7,6])%Ahora el programa ajuste con una semilla muy parecida.
%Si se cambian los valores de la semilla:
c=ajuste('fun',x,y,[2.5,1.7,1]) %se ve como ajusta
c=ajuste('fun',x,y,[-2.5,1.7,-3]) %aqui ya cambia el mucho el ajuste y no devuelve los coeficientes semilla originales
%Ahora metiendo ruido en los datos:
yn=y+0.5*randn(1,200);
c=ajuste('fun',x,yn,[2.5,-1.7,3])%realiza el ajuste de una nube de puntos
%Ahora se prueba el programa ejemplo
ejemplo %[3,0.2,1] por ejemplo...con y sin ruido




