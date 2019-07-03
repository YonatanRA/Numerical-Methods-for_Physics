%Tema 4 EDP

%Metodo explicito de la ec de difusion
[u,er]=ftcs(0,0.5,1001,0,1,11,'sin(pi*x)','0','0',1,1,'exp(-t*pi^2)*sin(pi*x)')
[u]=ftcs(0,0.5,1001,0,1,11,'sin(pi*x)','t','sqrt(t)',1,10) %con cond de contorno funcion de t
[u,er]=ftcs(0,0.5,51,0,1,11,'sin(pi*x)','0','0',1,10,'exp(-t*pi^2)*sin(pi*x)')  %este no cumple la estabilidad....de 1001 a 51
% la cond de estabilidad implica que se necesita muchos pasos...por tanto
% mucho calculo, se necesita cambiar de metodo
%Ahora con metedo implicito ec difusion
[u,er]=btcs(0,0.5,51,0,1,11,'sin(pi*x)','0','0',1,10,'exp(-t*pi^2)*sin(pi*x)') %este metedo si cumple la estabilidad..con 51
 
%Ejemplo de e-ondas
[u,er]=e_ondas(0,5,101,0,0.5,41,'0','sin(4*pi*x)','0','0',1/(4*pi),10,'sin(4*pi*x)*sin(t)',[-1,1])
%cambiando cond de contorno
[u]=e_ondas(0,5,101,0,0.5,41,'0','sin(4*pi*x)','t/10','t^2/30',1/(4*pi),1,'sin(4*pi*x)*sin(t)',[-1,1])
 



