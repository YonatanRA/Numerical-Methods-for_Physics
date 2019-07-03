function d = difdiv (x,y)
%Tabla de diferencias dividas
n=length(x);
d(:,1)=y';
for j=2:n %contador columnas
    for k=j:n %contador de filas
        d(k,j)=(d(k,j-1)-d(k-1,j-1))/(x(k)-x(k-j+1));
    end
end


        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        