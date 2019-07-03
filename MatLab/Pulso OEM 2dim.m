%Pulso OEM 2dim transversal electrico
clear
c=3*10^8;%velocidad luz
wl=632.8*10^-9;%longitud de onda laser
tp=wl/c;%periodo
Nz=100;%puntos espaciales
Nx=100;
Nt=300;%puntos temporales
dz=wl/10;%particion espacial en z
dx=wl/10;%particion espacial en x
dt=dz/(2*c);%particion temporal
t=0.0;%tiempo inicial
zf=Nz*dz/(10^-6);%valor final de z
xf=Nx*dx/(10^-6);%valor final de x
Ey(1:Nz,1:Nx)=0;%campo Ey inicial
Hx(1:Nz,1:Nx)=0;%campo Hx inicial
Hz(1:Nz,1:Nx)=0;%campo Hz inicial
z=dz*(1:Nz);%valores iniciales de z
x=dx*(1:Nx);%valores iniciales de x
ko=50;%punto medio de inicio z
lo=50;%punto medio de inicio x
to=2.5*tp;%retraso temporal
s=0.5*tp;%difusion

for i=1:Nt;  %FDTD
    
   for k=2:Nz-1; %Campo electrico
       for l=2:Nx-1;
           Ey(l,k)=Ey(l,k)+0.5*(Hx(l,k)-Hx(l,k-1)-Hz(l,k)+Hz(l-1,k));
       end
   end
   
   t=i*dt;
   Ey(ko,lo)=Ey(ko,lo)+exp(-0.5*((t-to)/s)^2); %fuente debil
   %Ey(ko,lo)=exp(-0.5*((t-to)/s)^2); %fuente debil
  
   
   for k=1:Nz-1 %Campo magnetico
       for l=1:Nx-1;
           Hx(l,k)=Hx(l,k)+0.5*(Ey(l,k+1)-Ey(l,k));
           Hz(l,k)=Hz(l,k)+0.5*(Ey(l,k)-Ey(l+1,k));
       end
   end 
   
%2D plot
mesh(x/10^-6,z/10^-6,Ey');
azimut=0.;
elevation=90.;
view(azimut,elevation);
axis([0 xf 0 zf -1 1]);
xlabel('x (micras)')
ylabel('z (micras)')
zlabel('Ey(x,z,t)')
getframe(gca)

     
end %final FDTD

        







