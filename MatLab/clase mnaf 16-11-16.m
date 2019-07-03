 [u,er]=ftcs(0,0.5,1001,0,1,11,'sin(pi*x)','0','0',1,1,'exp(-t*pi^2)*sin(pi*x)')
 [u]=ftcs(0,0.5,1001,0,1,11,'sin(pi*x)','t','sqrt(t)',1,10) %con cond de contorno funcion de t
 [u,er]=ftcs(0,0.5,51,0,1,11,'sin(pi*x)','0','0',1,10,'exp(-t*pi^2)*sin(pi*x)')  %este no cumple la estabilidad....de 1001 a 51
 % la cond de estabilidad implica que se necesita muchos pasos...por tanto
 % mucho calculo, se necesita cambiar de metodo
 %Ahora con metedo implicito ec difusion
 [u,er]=btcs(0,0.5,51,0,1,11,'sin(pi*x)','0','0',1,10,'exp(-t*pi^2)*sin(pi*x)') %este metedo si cumple la estabilidad..con 51
 
 
 
 
 
 
 
 