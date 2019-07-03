function [c d]=bcs (f,a,b,n)
%[c d] es el intervalo con cambio de signo..f funcion..[a b]intervalo donde
%se busca el cambio de signo y nmax el numero maximo de niveles
f=inline(f);
fa=f(a);
h=b-a;
np=1;
if fa*f(b)<0
    c=a;
    d=b;
end
for i=1:n
    x=a+h/2;
    for j =1:np
        if fa*f(x)<0
            c=(j-1,x-h,a);
        end
        x=x+h
    end
    h=h/2
    np=2*np
end
end

         





