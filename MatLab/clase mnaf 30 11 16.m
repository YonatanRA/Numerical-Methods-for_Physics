%aproximar una poarabola a una recta.....
% primero el peso w(x)=1
bo=gs(char('1','x'), [0 1])
 
bo =
 
[ 1, 2*3^(1/2)*(x - 1/2)]
 

[p,c]=ma('x^2',bo,[0,1],'1',2)
 
p =
 
x - 1/6
 
 
c =
 
[ 1/3, 3^(1/2)/6]
 
%ahora con w(x)=x

 bo=gs(char('1','x'), [0 1],'x')
 
bo =
 
[ 2^(1/2), 6*x - 4]
 
[p,c]=ma('x^2',bo,[0,1],'x',2)
 
p =
 
(6*x)/5 - 3/10
 
 
c =
 
[ 2^(1/2)/4, 1/5]
 

%El cambiar la funcion peso se ve que la eleccion de dicha funcion da mas importancia a una zona que otra...
%en este caso la funcion peso x da mas importancia a la zona de la derecha y aproxima mejor esta parte 

%Ahora otro:
%mejor apro de exp(x) en [-1,1] con polinomios de grado <=3 y calcular el error cometido
bo=gs(char('1','x','x^2','x^3'), [-1 1])
[p,c]=ma('exp(x)',bo,[0,1],'1',2)
vpa(p,5) %poner p con 5 cifras decimales...simplifica el polinomio 
syms x
normf2=int(exp(2*x),-1,1)
normfm2=sum(c.*c)
error=sqrt(normf2-normfm2)
 double(error)





 

