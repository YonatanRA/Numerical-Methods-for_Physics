%funciones propias
clear
xmin=0; %punto izq mallado
xmax=10; %punto dcha mallado
nA=5; %numero de atomos
xoff=0; %espacio entre bordes y atomos
nx=1000; %puntos de espaciado
x=linspace(xmin,xmax,nx); %mallado
dA=((xmax-xoff)-(xmin+xoff))/(nA+1); %distancia entre atomos
beta=1.64; %parametro de las exponenciales

ibF=0; %indice de control , indice funcione base
nF=15; %numero de funciones de la base

if ibF==0; %Slater
    nF=nA;
        for k=1:nF;
            xa=(xmin+xoff)+(k*dA);
            basisF(k,:)=exp(-beta*(abs(x-xa)));
        end

elseif ibF==1; %Gauss
    nF=nA;
        for k=1:nF;
            xa=(xmin+xoff)+(k*dA);
            basisF(k,:)=exp(-beta*(x-xa).^2);
        end
end
plot(x,basisF);
title (['Funciones propias ' ,num2str(nA,'%4.0f'),' atomos']);
xlabel('x');
ylabel('phi(x)');    
 
    

       
        
    