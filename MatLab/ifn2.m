function p = ifn2 (xp,yp,r)
%interpolante forma newton
d=diag(difdiv(xp,yp));
n=length(d);
p=d(n);
syms x
for k=n-1:-1:1
    p=p*(x-xp(k))+d(k);
end
p=char(p);

if nargin==3
    plot(xp,yp,'x')
    pause
    hold on
    fplot(p,[min(xp),max(xp)],r)
end
