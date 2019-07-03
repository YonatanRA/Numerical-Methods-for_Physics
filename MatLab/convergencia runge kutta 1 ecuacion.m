% orden convergencia del metodo rk4 haciendo el cociente de errores
% para una sola ecuacion

[t1,y1]=rk4('y',0,1,1,100);
error1=abs(exp(t1)-y1);
e1=max(error1);

[t2,y2]=rk4('y',0,1,1,200);
error2=abs(exp(t2)-y2);
e2=max(error2);
da=e1/e2; % esto seria 2 elevado a alfa...asi que alfa
alfa=log2(da)
   
         
