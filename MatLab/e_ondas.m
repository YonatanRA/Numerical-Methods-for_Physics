function [u,er]=e_ondas(t0,tf,nt,a,b,nx,ci_f,ci_g,cca,ccb,gamma,cada,sol,yventana)
%metodo explicito de ecuacion de ondas....las cc-f y cc-g string y en x
%cca y ccb en t...yventana es el tamaño de la ventana de visualizacion
%la solucion y el error el ultimo tiempo
clc
x=linspace(a,b,nx);  x=x';  dx=x(2)-x(1);%malla espacial
t=linspace(t0,tf,nt); t=t';  dt=t(2)-t(1);%malla temporal
lambda=gamma*dt/dx;  
if lambda>1
    disp('No se cumple el test de estabilidad')
    pause
end
lam2=lambda^2;
di=2*(1-lam2);
x=x(2:end-1);%se quita el primero y el ultimo

f=vectorize(inline(ci_f, 'x'));%conversion a inline
g=vectorize(inline(ci_g, 'x'));
cca=inline(cca,'t');%no se vectoriza porque es en un punto
ccb=inline(ccb,'t');

A=diag(di*ones(nx-2,1))+diag(lam2*ones(nx-3,1),1)+diag(lam2*ones(nx-3,1),-1);%matriz A

u0=f(x).*ones(nx-2,1);%ventores u0 y u1..se pone asi por si f es una cte.
u1=(1-lam2)*f(x)+lam2*(f(x+dx)+f(x-dx))/2+dt*g(x);
u1=u1.*ones(nx-2,1);

z=[cca(t0);u0;ccb(t0)];%cuestion grafica
gra=plot(x,u1,'m');
hold on
gra2=quiver(x,u1,u1-u1,u1-u0);%campo de velocidades
z(:,end+1)=[cca(t(2));u1;ccb(t(2))];
if nargin==14
    axis([a,b,yventana]);
else
    axis([a b -max(abs(u1)) max(abs(u1))])
end
pause
for i=2:nt-1;  %bucle temporal
    u=A*u1-u0;
    u(1)=u(1)+lam2*cca(t(i+1));
    u(end)=u(end)+lam2*ccb(t(i+1));
    if mod(i,cada)==0
        set(gra,'ydata',u');
        z(:,end+1)=[cca(t(i+1));u;ccb(t(i+1))];
        pause(0.1);
    end
    u0=u1;
    u1=u;
    
end
if nargin>12 & nargout==2
    sol=vectorize(inline(sol,'x','t'));
    er=u-sol(x,tf);
end

pause
figure
surfc(z);shading interp; colormap(jet);set(gca,'ydir','reverse');
rotate3d

    