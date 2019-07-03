clear all
clc
xmin=0; %Distancia eje por izquierda
xmax=10; %Distancia eje por derecha
xoff=0; %Separación para comenzar representación
nA=5; %Número átomos
ne=5; %Número electrones
nx=1000; %Número puntos eje x
zeta=1; %Número atómico
delta=0.1; %Constante (impide divergencia del potencial)
beta=1.64; %Constante orbitales
gamma=1; % Constante hamiltoniano
ibF=1; %0==Slater, 1==Gauss, 2=Ondas planas
nF=10; %Número funciones base (sólo se utiliza con ondas planas)
x=linspace(xmin,xmax,nx); %Mallado espacial
dist_atomos=((xmax-xoff)-(xmin+xoff))/(nA+1); %Distancia entre átomos consecutivos
Va=zeros(1,nx);
Vtotal=zeros(1,nx);

% Cálculo del potencial

for ia=1:nA,
    for ix=1:nx,
        Va(ix)=-zeta/(abs(x(ix)-(xmin+xoff+ia*dist_atomos))+delta);
    end
    Vtotal=Vtotal+Va;
end

% Construcción orbitales

if ibF==0, %Slater
    orb='Slater';
    nF=nA;
    basisF=zeros(nF,nx); %Funciones de onda
    for j=1:nF,
        basisF(j,:)=exp(-beta*abs(x-(xmin+xoff+j*dist_atomos)));
        norma(j)=trapz(x,basisF(j,:).*conj(basisF(j,:)));
        basisF(j,:)=basisF(j,:)/sqrt(norma(j));
    end
elseif ibF==1, %Gauss
    orb='Gauss';
    nF=nA;
    basisF=zeros(nF,nx); %Funciones de onda
    for j=1:nF,
        basisF(j,:)=exp(-beta*(x-(xmin+xoff+j*dist_atomos)).^2);
        norma(j)=trapz(x,basisF(j,:).*conj(basisF(j,:)));
        basisF(j,:)=basisF(j,:)/sqrt(norma(j));
    end
else %Ondas planas
    orb='ondas planas';
    basisF=zeros(nF,nx); %Funciones de onda
    if mod(nF,2)==0,
        n=linspace(-nF/2,nF/2,nF);
    else
        n=linspace(-(nF-1)/2,(nF-1)/2,nF);
    end
    for j=1:nF,
        basisF(j,:)=exp(1i*2*pi*n(j)*x/(xmax-xmin));
        norma(j)=trapz(x,basisF(j,:).*conj(basisF(j,:)));
        basisF(j,:)=basisF(j,:)/sqrt(norma(j));
    end
end

% Derivadas primera y segunda de las funciones de la base

for k=1:nF,
    derbasisF(k,:)=diff(basisF(k,:))./diff(x);
end
for l=1:nF,
    der2basisF(l,:)=diff(derbasisF(l,:))./diff(x(1:nx-1));
end

% Matriz hamiltoniano y matriz S

for m=1:nF,
    for s=1:nF,
        H(m,s)=trapz(x(1:nx-2),conj(basisF(m,1:nx-2)).*(Vtotal(1:nx-2).*basisF(s,1:nx-2)-gamma*der2basisF(s,:)));
        S(m,s)=trapz(x(1:nx-2),conj(basisF(m,1:nx-2)).*basisF(s,1:nx-2));
    end
end

% Cálculo autovalores/autovectores de H

[autovec,autoval]=eig(H,S);
autoval=diag(autoval); %Energías del sistema (ordenadas de mayor a menor)
[E,ind]=sort(real(autoval),'ascend'); %Ordenamos energías de menor a mayor
autovec=autovec/(diag(sqrt(diag(autovec'*autovec)))); %Normalizamos autovectores
autovec=autovec(:,ind); %Ordenamos autovectores

% Cálculo funciones de onda de la cadena de átomos
phi=zeros(nF,nx);
for u=1:nF,
    for v=1:nF,
        phi(u,:)=phi(u,:)+(autovec(u,v)*basisF(v,:));
    end
end

% Cálculo matriz densidad y densidad electrónica

n=zeros(1,nx);
ro=zeros(nF,nF);
for m=1:nA
    for j=1:nF
        for i=1:nF
            ro(i,j)=conj(autovec(j,m))*autovec(i,m);
            n=n+(conj(basisF(j,:)).*basisF(i,:)*ro(i,j));  
        end
    end
end

% Cálculo nº electrones y energía

n_electrones=real(trapz(x,n)); %Nº electrones
energia_total=sum(E(1:ne)); %Energía total

% Representaciones gráficas

subplot(3,2,1)
plot(x,Vtotal);
title(['Potencial cadena de ',num2str(nA,'%4.0f'),' átomos']);
xlabel('Eje x')
ylabel('Potencial');

subplot(3,2,2);
plot(x,basisF);
title(['Aproximación por orbitales tipo ',num2str(orb,'%s')]);
xlabel('Eje x');
ylabel('Función onda');

subplot(3,2,3);
plot(x(1:nx-1),derbasisF);
title(['Derivada orbitales tipo ',num2str(orb,'%s')]);
xlabel('Eje x');
ylabel('Función onda');

subplot(3,2,4);
plot(x(1:nx-2),der2basisF);
title(['Segunda derivada orbitales tipo ',num2str(orb,'%s')]);
xlabel('Eje x');
ylabel('Función onda');

subplot(3,2,5);
plot(x(1:nx),phi);
title(['Funciones de onda con orbitales tipo ',num2str(orb,'%s')]);
xlabel('Eje x');
ylabel('Función onda');

subplot(3,2,6);
plot(x,n);
title('Densidad electrónica');
xlabel('Eje x');
ylabel('Densidad');