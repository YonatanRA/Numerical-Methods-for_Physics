dif=0.0001;
dx=0.01;
k=64;
alfa0=0.11; % Primer alfa=0.1012, segundo alfa=0.8398
alfa=alfa0+0.0001;
L=1;
nx=L/dx;
u=linspace(0,L,nx);

phi1=zeros(1,nx);
phi1(1)=1;
derphi1=zeros(1,nx);

phi2=zeros(1,nx);
phi2(1)=1;
derphi2=zeros(1,nx);

phi3=zeros(1,nx);
derphi3=zeros(1,nx);

c1=zeros(1,nx);
c2=zeros(1,nx);
c=zeros(1,nx);

while abs(alfa-alfa0)>dif,
    
    for i=2:nx,
        if u(i)<=0.5,
            c1(i)=-k*alfa0;
            c2(i)=-k*alfa;
        else
            c1(i)=k*(1-alfa0);
            c2(i)=k*(1-alfa);
        end
        phi1(i)=phi1(i-1)+derphi1(i-1)*dx;
        derphi1(i)=derphi1(i-1)+c1(i-1)*phi1(i-1)*dx;
        phi2(i)=phi2(i-1)+derphi2(i-1)*dx;
        derphi2(i)=derphi2(i-1)+c2(i-1)*phi2(i-1)*dx;
    end
    
    if phi1(nx)*phi2(nx)<0,
        alfa2=(alfa0+alfa)/2;
        for i=2:nx,
            if u(i)<=0.5,
                c(i)=-k*alfa2;
            else
                c(i)=k*(1-alfa2);
            end
            phi3(i)=phi3(i-1)+derphi3(i-1)*dx;
            derphi3(i)=derphi3(i-1)+c(i-1)*phi3(i-1)*dx;
        end
        if phi1(nx)*phi3(nx)<0,
            alfa=alfa2;
        else
            alfa0=alfa2;
        end
    else
        alfa=alfa+0.00001;
    end
end
plot(u,phi1);
title(['Alfa = ',num2str(alfa0,'%.4f')]);