%potencial electronico
clear
xmin=0; %punto izq mallado
xmax=10; %punto dcha mallado
nA=5; %numero de atomos
xoff=0; %espacio entre bordes y atomos
nx=1000; %puntos de espaciado
Z=1; %numero atomico
x=linspace(xmin,xmax,nx); %mallado
dA=((xmax-xoff)-(xmin+xoff))/(nA+1); %distancia entre atomos
delta=0.1; %parametro para evitar divergencia
Va=zeros(1,nx); %inicializa potencial atomo
Vt=zeros(1,nx); %inicializa potencial total

for j=1:nA;
    for k=1:nx;
        xa=(xmin+xoff)+(j*dA);
        Va(k)=-Z/(abs(x(k)-xa)+delta);
    end
    Vt=Vt+Va;
end
plot(x,Vt)
%title ('Potencial electronico');
title (['Potencial electronico de ' ,num2str(nA,'%4.0f'),' atomos']);
xlabel('posicion');
ylabel('potencial');    
 
    









