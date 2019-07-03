% Interferencia Multiple

d=5; %espesor 5 metros
no=1; %indice refraccion aire
n1=3/2; %indice refraccion lamina
lamb=500*10^-9; %longitud de onda en metros
k=2*pi/lamb; %numero de onda en metros a la menos uno
Io=1; %intensidad inicial de la onda (tomada como unidad)
Zi=linspace(0,pi/2,1000); % 1000 angulos de incidencia entre 0 y pi/2

Zt=asin(no*sin(Zi)/n1); % 1000 angulos de transmision

for k=1:1000  %bucle para cada angulo
    rs(k)=(no*cos(Zi(k))-n1*cos(Zt(k)))/(no*cos(Zi(k))+n1*cos(Zt(k))); %coeficientes reflexion
    rp(k)=(n1*cos(Zi(k))-no*cos(Zt(k)))/(n1*cos(Zi(k))+no*cos(Zt(k)));
    Rs(k)=(rs(k)).^2;
    Rp(k)=(rp(k)).^2;
    
    ts(k)=(2*no*cos(Zi(k)))/(no*cos(Zi(k))+n1*cos(Zt(k)));%coeficientes transmision
    tp(k)=(2*no*cos(Zi(k)))/(no*cos(Zt(k))+n1*cos(Zi(k)));
    Ts(k)=1-Rs(k);
    Tp(k)=1-Rp(k);
    
    phi(k)=2*k*d*cos(Zt(k)); %desfase por diferencia de camino optico
    
    Its(k)=Io*Ts(k).^2/(Ts(k).^2+4*Rs(k)*(sin(phi(k)/2)).^2); %intensidad transmitida s
    Itp(k)=Io*Tp(k).^2/(Tp(k).^2+4*Rp(k)*(sin(phi(k)/2)).^2); %intensidad transmitida p
    
    Irs(k)=Io*(2*rs(k)/(1-rs(k).^2)).^2*(sin(phi(k)/2)).^2/(1+(2*rs(k)/(1-rs(k).^2)).^2*(sin(phi(k)/2)).^2); %intensidad reflejada s
    Irp(k)=Io*(2*rp(k)/(1-rp(k).^2)).^2*(sin(phi(k)/2)).^2/(1+(2*rp(k)/(1-rp(k).^2)).^2*(sin(phi(k)/2)).^2); %intensidad reflejada p
    
  
end



%subplot(2,1,1)
%plot(Irs,Irp,'r')
%title('INTENSIDAD REFLEJADA (P frente a S)')
%ylabel('Irp')
%xlabel('Irs')
%subplot(2,1,2)
%plot(Its,Itp,'b')
%title ('INTENSIDAD TRANSMITIDA (P frente a S)')
%xlabel('Its')
%ylabel('Itp')







%subplot(2,1,1)
%plot(Zi,Irs,'r')
%title('Intensidad reflejada componente s')
%ylabel('Intensidad')
%subplot(2,1,2)
%plot(Zi,Its,'b')
%title ('Intensidad transmitida componente s')
%xlabel('Angulo de incidencia   [0,pi/2]')
%ylabel('Intensidad')

subplot(2,1,1)
plot(Zi,Irp,'r')
title('Intensidad reflejada componente p')
ylabel('Intensidad')
subplot(2,1,2)
plot(Zi,Itp,'b')
title ('Intensidad transmitida componente p')
xlabel('Angulo de incidencia   [0,pi/2]')
ylabel('Intensidad')

