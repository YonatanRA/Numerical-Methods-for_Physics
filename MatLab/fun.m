function y=fun(c,x) %funcion definida por la que se va  a justar
global grafica
y=c(1)*x+c(2)*exp(-c(3)*x);
set (grafica,'ydata',y);%para ir ajustando la grafica respecto de la aproximacion
pause(.05)
end

