function [t,y]=euler(f,to,tn,yo,n,s)
%f es la funcion y prima, to es el tiempo inicial,tn es el tiempo final,
% yo es la condicion inicial de Cauchy, n es el numero de los subintervalos
% y s es la solucion exacta si se conoce

if nargin==5;%no entrar sol exacta
    s='0';  % igual hay problema de representacion por el tamaño de los ejes
end


h=(tn-to)/n; %salto
t=linspace(to,tn,n); %vector de x
f=inline(f,'t','y'); %funcion de dos variables
y=zeros(0,n);   %vector de ceros para rellenar con el bucle
y(1)=yo; %reasignar condicion inicial de Cauchy
for i=1:n-1;
 y(i+1)=y(i)+(h*f(t(i),y(i)));
end
end


%plot(t,y) %grafica de el metodo de euler....podria ser plot(t,y,'x') para verlño0 por puntos
%hold on
%fplot(s,[to,tn]) %grafica solucion exacta
%end


%tambien puede ser
%plot(t,y,'x')
%if nargin==6
%    hold on
%    fplot(s,[to,tn])
%end