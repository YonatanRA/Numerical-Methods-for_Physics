function k = ejemplobor( c,p )
x(1)=c;
for n=1:p+1
    x(n+1)=exp(-x(n));
end
for i=1:p-2
    k(i)=abs(x(i+2)-x(i+1))/abs(x(i+1)-x(i))
end

