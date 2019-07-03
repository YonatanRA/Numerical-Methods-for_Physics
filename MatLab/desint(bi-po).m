%Desintegración radiactiva Bismuto-Polonio 210
clear all
clc

taub=7.5; % Vida media bismuto 210 ; 7,5 dias
taup=205; % Vida media polonio 210 ; 205 dias
wb=1/taub; % Probabilidad desintegracion Bi-210 
wp=1/taup; % Probabilidad desintegracion Po-210 
N0=2000; % Numero de átomos inicial Bi
T=linspace(0,50,2000); % Vector de tiempos, 50 dias 
syms t   
syms x    


%Desintegración de Bi-210

xb=zeros(N0,1); % Vector inicial de atomos Bi
pb=wb*exp(-t*wb); % Distribucion de Poisson Bi
PB=int(pb,0,x); % Funcion, integracion Poisson
XB=finverse(PB); % Funcion inversa
db=rand(size(xb)); % Aleatorios en el tamaño del vector, desintegracion
XB=char(XB);  % Se convierte a caracteres
for i=1:length(xb); % Tiempo aleatorio para desintegracion
    xb(i)=subs(XB,'x',db(i)); 
end

h=0; % Inicializa el contador
k=0;
NB=zeros(size(xb)); % Vector de atomos Bi
NB(1)=N0; % Al principio solo hay Bi
for j=2:N0, % Evolucion temporal numero de atomos
    for l=1:N0,
        if xb(l)<T(j),
            h=h+1;
        end
    end
    NB(j)=NB(j-1)-h+k; % Numero atomos Bi final
    k=h;
    h=0;
end   



% Desintegracion Po-210

xp=zeros(N0,1); % Vector inicial de atomos Po
pp=wp*exp(-t*wp); % Distribucion de Poisson Po
PP=int(pp,0,x); % Funcion, integracion Poisson
XP=finverse(PP); % Funcion inversa
dp=rand(size(xp)); % Aleatorios en el tamaño del vector, desintegracion
XP=char(XP); % Se convierte a caracteres
for i=1:length(xp); % Tiempo aleatorio para desintegracion
    xp(i)=subs(XP,'x',dp(i));
end

h=0; % Inicializa el contador
k=0;
m=0;
n=0;
NP=zeros(size(xp)); % Vector de atomos Po
for c=2:N0, % Evolucion temporal numero de atomos
    for v=1:N0,
        if xb(v)<T(c),
            h=h+1;
        end
        if xp(v)<T(c),
            m=m+1;
        end
    end
    NP(c)=NP(c-1)+(h-k)-(m-n); % Numero atomos Po final 
    k=h;
    n=m;
    h=0;
    m=0;
end   



% Graficas
figure(1) % Bi-210
plot(T,NB,'.');
title('Desintegración Bi-210');
xlabel('Tiempo en días');
ylabel('Nº átomos');
hold on
NBs=N0*exp(-T*wb); % Expresion de la solución analítica Bi-210
plot(T,NBs,'r');
hold off
figure(2) % Po-210
plot(T,NP,'.');
title('Desintegración Po-210');
xlabel('Tiempo en días');
ylabel('Nº átomos');
hold on
NPs=(wb/(wp-wb))*N0*(exp(-wb*T)-exp(-wp*T)); % Expresion de la solución analítica Po-210
plot(T,NPs,'r');
hold off

[tb,nb]=min(NB); % Ajuste
Ajuste_Bi210=fit(T(1:nb-1)',NB(1:nb-1),'exp1') 
Ajuste_Po210=fit(T(2:N0)',NP(2:N0),'exp2') 