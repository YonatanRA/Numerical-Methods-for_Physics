% Átomo de Hidrogeno 3d
clear all
clc

Z=1; % Número de protones
a0=1; % Radio de Bohr normalizado

N=(Z/a0)^1.5/(81*sqrt(6*pi)); % Cte normalizacion funcion de onda

theta=[0:0.05:pi]; % Definicion de angulos
phi=[0:0.05:2*pi];
[theta,phi]=meshgrid(theta,phi); % Mallado de angulos

st=size(theta);
r=zeros(1,st(2));
C=0.0001; % Definicion del potencial
for i=1:st(2)
  c=sprintf('%g*r^4*exp(-2*r/3)*(3*(%g)^2-1)^2-%g',N^2,cos(theta(1,i)),C);
  r(i)=fzero(inline(c,'r'),20);
end

index=find(r<0); % Para eliminar divergencias r<0 y NaN
r(index)=0;
index=find(r==NaN);
r(index)=0;


x=sin(theta).*cos(phi); % En coordenadas cartesianas
x=x*diag(r);
y=sin(theta).*sin(phi);
y=y*diag(r);
z=cos(theta);
z=z*diag(r);

contour3(x,y,z,40); % Representacion en 3D
title('|\Psi(r)|^2');
