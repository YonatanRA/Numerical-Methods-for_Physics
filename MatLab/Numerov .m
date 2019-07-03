%Metodo de Numerov.
clear all
clc

tol=0.0001; % Tolerancia.
dx=0.01; % Diferencial de x.
k=64;  % Constante k=2ma^2Vo/h(barra)^2.
alfai=0; % Primer alfa=0.


L=0.5; % Anchura del pozo/2.
nx=L/dx; % Numero de puntos,discretizacion de x.
u=linspace(0,L,nx); % Vector discretizacion. 


nE=2; % Numero de niveles de energia (1 o 2).
par=0; % Se elige la paridad de la funcion 0=par  1=impar.


f1=zeros(1,nx); % Se crean los vectores necesarios
f2=zeros(1,nx); % para inicializar las funciones 
f3=zeros(1,nx); % y las constantes.      
g1=zeros(1,nx);
g2=zeros(1,nx);
g3=zeros(1,nx);
c1=zeros(1,nx); 
c2=zeros(1,nx);
c3=zeros(1,nx);


for n=1:nE; % Bucle en el numero de energias.
    
    if par==0;   % Segun sea par o impar se escogen
        g1(1)=1; % las diferentes cond iniciales.
        g1(2)=1;
        g2(1)=1;
        g2(2)=1;
    else
        g1(1)=0;
        g1(2)=dx;
        g2(1)=0;
        g2(2)=dx;
    end
    
    alfa=alfai+dx; % Definicion alfa.
    
    while abs(alfa-alfai)>tol; % Mientras la diferencia de 
                               % los alfa sea mayor que la tolerancia...
    
        for i=1:nx;  % Bucle en la anchura del pozo.
            if abs(u(i))<0.5;
                c1(i)=-k*alfai; % Definicion de la cte c1 segun posicion.
            else
                c1(i)=k*(1-alfai);
            end
        end
        
        
        f1(1)=g1(1)*(1-(dx^2*c1(1)/12)); % Condicion inicial f1.
        for j=2:nx-1;   % Discretizacion funciones f1 y g1.       
            f1(j)=g1(j)*(1-(dx^2*c1(j)/12));
            f1(j+1)=2*f1(j)-f1(j-1)+dx^2*c1(j)*g1(j);
            g1(j+1)=f1(j+1)/(1-(dx^2*c1(j+1)/12));
        end   
        
        
        for h=1:nx; % Bucle en la anchura del pozo.
            if abs(u(h))<0.5;
                c2(h)=-k*alfa; % Definicion de la cte c2 segun posicion.
            else
                c2(h)=k*(1-alfa);
            end
        end
        
        
        f2(1)=g2(1)*(1-(dx^2*c2(1)/12)); % Condicion inicial f2.
        for p=2:nx-1; % Discretizacion funciones f2 y g2.
            f2(p)=g2(p)*(1-(dx^2*c2(p)/12));
            f2(p+1)=2*f2(p)-f2(p-1)+dx^2*c2(p)*g2(p);
            g2(p+1)=f2(p+1)/(1-(dx^2*c2(p+1)/12));
        end 
        
        if f1(nx)*f2(nx)<0; % Primera parte shooting method.
            alfa2=(alfai+alfa)/2;
            
            for m=1:nx; % Bucle en la anchura del pozo.
                if abs(u(m))<0.5
                    c3(m)=-k*alfa2; % Definicion de la cte c3 segun posicion.
                else
                    c3(m)=k*(1-alfa2);
                end
            end
            f3(1)=g3(1)*(1-(dx^2*c3(1)/12)); % Condicion inicial f3.
            for q=2:nx-1;  % Discretizacion funciones f3 y g3.
                f3(q)=g3(q)*(1-(dx^2*c3(q)/12));
                f3(q+1)=2*f3(q)-f3(q-1)+dx^2*c3(q)*g3(q);
                g3(q+1)=f3(q+1)/(1-(dx^2*c3(q+1)/12));
            end 
            if f1(nx)*f3(nx)<0; % Segunda parte shooting method.
                alfa=alfa2;
            else
                alfai=alfa2;
            end
        else
            alfa=alfa+0.00001;
        end
    end 
    
    alfai=alfa; % Redefinicion de alfa
    a(n)=alfa;
    
    
    if nE>1;  % Representacion grafica
        subplot(2,nE/2,n); % Cambia el plot segun  
    else                   % sea la paridad y los niveles
        plot(u,(nE+1)/2);  % de energia.
    end
    
    if par==0;
        plot(-u,f1,'b');
        hold on
    else
        plot(-u,-f1,'b');
        hold on
    end
    plot(u,f1,'b');
    title(['Alfa = ',num2str(a(n),'%.5f')]);
    xlabel('x');
    ylabel('F(x)');
   
end