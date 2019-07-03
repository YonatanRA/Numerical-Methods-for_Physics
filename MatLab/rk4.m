function [t,y]=rk4(f,to,tn,yo,n) % runge kutta clasico.. de 4 etapas
%f funcion to t inicial.tn t final.yo condicion inicial.n numero de pasos

h=(tn-to)/n; %salto tamaño de paso fijo
t=linspace(to,tn,n+1); %vector de x
f=inline(f,'t','y'); %funcion de dos variables
y=zeros(0,n);   %vector de ceros para rellenar con el bucle
y(1)=yo; %reasignar condicion inicial de Cauchy

for i=1:n;
    k1=f(t(i),y(i));
    k2=f(t(i)+h/2,y(i)+(h/2)*k1);
    k3=f(t(i)+h/2,y(i)+(h/2)*k2);
    k4=f(t(i)+h,y(i)+h*k3);
    y(i+1)=y(i)+((h/6)*(k1+2*k2+2*k3+k4));
end
end