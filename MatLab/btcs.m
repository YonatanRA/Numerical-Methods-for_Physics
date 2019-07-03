function [u,er]=btcs(t0,tf,nt,a,b,nx,ci,cca,ccb,dif,cada,sol)
% método implícito ec difusion
x=linspace(a,b,nx);  x=x';  dx=x(2)-x(1);  
t=linspace(t0,tf,nt); t=t';  dt=t(2)-t(1);
r=dt/dx^2*dif;  
cca=inline(cca,'t');
ccb=inline(ccb,'t');
di=1+2*r;
A=diag(di*ones(nx-2,1))+diag(-r*ones(nx-3,1),1)+diag(-r*ones(nx-3,1),-1);
A=inv(A); %inversion de matriz....matriz indep de i y j
ci=vectorize(inline(ci,'x'));
%u=subs(ci,'x',x);
u=ci(x);
%gra=plot(x,u,'erasemode','xor');
gra=plot(x,u);
axis([a b min(u) 1.05*max(u)])
pause
z=u;
u=u(2:end-1); %quitando el primero y el ultimo
for i=1:nt-1;  
    u(1)=u(1)+r*cca(t(i));
    u(end)=u(end)+r*ccb(t(i)); %sumando las condiciones de contorno
    u=A*u;
    if mod(i,cada)==0
        xn=[cca(t(i+1));u;ccb(t(i+1))];
        set(gra,'ydata',xn);
        pause(.1)
        z(:,end+1)=xn;
    end  
end
u=[cca(tf);u;ccb(tf)];
if nargin==12 %si existe la solucion exacta
    sol=vectorize(inline(sol,'x','t'));
    er=u-sol(x,tf);
end

pause
figure
surfc(z);shading interp; colormap(hot);set(gca,'ydir','reverse');
rotate3d

    