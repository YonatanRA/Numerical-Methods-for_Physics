function p = ifn (xp,yp,r)
%Interpolante Forma de Newton
d=diag(difdiv(xp,yp)); %Diferencias divididas
n=length(d);
p=d(n);
syms x
for k=n-1:-1:1
    p=p*(x-xp(k))+d(k);
end
p=char(p); %Interpolante

if nargin==3 %Grafica del interpolante
    plot(xp,yp,'x')
    pause
    hold on
    fplot(p,[min(xp),max(xp)],r)
end
