function [p,c]=amc(xd,yd,n,r) %ajuste por minimos cuadrados para polinomios....ordenadas y abscisas y orden del polinomio
%la salidas son los polinomios y los coeficientes
%hay que crear la matriz B, y sacar G=BBt
syms x
N=length (xd);
B=zeros(n,N);

for i=1:n+1
    for j=1:N
    B(i,j)=(xd(j).^(i-1));
    end
end
G=B*B.';
h=B*(yd.');
c=G\h;

for k=1:n+1
    pl(k)=c(k)*(x.^(k-1));
end
p=sum(pl);

if nargin==4
    plot(xd,yd,'r.');
    hold on 
    pause
    fplot(char(p),[min(xd),max(xd)]);
end
end
    




    
    





