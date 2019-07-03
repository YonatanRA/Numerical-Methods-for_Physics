function [sol,i] = regfbor( f,a,b,nmax,cot)
f=inline(f);
fa=f(a);
fb=f(b);
for i=1:nmax;
     x(i)=a-fa*(b-a)/(fb-fa);
     c=f(x(i));
     fprintf('%2d % .8f % .1e \n',i,x(i),c)
     if abs(f(x(i))) < cot;
         return
     elseif i>1 && abs(x(i)-x(i-1)) < cot;
         return
     else
        if fa*c<0;
            b=x(i); 
            fb=c;
        elseif fa*c>0;
            a=x(i);
            fa=c;
        end
     end
sol=x(i);
end
