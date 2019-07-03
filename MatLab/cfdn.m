function [c,x]=cfdn(x,a)  %con [c,x] devuelve los coeficientes y los nodos
%coeficientes C de la derivacion numerica, x nodos , a es alfa
n=length(x);
syms z;
for i=1:n
    m(i,:)=(x.^(i-1));
    b(i)=subs(diff(z^(i-1),z),'z',a);
end
c=m\b'; % la prima es trasponer
end

%detras de length meter b=zeros(n,1)es ya vector columna y m=zeros(n) cuadrada y asi se optimiza

