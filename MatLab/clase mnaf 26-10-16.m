[t,y]=euler('y',0,1,1,60,'exp(t)');


y(t) es la exponencial de t
 y(t) es la exponencial de t
      ?
      
[t1,y1]=euler('y',0,1,1,100);
[t2,y2]=euler('y',0,1,1,200);
error1=abs(exp(t1)-y1); %el valor absoluto
error2=abs(exp(t2)-y2);
e1=max(error1) %el max del valor absoluto

e1 =

    0.0402

e2=max(error2)

e2 =

    0.0203

e1/e2 % para el 2^alfa

ans =

    1.9871      
    
[t,y]=euler('cos(t)',0,2*pi,0,20,'sen(t)'); %ejemplo de que el error no siempre se acumula    
    
    
    