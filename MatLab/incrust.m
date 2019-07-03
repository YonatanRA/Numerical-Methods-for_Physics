function [u]=incrust(t0,tf,nt,a,b,nx,ci,cca,ccb,dif1, dif2,cada)
% mtodo explcito
%t0 tiempo inicial
%tf tiempo final
%nt nº tiempos
%a extremo izquierdo de la barra
%b extremo derecho de la barra
%nx nº puntos de la barra (intervalos -1)
%ci condición inicial
%cca condición de contorno en a
%ccb condición de contorno en b
%dif coeficiente de difusi´on (lo que va antes de u_xx)
%cada : nº que indica cada cu´antos pasos te muestra la solucion por pantalla
%sol: donde va almacenando la solucion

%datos
t0=0;
tf=1000;
nt=2602;
a=0;
b=1;
nx=100;
ci='70.*(x.^2)-20.*x+50';
 cca='50';
ccb='100';
dif1=130*(10^-6);
dif2=60*(10^ -6)
cada=32;
z=zeros(nt,nx);


%función
ci=inline(ci);
x=linspace(a,b,nx);  x=x';  dx=x(2)-x(1);
t=linspace(t0,tf,nt); t=t';  dt=t(2)-t(1);
r1=dt/dx^2*dif1;  
r2=dt/dx^2*dif2;  
if r1>.5
    clc
    disp('No se cumple el test de estabilidad')
    pause
end
di=1-2*r1;
cca=inline(cca,'t');
ccb=inline(ccb,'t');
A=diag(di*ones(nx-2,1))+diag(r1*ones(nx-3,1),1)+diag(r1*ones(nx-3,1),-1);
A=[[r1;zeros(nx-3,1)] A [zeros(nx-3,1);r2]];
%u=subs(ci,'x',x);      % vector con la solucin para t=0, es decir, condicin inicial
u=ci(x);
gra=plot(x,u,'erasemode','xor');
axis([a b min(u) max(u)])
pause
z=u;
u(1)=cca(t(1));   % se cambia el extremo izquierdo por la condicin de contorno izquierda
u(end)=ccb(t(1)); % idem para la condicin de contorno derecha
for i=1:nt-1;  
    u=A*u;
    u=[cca(t(i+1)); u ; ccb(t(i+1))];
    if mod(i,cada)==0
        set(gra,'ydata',u');
         drawnow
        z(:,end+1)=u;
        
    end
    z
end
%if nargin==12 & nargout==2
  %  sol=vectorize(inline(sol,'x','t'));
   % er=u-sol(x,tf);
%end
pause
figure
surf(z);shading interp; colormap(hot);set(gca,'ydir','reverse');


%if 0.25<x(i)<0.45
%r(i)=r2
%else
%r