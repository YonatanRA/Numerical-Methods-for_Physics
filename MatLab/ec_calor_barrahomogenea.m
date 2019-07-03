function [u] = ec_calor_barrahomogenea(t0,tf,nt,nx,cada)
% Ecuación del calor FTCS

% Acero-> k=46, ro=7.85, c=0.450, alfa^2=13.1
% Acero plateado-> k=100, ro=8.00, c=0.300
% Plata-> k=429, ro=9.32, c=0.235
ci=vectorize(inline('60*x^2-170*x+150')); %Condición inicial
cca=inline('150'); %Extremo izquierdo
ccb=inline('40'); %Extremo derecho
dif=13.1*10^(-6); %Coeficiente de difusión (m^2/s)
a=0; %Extremo izquierdo(m)
b=1; %Extremo derecho (m)
x=linspace(a,b,nx);  x=x';  dx=x(2)-x(1);
t=linspace(t0,tf,nt); t=t';  dt=t(2)-t(1);
r=dt/dx^2*dif;
if r>.5
    clc
    disp('No se cumple el test de estabilidad')
    pause
end
di=1-2*r;
A=diag(di*ones(nx-2,1))+diag(r*ones(nx-3,1),1)+diag(r*ones(nx-3,1),-1);
A=[[r;zeros(nx-3,1)] A [zeros(nx-3,1);r]];
%u=subs(ci,'x',x); % vector con la solución para t=0, es decir, condición inicial
u=ci(x); %La cond. inic. incluye los extremos
%gra=plot(x,u,'erasemode','xor');
gra=plot(x,u);
title('Ecuación difusión barra homogénea');
xlabel('x(m)');
ylabel('T(ºC)');
axis([a b min(u) max(u)])
pause
u(1)=cca(t(1));   % se cambia el extremo izquierdo por la condición de contorno izquierda
u(end)=ccb(t(1)); % idem para la condición de contorno derecha
for i=1:nt-1;  
    u=A*u;
    u=[cca(t(i+1)); u ; ccb(t(i+1))];
    if mod(i,cada)==0
        plot(x,u);
        title('Ecuación difusión barra homogénea');
        xlabel('x(m)');
        ylabel('T(ºC)');
        axis([0,1,40,150]);
        getframe(gca);
    end
end
end