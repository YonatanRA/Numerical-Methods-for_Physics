

function [p,c]=amc(xd,yd,n,r)



xd=[1,1.1,1.2,1.3,1.4]

xd =

    1.0000    1.1000    1.2000    1.3000    1.4000

pol=inline('-2+x./2+3*x.^3')

pol =

     Inline function:
     pol(x) = -2+x./2+3*x.^3
     
yd=pol(xd)

yd =

    1.5000    2.5430    3.7840    5.2410    6.9320     
     
    
    
 [p,c]=amc(xd,yd,3,1)   
 
 
 %se evalua p y se hace (yi-p(xi))^2
 vec=yd-subs(p,'x',xd)
  error=sum(vec.*vec)
 double (error)

ans =

   6.9493e-24
   
   
% se hacen numeros aleatorios...con randn es normal....con rand es uniforme
 randn(1,5)

ans =

    0.5377    1.8339   -2.2588    0.8622    0.3188

randn(5,5)

ans =

   -1.3077   -1.3499   -0.2050    0.6715    1.0347
   -0.4336    3.0349   -0.1241   -1.2075    0.7269
    0.3426    0.7254    1.4897    0.7172   -0.3034
    3.5784   -0.0631    1.4090    1.6302    0.2939
    2.7694    0.7147    1.4172    0.4889   -0.7873



 
    
    