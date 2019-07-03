%Tema 2 Derivacion e integracion numerica

%Derivacion exacta
dex=diff(x.^2)

%Ejemplo de derivacion

x=[-0.25,0,0.25] %nodos
[c,x]=cfdn(x,0) % cfdn es el programa que devuelve coeficientes y nodos
%[c,x]=cfdnb(x,0.25,n) con esta puedes meter ordenes de derivacion (orden n)
d=dfx('sin(x)',c,x,pi) % dfx da la derivada introduciendo funcion,coef,nodos y punto de derivacion
double(d) % notacion decimal

%Otro Ejemplo
base=char('1','x','x^2','x^3')
b=gs(base,[-1,1]) % Gram Smichtd
nodos=solve(b(4))
syms x
Ig=((x-nodos(1))*(x-nodos(2))*(x-nodos(3)))^2/factorial(6)
k=int(Ig,-1,1)
f=exp(-x^2)
d6f=diff(f,x,6) %derivada sexta
ezplot(d6f,[-1,1]) %el mayor valor absoluto esta en cero
M=abs(subs(d6f,'x',0))  %evaluar la derivada en un punto....hay que sustituir
cota=double(M*k)


%Con n puntos
df=derivada('sin(x)',0,1,10) % hace la derivada del seno en [0,1] con 10 puntos..
% pinta la aprox con la analitica...solo hace esto...si eso quita el punto y coma
df=derivada('5*x',0,1,10)


%Integral exacta
syms x
iex=int(exp(-x.^2),-1,1)

%Ejemplo de integracion numerica
[c,x]=cfin(x,0,1) %coeficientes integracion numerica..nodos e intervalo
% [c,x]=cfinw(nodos,-1,1,'1/sqrt(1-x^2)') con esta para meter funcion peso
i=ifx('x',c,x) % integracion numerica para cualquier f
i=ifx('x.^2',c,x)
i=ifx('x.^4',c,x) %esta ya no es exacta por los nodos escogidos

%Metodo de Simpson compuesta
s=simp('exp(x)',0,1,4)

% x=[0,-15^(1/2)/5,15^(1/2)/5]  raices laguerre con solve de lo polinomios

