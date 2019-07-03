u=linspace(-3,3,61);
k=64;
alfa=0.154;
U=abs(u);

if U>0.5
    C=-k*alfa;
elseif U<0.5
    C=k(1-alfa);
end
