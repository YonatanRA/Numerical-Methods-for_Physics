function [d]=deter(A)  %determinante de la matriz
[L,U,p]=LU(A,0);
b=length(p);
signo=1;
for i=2:b
    if (p(i)-p(i-1))>0
        signo=-signo;
    end
end
d=signo*prod(diag(U));
end
