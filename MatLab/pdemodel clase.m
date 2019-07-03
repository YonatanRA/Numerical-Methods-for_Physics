%pdemodel
%se ponen la condiciones y el mallado
%...primero exportar malla

p(:,6)

ans =

    0.2000
    0.2000

%luego la solucion
 u(6)

ans =

    4.0404
    

format long
u(6)

ans =

   4.040445668893401
    %solucion numerica...la exacta es 4.04.....u(x,y)=xy+4
    
uex=inline('x*y+4')    
 uexacta=uex(p(1,6),p(2,6))

uexacta =

   4.040000000000000

error=abs(u(6)-uexacta)

error =

     4.456688934011410e-04
     
%refinando el mallado sale mejor:
 u(6)

ans =

   4.040140136019619

error=abs(u(6)-uexacta)

error =

     1.401360196187085e-04 %mucho menos menor error






