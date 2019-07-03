 f=char('-y(2)','y(1)')

f =

-y(2)
y(1) 

[t,y]=eulerv(f,0,2*pi,[1,0]',30)

plot(t,y(1,:),'x')
hold on
fplot('cos(x)',[0,2*pi])
plot(t,y(2,:),'x')
hold on
fplot('sin(x)',[0,2*pi])
plot(y(1,:),y(2,:))


S = char('y(2)','-4*pi^2*y(1)/(y(1)^2 + y(3)^2)^(3/2)','y(4)','-4*pi^2*y(3)/(y(1)^2 + y(3)^2)^(3/2)');
[t,y]=eulerv(S,0,6,[1,0,0,2*pi]',100);

plot(y(1,:),y(3,:)) %problema de que no se cierra es por estabilidad...añade mas puntos para mejorar
[t,y]=eulerv(S,0,6,[1,0,0,2*pi]',10000);
plot(y(1,:),y(3,:))



