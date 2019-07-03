function [c,x]=cfinw(x,a,b,w)  %x es nodos y a,b el intevalo, w es la funcion peso...calculo de formulas de integracion numerica
%coeficientes C de la integracion numerica, x nodos , a es alfa
if nargin==3,
    w='1';
end
n=length(x);
syms z;
w=inline(w);
for i=1:n
    m(i,:)=(x.^(i-1));
    p(i)=int((z^(i-1))*w(z),z,a,b);
end
c=m\p.'; % la prima es trasponer y conjugar...por eso poner el punto que signmifica traspuesto a secas
end


