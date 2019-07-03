function [u] = acerohomogeneo(t0,tf,nt,nx,cada) %FCTS barra acero

ci=vectorize(inline('60*x^2-170*x+150')); %Condición inicial
cca=inline('150'); %Condicion contorno extremo izquierdo
ccb=inline('40'); %Extremo derecho

dif=13.1*10^(-6); %Coeficiente de difusión (m^2/s)
a=0; %Extremo izquierdo(m)
b=1; %Extremo derecho (m)

x=linspace(a,b,nx);
x=x';  
dx=x(2)-x(1);
t=linspace(t0,tf,nt);
t=t'; 
dt=t(2)-t(1);
r=dt/dx^2*dif;

if r>.5
    clc
    disp('No se cumple el test de estabilidad')
    pause
end

di=1-2*r;
A=diag(di*ones(nx-2,1))+diag(r*ones(nx-3,1),1)+diag(r*ones(nx-3,1),-1);
A=[[r;zeros(nx-3,1)] A [zeros(nx-3,1);r]];

u=ci(x); %La cond. inic. incluye los extremos

gra=plot(x,u);
title('Acero homogéneo (estático)');
xlabel('x(m)');
ylabel('T(ºC)');
axis([a b min(u) max(u)])
pause
hold on
u(1)=cca(t(1));   % se cambia el extremo izquierdo por la condición de contorno izquierda
u(end)=ccb(t(1)); % idem para la condición de contorno derecha

for i=1:nt-1;  
    u=A*u;
    u=[cca(t(i+1)); u ; ccb(t(i+1))];
    if mod(i,cada)==0
        plot(x,u);
        title('Difusión calor acero homogéneo');
        xlabel('x(m)');
        ylabel('T(ºC)');
        axis([0,1,40,150]);
        getframe(gca);
    end
end
end