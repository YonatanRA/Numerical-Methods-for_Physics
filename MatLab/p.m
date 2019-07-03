%practica 1
function i=p;
B=unifrnd(5,6,10000,1);
j=0;
for i=1:10000;
    if (abs(B(i)-5.5)<=1/6);
        j=j+1;
    end
end
p=j/10000
end
