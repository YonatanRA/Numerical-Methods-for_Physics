function [u,er]=ftcs(t0,tf,nt,a,b,nx,ci,cca,ccb,dif,cada,sol)
% método explícito ec difusion
x=linspace(a,b,nx);  x=x';  dx=x(2)-x(1);
t=linspace(t0,tf,nt); t=t';  dt=t(2)-t(1);
r=dt/dx^2*dif;  
if r>.5 %para la estabilidad
    clc
    disp('No se cumple el test de estabilidad')
    pause
end
di=1-2*r;
cca=inline(cca,'t');
ccb=inline(ccb,'t');
A=diag(di*ones(nx-2,1))+diag(r*ones(nx-3,1),1)+diag(r*ones(nx-3,1),-1);
A=[[r;zeros(nx-3,1)] A [zeros(nx-3,1);r]];  %esta matriz es la ampliada
ci=vectorize(inline(ci,'x'));
%u=double(subs(ci,'x',x));% vector con la solución para t=0,es decir, condición inicial
u=ci(x);
%gra=plot(x,u,'erasemode','xor');para ralentizar el plot; daba un error por eso el cambio 
gra=plot(x,u);
axis([a b min(u) max(u)])
pause
z=u;
u(1)=cca(t(1));   % se cambia el extremo izquierdo por la condición de contorno izquierda
u(end)=ccb(t(1)); % idem para la condición de contorno derecha, lo que esta añadido
for i=1:nt-1;  
    u=A*u;
    u=[cca(t(i+1)); u ; ccb(t(i+1))];% añadiendo los extremos para cada ciclo
    if mod(i,cada)==0
        set(gra,'ydata',u');
        pause(.1) %asi ralentizamos con una decima de segundo
        z(:,end+1)=u;
    end
end
if nargin==12 & nargout==2 %si existe la solucion exacta
    sol=vectorize(inline(sol,'x','t'));
    er=u-sol(x,tf);
end

pause
figure
surfc(z);shading interp; colormap(hot);set(gca,'ydir','reverse');
rotate3d

    
    