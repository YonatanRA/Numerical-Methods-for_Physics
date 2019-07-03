%Tema 3 EDO

%Metodo de Euler
[t,y]=euler('y',0,1,1,60,'exp(t)')
%y(t) es la exponencial de t
[t1,y1]=euler('y',0,1,1,100);
[t2,y2]=euler('y',0,1,1,200);
error1=abs(exp(t1)-y1); %el valor absoluto
error2=abs(exp(t2)-y2);
e1=max(error1) %el max del valor absoluto
e2=max(error2)
e1/e2 % para el 2^alfa
[t,y]=euler('cos(t)',0,2*pi,0,20,'sen(t)'); %ejemplo de que el error no siempre se acumula
%para metodo euler vectorial...da un sistema
f=char('-y(2)','y(1)')
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


%Metodo Runge-Kutta
[t,y]=rk4('y',0,1,1,10) %para el metodo runge-kutta rk4
plot(t,y)
hold on
fplot('exp(t)',[0,1])
% orden convergencia del metodo rk4 haciendo el cociente de errores
% para una sola ecuacion
[t1,y1]=rk4('y',0,1,1,100);
error1=abs(exp(t1)-y1);
e1=max(error1);
[t2,y2]=rk4('y',0,1,1,200);
error2=abs(exp(t2)-y2);
e2=max(error2);
da=e1/e2; % esto seria 2 elevado a alfa...asi que alfa
alfa=log2(da) % orden de convergencia
%otro ejemplo
f=char('-y(2)','y(1)');
[tn,soln]=rk4vec(f,0,2*pi,[1,0]',10); %..[1,0]' vector de condiciones iniciales traspuesto
[t,s]=rk4vec(f,0,2*pi,[1,0]',10);
plot(t,s)
hold on
fplot('sin(t)',[0,2*pi])
hold on
fplot('cos(t)',[0,2*pi])
plot(s(1,:),s(2,:)) %asi sale una circunferencia
%Ahora errores y convergencia de rk4 vectorial
[t,y]=rk4vec(f,0,2*pi,[1,0]',100);
error1=cos(t)-y(1,:);
error2=sin(t)-y(2,:);
for i=1:length(t)
    norma(i)=norm([error1(i),error2(i)],inf);
end
e1=max(norma);
[t,y]=rk4vec(f,0,2*pi,[1,0]',200);
error1=cos(t)-y(1,:);
error2=sin(t)-y(2,:);
for i=1:length(t)
    norma(i)=norm([error1(i),error2(i)],inf);
end
e2=max(norma);
da=e1/e2;
alfa=log2(da)
%otro...orbita planetaria...f centripeta
orbita % ecuaciones del problema 
[t,y]=rk4vec(S,0,1,[1,0,0,2*pi]',1000); %con h=1/1000
t1=t;
y1=y;
[t2,y2]=rk4vec(S,0,1,[1,0,0,2*pi]',2000);%con h=1/2000
error1=y2(:,1:2:end)-y1; %y2 tiene el doble de puntos que y1...por lo que se cogen de dos en dos
for i =1:length(t)%para hacer la norma de los vectores
    normerr1(i)=norm(error1(:,i),inf);
end
E1=max(normerr1);%el maximo de la norma

[t3,y3]=rk4vec(S,0,1,[1,0,0,2*pi]',4000);
error2=y3(:,1:2:end)-y2;
for i=1:length(t2)
    normerr2(i)=norm(error2(:,i),inf);
end
E2=max(normerr2);
da=E1/E2; %es 16 aprox
alfa=log2(da)  %orden de convergencia

















