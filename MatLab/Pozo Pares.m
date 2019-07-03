%Pozo de potencial. Funciones pares.
clear all
clc

tol=0.0001; % Tolerancia.
dx=0.01; % Diferencial de x.
k=64;  % Constante k=2ma^2Vo/h(barra)^2.
alfai=0.1245; % Primer alfa=0.1245
alfa=alfai+tol; % Definicion alfa.


L=1; % Anchura del pozo.
nx=L/dx; % Numero de puntos,discretizacion de x.
u=linspace(0,L,nx); % Vector discretizacion.


f1=zeros(1,nx);  % Se crean los vectores necesarios
f1(1)=1;         % para inicializar las funciones 
df1=zeros(1,nx); % y las derivadas , y para poder 
f2=zeros(1,nx);  % realizar posteriormente el shooting method.
f2(1)=1;         % Las condiciones iniciales corresponden
df2=zeros(1,nx); % a las funciones pares.
f3=zeros(1,nx);
f3(1)=1;
df3=zeros(1,nx);


c=zeros(1,nx);  % Vectores para inicializar
c1=zeros(1,nx); % las constantes.
c2=zeros(1,nx);


while abs(alfa-alfai)>tol; % Mientras la diferencia de 
                           % los alfa sea mayor que la tolerancia...
                           
    for i=2:nx; % Bucle en la anchura del pozo.
        if u(i)<=0.5; % Definicion de ctes segun posicion.
            c1(i)=-k*alfai;
            c2(i)=-k*alfa;
        else
            c1(i)=k*(1-alfai);
            c2(i)=k*(1-alfa);
        end
        f1(i)=f1(i-1)+df1(i-1)*dx; % Discretizacion funciones.
        f2(i)=f2(i-1)+df2(i-1)*dx;
        df1(i)=df1(i-1)+c1(i-1)*f1(i-1)*dx; % Discretizacion derivadas. 
        df2(i)=df2(i-1)+c2(i-1)*f2(i-1)*dx;
    end
    
    if f1(nx)*f2(nx)<0; % Primera parte shooting method.
        alfa2=(alfai+alfa)/2;
        
        for i=2:nx; % Bucle en la anchura del pozo.
            if u(i)<=0.5; % Definicion de ctes segun posicion.
                c(i)=-k*alfa2;
            else
                c(i)=k*(1-alfa2);
            end
            f3(i)=f3(i-1)+df3(i-1)*dx;% Discretizacion funcion.
            df3(i)=df3(i-1)+c(i-1)*f3(i-1)*dx;% Discretizacion derivada.
        end
        if f1(nx)*f3(nx)<0; % Segunda parte shooting method.
            alfa=alfa2;
        else
            alfai=alfa2;
        end
    else
        alfa=alfa+0.00001; % Segundo alfa=E/Vo=0.8398
    end
end


plot(u,f1);              % Representacion grafica.
title(['Funcion Par']);  % Se representa la mitad del pozo.
xlabel(['x ; Alfa = ',num2str(alfai,'%.4f')]);
ylabel('F(x)');
