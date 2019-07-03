%Tema 1 Interpolacion....salvado de datos

%Ejemplo de diferencias divididas
x=[1,1.3,1.9,2.2]
y=besselj(0,x) %J0 de Bessel
format long
d=difdiv(x,y) %esto te da la tabla de las difdiv
p=ifn(x,y) % ifn o tmb ifn2 es el programa que da interpolante en forma de newton
P=char(p)
fplot(p,[1,2.2]) %pinta la aprox
hold on
plot(x,y,'x') % pinta los 4 puntos

%Salvar datos
%variables a datos
save ('datos.mat','x','y')

%datos a variables
clear x
clear y
load datos
