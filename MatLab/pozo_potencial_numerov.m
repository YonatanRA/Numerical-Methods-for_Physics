

clear all
clc

L=0.5;
dx=0.01;
tol=0.0001;
nx=L/dx;
u=linspace(0,L,nx);
k=64;
alfai=0;
nE=2; %Nº energías a calcular (como sabemos, 2 son pares y 1 impar)
par=0; %0=par, 1=impar
c1=zeros(1,nx);
c2=zeros(1,nx);
c3=zeros(1,nx);
g1=zeros(1,nx);
f1=zeros(1,nx);
g2=zeros(1,nx);
f2=zeros(1,nx);
g3=zeros(1,nx);
f3=zeros(1,nx);



    
for n=1:nE,
    alfai=alfa0+dx;
   
    if par==0,
        g1(1)=1;
        g1(2)=1;
        g2(1)=1;
        g2(2)=1;
    else
        g1(1)=0;
        g1(2)=dx;
        g2(1)=0;
        g2(2)=dx;
    end
    
    while abs(alfai-alfa0)>tol,
        
        for i=1:nx,
            if abs(u(i))<0.5
                c1(i)=-k*alfa0;
            else
                c1(i)=k*(1-alfa0);
            end
        end
        f1(1)=g1(1)*(1-(dx^2*c1(1)/12));
        for j=2:nx-1,
            f1(j)=g1(j)*(1-(dx^2*c1(j)/12));
            f1(j+1)=2*f1(j)-f1(j-1)+dx^2*c1(j)*g1(j);
            g1(j+1)=f1(j+1)/(1-(dx^2*c1(j+1)/12));
        end   
        
        for b=1:nx,
            if abs(u(b))<0.5
                c2(b)=-k*alfai;
            else
                c2(b)=k*(1-alfai);
            end
        end
        f2(1)=g2(1)*(1-(dx^2*c2(1)/12));
        for l=2:nx-1,
            f2(l)=g2(l)*(1-(dx^2*c2(l)/12));
            f2(l+1)=2*f2(l)-f2(l-1)+dx^2*c2(l)*g2(l);
            g2(l+1)=f2(l+1)/(1-(dx^2*c2(l+1)/12));
        end 
        
        if f1(nx)*f2(nx)<0,
            alfa2=(alfa0+alfai)/2;
            for m=1:nx,
                if abs(u(m))<0.5
                    c3(m)=-k*alfa2;
                else
                    c3(m)=k*(1-alfa2);
                end
            end
            f3(1)=g3(1)*(1-(dx^2*c3(1)/12));
            for o=2:nx-1,
                f3(o)=g3(o)*(1-(dx^2*c3(o)/12));
                f3(o+1)=2*f3(o)-f3(o-1)+dx^2*c3(o)*g3(o);
                g3(o+1)=f3(o+1)/(1-(dx^2*c3(o+1)/12));
            end 
            if f1(nx)*f3(nx)<0,
                alfai=alfa2;
            else
                alfa0=alfa2;
            end
        else
            alfai=alfai+0.00001;
        end
    end 
    alfa0=alfai;
    a(n)=alfai;
    if mod(nE,2)==0,
        subplot(2,nE/2,n)
    else
        subplot(2,(nE+1)/2,n);
    end
    if par==0,
        plot(-u,f1,'b');
        hold on
    else
        plot(-u,-f1,'b');
        hold on
    end
    plot(u,f1,'b');
    title(['Alfa = ',num2str(a(n),'%.8f')]);
    xlabel('Caja de lado L (m)');
    ylabel('Función de onda');
    hold on
    fplot('0',[-L,L]);
end