orbita
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


