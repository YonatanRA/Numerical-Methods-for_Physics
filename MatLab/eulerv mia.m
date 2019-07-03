function [tn,soln]=eulerv(f,to,tfin,yo,n,s) %es un sistema ....s se pone en el caso de k sea una sola ecuacion en el sistema
%la sintaxis es la misma
%f es ec diff
%to es t inicial
%tfin es t final
%yo condicion de cauchy en vector....en columna se mete
%n numero de subintervalos
%s solucion exacta de ser una sola ecuacion

%>>f=char('-y(2)','y(1)')
%>>size(f)     2   5......coger 2...ne=size(f,1);  numero de ecuaciones

ne=size(f,1);
for i=1:ne
    F(i,1)=sym(f(i,:));
end
h=(tfin-to)/n;
tn=linspace(to,tfin,n+1);
y=yo; %primer valor
soln=y; %vector de todas las y para representar
for i=1:n
    t=tn(i);
    yn=y+h*eval(F);  %y nueva es la y vieja y se reenchufa....metodo de euler
    %eval asignando valor a las variables evalua F...la evalua para los valores actuales puesto k F es syms
    soln=[soln yn];
    %if ne==1
        %plot(tn(i+1),yn,'r.');
        %plot([tn(i) tn(i+1)],[y yn],'m.-');
        %axis image
        %pause
    %end
end
y=yn;
end
