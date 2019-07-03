% Átomo de Hidrógeno 2s
clear all
clc

Z=1; % Número de protones
a0=1; % Radio de Bohr normalizado

N=(Z/a0)^1.5/(4*sqrt(2*pi)); % Cte normalizacion funcion de onda

r=(Z/a0)*[0:.01:17]; % Definicion Orbitales 2s
phi=[0:0.01:2*pi]; % Definicion angulos
theta=[0:0.01:pi];

psi=N*(2-r).*exp(-r/2); % Valores funcion de onda

psi_r=4*pi*r.^2.*psi.^2; % Funcion radial


plot(r,psi_r); % Representacion grafica
grid on;
title('|\Psi(r)|^2');
xlabel('r/a_0');
ylabel('Densidad de probabilidad');
