%Ahora runge kutta vectorial
   
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

