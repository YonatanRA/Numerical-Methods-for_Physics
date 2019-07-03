%Pulso OEM con dielectrico y condiciones de contorno 
clear
c=3*10^8;%velocidad luz
wl=632.8*10^-9;%longitud de onda laser
tp=wl/c;%periodo
Nz=300;%puntos espaciales
Nt=900;%puntos temporales
dz=wl/10;%particion espacial
dt=dz/(2*c);%particion temporal
t=0.0;%tiempo inicial
zf=Nz*dz/(10^-6);%valor final de z
Ex(1:Nz)=0;%campo E inicial
Hy(1:Nz)=0;%campo H inicial
z=dz*(1:Nz);%valores iniciales de z
ko=75;%punto de inicio
kd=150;%punto medio,intercara de dielectrico
to=2.5*tp;%retraso temporal
s=0.5*tp;%difusion

%Inicializa cond de contorno absorbentes
Ex11=0;
Ex12=0;
Exn1=0;
Exn2=0;


for i=1:Nt;  %FDTD
    
   for k=2:Nz-1 %Campo electrico
       if k<kd
           c=0.5;
       elseif k>=kd
           c=0.5/4; %aqui se introduce er=4 
       end
       Ex(k)=Ex(k)+c*(Hy(k-1)-Hy(k));
   end
   
   t=i*dt;
   Ex(ko)=Ex(ko)+exp(-0.5*((t-to)/s)^2); %fuente
   %asignacion temporal cond de contorno
   Ex(1)=Ex12;
   Ex12=Ex11;
   Ex11=Ex(2);
   Ex(Nz)=Exn2;
   Exn2=Exn1;
   Exn1=Ex(Nz-1);
   
   for k=1:Nz-1 %Campo magnetico
       Hy(k)=Hy(k)+0.5*(Ex(k)-Ex(k+1));
   end 
    
   
    
    %axis([0 zf -1 1])
    %plot(z/(10^-6),Ex)
    %axis([0 zf -1 1])
    %xlabel('z (micras)')
    %ylabel('E(z,t)')
    %title(['OEM paso temporal'])
    %getframe(gca)
    
    %axis([0 zf -1 1])
    %plot(z/(10^-6),Hy)
    %axis([0 zf -1 1])
    %xlabel('z (micras)')
    %ylabel('H(z,t)')
    %title(['OEM paso temporal'])
    %getframe(gca)
    
    axis([0 zf -1 1 -1 1])
    plot3([z/(10^-6),z/(10^-6)],[Ex,zeros(1,Nz)],[zeros(1,Nz),Hy])
    axis([0 zf -1 1 -1 1.5])
    xlabel('z (micras)')
    ylabel('E(z,t)')
    zlabel('H(z,t)')
    title(['OEM paso temporal'])
    getframe(gca)
    
   
    
    
    
end %final FDTD

        

