% se va a calcular la convergencia del metodo rk4 haciendo el cociente de
% errores

[t1,y1]=rk4('y',0,1,1,100);
error1=abs(exp(t1)-y1);
e1=max(error1)

e1 =

   2.2464e-10

[t2,y2]=rk4('y',0,1,1,200);
error2=abs(exp(t2)-y2);
e2=max(error2)

e2 =

   1.4099e-11

e1/e2

ans =

   15.9327 %esto seria 2 elevado a alfa...asi que alfa=4
   
   
   
%Ahora runge kutta vectorial
   
f=char('-y(2)','y(1)')

f =

-y(2)
y(1) 

[tn,soln]=rk4vec(f,0,2*pi,[1,0]',10)%..[1,0]' vector de condiciones iniciales traspuesto

tn =

         0    0.6283    1.2566    1.8850    2.5133    3.1416    3.7699    4.3982    5.0265    5.6549    6.2832


soln =

    1.0000    0.8091    0.3101   -0.3066   -0.8060   -0.9980   -0.8095   -0.3128    0.3027    0.8023    0.9959
         0    0.5870    0.9498    0.9505    0.5891    0.0035   -0.5829   -0.9468   -0.9497   -0.5907   -0.0070
   
   
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
e1=max(norma)
[t,y]=rk4vec(f,0,2*pi,[1,0]',200);
error1=cos(t)-y(1,:);
error2=sin(t)-y(2,:);
for i=1:length(t)
norma(i)=norm([error1(i),error2(i)],inf);
end
e2=max(norma)
e1/e2

ans =

   15.9831

         
         
