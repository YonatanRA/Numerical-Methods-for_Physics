clear all
clc

tau1=7.5;
tau2=205;
wx=1/tau1;
wy=1/tau2;

N0=1000; %Nº átomos inicial
T=linspace(0,50,1000); %Tiempo hasta que estudiamos las desintegraciones
syms t
syms x
xi1=zeros(N0,1);
p1=(1/tau1)*exp(-t/tau1);
norma=int(p1,0,inf);

%Simulación de la desintegración de Bi
P1=int(p1,0,x);
X1=finverse(P1);
des1=rand(size(xi1));
X1=char(X1);
for i=1:length(xi1);
    xi1(i)=subs(X1,'x',des1(i)); %Tiempo en realizar la desintegración (aleatorio)
end

h=0;
k=0;
N1=zeros(size(xi1));
N1(1)=N0;
for j=2:N0,
    for l=1:N0,
        if xi1(l)<T(j),
            h=h+1;
        end
    end
    N1(j)=N1(j-1)-h+k;
    k=h;
    h=0;
end   

%------------------------------------

%Simulación Po
xi2=zeros(N0,1);
p2=(1/tau2)*exp(-t/tau2);
P2=int(p2,0,x);
X2=finverse(P2);
des2=rand(size(xi2));
X2=char(X2);
for i=1:length(xi2);
    xi2(i)=subs(X2,'x',des2(i)); %Tiempo en realizar la desintegración (aleatorio)
end

h=0;
k=0;
m=0;
n=0;
N2=zeros(size(xi2));
for c=2:N0,
    for v=1:N0,
        if xi1(v)<T(c),
            h=h+1;
        end
        if xi2(v)<T(c),
            m=m+1;
        end
    end
    N2(c)=N2(c-1)+(h-k)-(m-n);
    k=h;
    n=m;
    h=0;
    m=0;
end   

%------------------------------------

%Representaciones gráficas

%Bi210
subplot(2,1,1);
plot(T,N1,'.');
[t1,n1]=min(N1);
nf1=fit(T(1:n1-1)',N1(1:n1-1),'exp1') %Ajuste exponencial
title('Desintegración Bi210');
xlabel('Tiempo (días)');
ylabel('Nº átomos');
hold on

%Solución analítica Bi210
Nx=N0*exp(-T/tau1);
plot(T,Nx);

%Po210
subplot(2,1,2);
plot(T,N2,'.');
nf2=fit(T(2:N0)',N2(2:N0),'exp2') %Ajuste exponencial
title('Desintegración Po210');
xlabel('Tiempo (días)');
ylabel('Nº átomos');
hold on

%Solución analítica Po210
Ny=(wx/(wy-wx))*N0*(exp(-wx*T)-exp(-wy*T));
plot(T,Ny);