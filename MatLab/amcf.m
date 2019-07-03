function [p,c]=amcf(xd,yd,b,r) %ajuste minimos cuadrados para cualquier funcion generica
%b tiene que entrar como string...base de funciones por las que quieres
%ajustar

n=size (b,1); %numero de funciones por las que se ajusta

for i=1:n
    B(i,:)=subs(b(i,:),'x',xd);
end

G=B*B.'; %matriz de coeficientes
h=B*(yd.'); %term indep
c=G\h; %solucion del sistema

for k=1:n
    pl(k)=c(k)*b(k,:); %meter b(k,:) para meter todo el string
end
p=sum(pl);

if nargin==4 %representacion grafica
    plot(xd,yd,'r.');
    hold on 
    pause
    fplot(char(p),[min(xd),max(xd)]);
end
end
    







