function [T]=acero% método explícito ec difusion trabajo materia condensada


%Acero
ka=46; %conductividad termica J/(m·s·ºC)
roa=7.85; %densidad gr/cm^3
ca=0.45; %capacidad calorifica J/(gr·ºC)
alfa2a=13.1; %flujo lateral mm^2/s

%Acero plateado 
kap=100; %conductividad termica J/(m·s·ºC)
roap=8; %densidad gr/cm^3
cap=0.3; %capacidad calorifica J/(gr·ºC)
alfa2ap=60; %flujo lateral mm^2/s

%Plata
kp=429; %conductividad termica J/(m·s·ºC)
rop=9.32; %densidad gr/cm^3
cp=0.235; %capacidad calorifica J/(gr·ºC)
alfa2p=196; %flujo lateral mm^2/s


%Tiempo y espacio
t=linspace(0,1,100000);
t=t';
x=linspace(0,1,100);
x=x';
dx=x(2)-x(1);
dt=t(2)-t(1);

%Condiciones iniciales y de contorno
To=vectorize(inline('30*x^2-140*x+150')); %cond inicial t=0, coef en ºC
cca=150; %cond contorno ºC para todo t
ccb=40; %cond contorno ºC para todo t

%Iniciar vectores y valores de 1
w=zeros(1,100);
k=zeros(1,100);

ro=1;
c=1;
alfa2=1;

%Bucle para diferenciar materiales segun posicion
for i=1:100 
   if i>80 
        k(i)=ka;
        ro=roa;
        c=ca;
        alfa2=alfa2a;
   elseif i<20
       k(i)=ka;
        ro=roa;
        c=ca;
        alfa2=alfa2a;
    elseif i>20 && i<50
        k(i)=kap;
        ro=roap;
        c=cap;
        alfa2=alfa2ap;
    elseif i<80 && i>50
        k(i)=kp;
        ro=rop;
        c=cp;
        alfa2=alfa2p;
   end
    k(20)=(ka+kap)/2;
    k(50)=(kap+kp)/2;
    k(80)=(ka+kp)/2;
    w(i)=(dt/(ro*c*dx^2));
end


%Matriz A
 
A=zeros(100,100);
A(1,1)=1;
A(100,100)=1;

for j=2:99
    A(j,j-1)=w(j)*1/2*(3*k(j)-k(j+1));
    A(j,j)=w(j)*(-2*k(j));
    A(j,j+1)=w(j)*1/2*(k(j)+k(j+1));
end

T=To(x);


for i=1:9999
    T=A*T;
    plot(x,T)
    getframe(gca)
 
end

