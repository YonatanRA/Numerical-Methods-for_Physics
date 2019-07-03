function [c,x]=cfdnb(x,a,k)  %con [c,x] devuelve los coeficientes y los nodos....k es el orden de derivacion...calculo de formulas de derivacion numerica
%coeficientes C de la derivacion numerica, x nodos , a es alfa
n=length(x);
syms z;
if nargin==2
    k=1;
end
for i=1:n
    m(i,:)=(x.^(i-1));
    b(i)=subs(diff(z^(i-1),z,k),'z',a);% k esima derivada
end
c=m\b'; % la prima es trasponer...si no pones b(i,1) en el bucle
end

%detras de length meter b=zeros(n,1)es ya vector columna y m=zeros(n) cuadrada y asi se optimiza

