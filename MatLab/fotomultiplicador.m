clear all
clc

nd=6; %N� d�nodos
v=3; %Ganancia d�nodo
ne=zeros(1,nd+1); %N� electrones inicial
ne(1)=10;
k=1;
A=1;
h=0;
for i=1:nd,
    for j=1:ne(i),
        while true,
            u=rand(1);
            A=u*A;
            if A<exp(-v),
                nk=k-1;
                break
            else
                k=k+1;
            end
        end
        A=1;
        k=1;
        h=h+nk;
    end
    ne(i+1)=ne(i)-j+h;
    h=0;
    j=0;
end