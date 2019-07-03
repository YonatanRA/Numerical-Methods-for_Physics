function[valor]=pozopot(k,alfa,vcsborde,z)
%explicacion vcsborde en bisecpozopot

%k depende de U0, factor de escala(normalizacion) es meterle 1 en el valor central?

du=0.0001; %paso, tiene que ser divisor de 0.5 (el borde del pozo)    %VARIAR
nz=50000; %numero ptos -1                                            %VARIAR
nz2=nz/2; %numero ptos a un lado del punto medio
nzm=(nz/2)+1;  %pto medio
borde=(0.5/du);   %contando desdel el pto medio, indice del vector onda que corresponde al valor x=0.5
onda(1:nz+1)=zeros(1,nz+1);
ondap(1:nz+1)=zeros(1,nz+1);
ptomira=nzm+borde*vcsborde; %indice en ambos x y onda (son vectores del mismo tamano) del pto en el que miras
ejes=1; %switch para que nos fije los ejes la primera vez que llamamos a pozopot
    
%CI´S
%onda(nzm)=0; %impares      
%ondap(nzm)=1;
%signo=-1;
onda(nzm)=1; %pares
ondap(nzm)=0;
signo=1;

%CREAMOS LA FUNCION
c(1:nz2+1)=1;    %explicacion de como lo multiplicdo por onda en dibujito libreta, preguntarme
c(1:borde)=-k*alfa;                 
c(borde+1:nz2+1)=k*(1-alfa);
for i=1:nz2
    onda(nzm+i)=onda(nzm+i-1)+ondap(nzm+i-1)*du;
    ondap(nzm+i)=ondap(nzm+i-1)+c(i)*onda(nzm+i-1)*du;
    onda(nzm-i)=signo*onda(nzm+i);
end

%Es posible que le hayamos mandado mandar fuera del limite que hemos definido, entonces introducimos mensaje de error
try
    valor=onda(ptomira); %valor del pto en el que miras
catch err
    error('Te sales de los limites. Mete mas puntos, aumenta el paso, o mira en un punto mas cercano.');
end

%z PARA REPRESENTAR
if nargin==4
    xmed=(du*nz)/2; %x maximo
    xgrid=linspace(-xmed,xmed,nz+1);
    if ejes==1
            maxinicial=max(onda);
            ejes=0;
    end
    axis([-xmed xmed -maxinicial maxinicial ])
    plot(xgrid,onda);
    hold on
    plot(xgrid(ptomira),valor,'.r')
    text(xgrid(ptomira)-0.23*xmed,valor+0.1*max(onda),sprintf('(%4.2f ,%4.3e)',xgrid(ptomira),valor),'color','r');
    xlabel('x')
    ylabel('Onda')
    frame=getframe(gca);
end


