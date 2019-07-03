[t,y]=rk4('y',0,1,1,10) %para el metodo runge-kutta rk4
plot(t,y)
hold on
fplot('exp(t)',[0,1])