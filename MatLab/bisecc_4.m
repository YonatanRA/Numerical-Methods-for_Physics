function b= bisecc_4(f,a,b,n)
%Metodo de Biseccion
%f: funcion 
%n: numero de iteracion
%a y b: intervalo [a,b]
%e: error permitido
a(1) = a;
b(1) = b;
for i = 1:n
    m(i) = (a(i) + b(i))/2;
    x = a(i);
    Fa = eval(f);
    x = m(i);
    Fb = eval(f);
    if(Fa*Fb) < 0
        a(i+1) = a(i);
        b(i+1) = m(i);
    else
        a(i+1) = m(i);
        b(i+1) = b(i);
    end
   
end
end