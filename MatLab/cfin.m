function [c,x]=cfin(x,a,b)  %x es nodos y a,b el intevalo...calculo de formulas de integracion numerica
%coeficientes C de la integracion numerica, x nodos , a es alfa
n=length(x);
syms z;
for i=1:n
    m(i,:)=(x.^(i-1));
    p(i)=int(z^(i-1),z,a,b);
end
c=m\p.'; % la prima es trasponer y conjugar...por eso poner el punto que signmifica traspuesto a secas
end


