function x = contrac(f,a,b,tol) %funcion contractiva 
f=inline(f);
k=f(a);
n=((log(tol*(1-k)/(b-a)))/log(k));
xo=a;

for i=1:n;
    x(1)=xo;
    x(i+1)=f(x(i));
    error=abs(x(i+1)-x(i));
    if error<tol
        break
    end
end
end