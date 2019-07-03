% Átomo de Hidrógeno 2p
clear all
clc

Z=1; % Número de protones
a0=1; % Radio de Bohr normalizado

N=(Z/a0)^1.5/(4*sqrt(2*pi)); % Cte normalizacion funcion de onda

theta=[0:0.05:pi]; % Definicion de angulos
phi=[0:0.05:2*pi+0.1];

s=size(theta); % Definicion del potencial
r=zeros(1,s(2)); 
C=0.0001;
for i=1:s(2)
  c=sprintf('%g*r*r*exp(-r)*cos(%g)^2-%g',N^2,theta(1,i),C);
  r(i)=fzero(inline(c,'r'),10);
end


r_r=[0:15/1000:15]; % Funciones de r
sigma_r=(Z/a0)*r_r;
theta_r=[-pi:2*pi/1000:pi];

psi_r=(4*pi/3)*r_r.^2.*(N*sigma_r.*exp(-sigma_r/2)).^2; % Funcion radial

plot(r_r,psi_r);  % Representacion grafica
grid on;
title('|\Psi(r)|^2');
xlabel('r/a_0');
ylabel('Densidad de probabilidad');

