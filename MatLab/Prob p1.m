%practica 1
U=unifrnd(0,1,2000,1);
for i=1:2000
    if(U(i)>0) & (U(i)<0.5)
        Z(i)=U(i);
    else U(i)==0.5;
        Z(i)=0.5;
    end
    if (U(i)>0.5) & (U(i)<1);
       Z(i)=U(i)+0.5;
    end
end
x=-0.1:0.1:1.6
cdfplot(x)


