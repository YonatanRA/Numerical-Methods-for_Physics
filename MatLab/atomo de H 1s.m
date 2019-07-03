% Átomo de Hidrógeno 1s
clear all
clc

Z=1; % Número de protones
a0=1; % Radio de Bohr normalizado

N=(Z/a0)^1.5/sqrt(pi); % Cte normalizacion funcion de onda

theta=0:0.05:pi; % Definicion de ángulos 
phi=0:0.05:2*pi;
[theta,phi]=meshgrid(theta,phi); % Mallado angulos


C=0.0001; % Inicializacion del potencial
c=sprintf('%g*exp(-2*r)-%g',N^2,C);
r=fzero(inline(c,'r'),10); % Definicion de r
x=r*sin(theta).*cos(phi); % En coordenadas cartesianas
y=r*sin(theta).*sin(phi);
z=r*cos(theta);

figure(1);
contour3(x,y,z,25); % Representacion en 3D
title('|\Psi(r)|^2');
hold off; 

r=[0:.01:6]; % Definicion r orbitales 1s
sigma=(Z/a0)*r;
psi=4*pi*r.^2.*(N*exp(-sigma)).^2; % Funcion de densidad

figure(2);
plot(r,psi); % Representacion grafica en el plano
grid on;
title('|\Psi(r)|^2');
xlabel('r/a_0');
ylabel('Densidad de probabilidad');


