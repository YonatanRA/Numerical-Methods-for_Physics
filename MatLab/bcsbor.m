function [c,d,nivel] = bcsbor( f,a,b,nmax )
f=inline(f);
fa=f(a);
h=b-a;
for j=1:nmax
    for i=1:2^(j-1);
        x(i)=a+h/(2^(j))+(i-1)*h/(2^(j-1));
        fx=f(x(i));
        if fx*fa<0;
            if i==1;
                c=a;
                d=x(i);
            else
                d=x(i);
                c=x(i-1);
            end
            nivel=j;
            return
        end    
    end
        
end

