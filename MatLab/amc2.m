function [p,c]=amc2(xd,yd,n,rg)

t(1,:)=ones(1,length(xd));
syms x
for i=2:n+1
    t(i,:)=t(i-1,:).*xd;
end
a=t*t.'; %matriz de coef
b=t*yd.';
c=a\b;
p=sym(c(n+1));
for k=n:-1:1
    p=(c(k)+x*p);
end

if nargin==4
    plot(xd,yd,'r.');
    hold on 
    pause
    fplot(char(p),[min(xd) max(xd)]);
end