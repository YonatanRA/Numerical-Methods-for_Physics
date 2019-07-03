function x = regula(f,a,b,nmax,tol) %metodo regula falsi
f=inline(f);
fprintf (' n    xn        fn\n')
for i=1:nmax;
    fa=f(a);
    fb=f(b);
    xn=a-fa*(b-a)/(fb-fa);
    b(i+1)=xn;
    c=f(xn);
    if abs(c)<tol
        x=xn;
        return
    elseif abs(b(i+1)-b(i))<tol
        x=xn;
        return
    end
    fprintf('%2d % .8f % .1e \n',i,xn,c)
    if fa*c<0;
        b=xn;
    elseif fa*c>0;
        a=xn; 
    end
end
x=xn;
end
