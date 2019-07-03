function coseno
f=inline('cos(x)')
fplot(f,[0,1],'b')
hold on
for i=6:2:12,
    x=linspace(0,1,i);
    y=f(x);
    p=ifn2(x,y,1)
    pause
end
