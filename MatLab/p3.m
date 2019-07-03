%practica 3
function pr=p3;
m1=2; %mu....la matriz sigma es 1ª fila(4  2) 2ªfila(2  3)
m2=3;
s1=2; %sigma
s2=sqrt(3);
ro=1/(sqrt(3));
Y1=normrnd(0,1,1000,1);
Y2=normrnd(0,1,1000,1);
X1=(s1*Y1)+m1;
X2=(m2*(ro*Y1+Y2*sqrt(1-ro^2))+m2);
R=[X1,X2]; %hasta aqui ejercicio 3.1

%Ahora ejercicio 3.4...en vez de 1000 usar 20000 en normrnd del ejercicio 3.1 y en el siguiente bucle..por ejemplo
c=0;
for i=1:1000
    T(i)=((R(i,1))^2*(R(i,2))^2+(R(i,1)*R(i,2)))/((R(i,1))^4+2);
    if (T(i)>=2)
        c=c+1;
    end
end
pr=c/1000;

% Ahora el ejercicio 3.5










