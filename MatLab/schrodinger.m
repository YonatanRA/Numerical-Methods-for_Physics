%Pozo de potencial unidimensional
%Funcion par
clear 
k=64; %k=2maVoa^2/hbarra^2
%alfa=pi^2/k....alfa=E/Vo

phi(1)=0;%condiciones iniciales pares
dphi(1)=1;

u=linspace(-3,3,61)


ntol=10^-5;
t=(log2(1/ntol)/log2(2));
n=ceil(t);%siguiente entero mayor

Ea=0.1;
Eb=2;
Ea(1)=Ea;
Eb(2)=Eb;


for i=1:n
    E(i)=(Ea(i)+Eb(i))/2
    fa=f(Ea(i))
    fx=f(Eb(i))
    if fa*fx<0
        E(i)=Eb(i+1)
    else
        E(i)=Ea(i+1)
    end
    E(n)=E
end





