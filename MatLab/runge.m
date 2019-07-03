function runge
f=inline('1./(1+x.^2)')
fplot(f,[-5,5],'r')
hold on
for i=6:2:16,
    x=linspace(-5,5,i);
    y=f(x);
    p=ifn2(x,y,1)
    pause
end
