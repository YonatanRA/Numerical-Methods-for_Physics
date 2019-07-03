function u=barra2(t0,tf,nt,a,b,nx,ci,cca,ccb) %0,1,100000,0,1,100,,,,,,,,

x=linspace(a,b,nx);  x=x';  dx=x(2)-x(1); %Definimos vector de posiciones
t=linspace(t0,tf,nt); t=t';  dt=t(2)-t(1); %Definimos vector de tiempos

cca=inline(cca,'t'); %Condiciones de contorno
ccb=inline(ccb,'t');

ci=vectorize(inline(ci,'x')); %Condicion inicial

ro(1:20)=7.85; %Acero
c(1:20)=0.45;
k(1:20)=0.46;

ro(21:50)=8; %Acero plateado
c(21:50)=0.3;
k(21:50)=1;

ro(51:80)=9.32; %Plata
c(51:80)=0.235;
k(51:80)=4.29;

ro(81:100)=7.85; %Acero
c(81:100)=0.45;
k(81:100)=0.46;

for i=1:nx
    r(i)=dt/(ro(i)*c(i)*dx^2);
end

u=ci(x); %Inicializamos la solucion
u(1)=cca(t(1));
u(end)=ccb(t(1));

A=zeros(nx,nx);
A(1,1)=1;
A(nx,nx)=1;

for j=2:nx-1
    A(j,j-1)=r(j)*1/2*(3*k(j)-k(j+1));
    A(j,j)=r(j)*(-2*k(j)+ro(j)*c(j)*dx^2/dt);
    A(j,j+1)=r(j)*1/2*(k(j)+k(j+1));
end

for i=1:nt-1
    u=A*u;
    plot(x,u)
    getframe(gca)
 
end
