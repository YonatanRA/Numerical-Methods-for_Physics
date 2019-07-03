function x = iterpf2(f,x,nmax,tol) %ITERACION PUNTO FIJO2
f=inline(f);
fprintf (' n    xn        fn   error\n')
for i=1:nmax;
    fx=f(x);
    err=abs(x-fx);
    fprintf('%2d % .8f % .8f % .8f % .1e \n',n,x,fx,err)
    
    if abs(err)<tol
        x=fx;
    end
    fprintf('%2d % .8f % .1e \n',i,xn,c)
    if fa*c<0;
        b=xn;
    elseif fa*c>0;
        a=xn; 
    end