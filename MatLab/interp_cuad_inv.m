function x=interp_cuad_inv(func,a,b,nmax,tol) % Interpolaci�n cuadr�tica inversa
f=inline(func); % Se buscan las aproximaciones de las ra�ces de f
c=(a+b)/2; % Se fija el punto medio del intervalo
%Se calcula el interpolante en 3 puntos, asi se tiene grado <=2
fprintf('  n     a         f(a)\n') %Resultados ; a=alfa 
for  k=1:nmax,
    fa=f(a); %Evaluaci�n de la funci�n
    fb=f(b);
    fc=f(c);
    p=ifn([fa,fc,fb],[a,c,b]); %Llamada a la forma de Newton  
    p=inline(p); %Interpolante
    x=p(0); %alfa aprox = x
    fx=f(x);
    
    fprintf(' %2d % .8f % .1e\n',k,x,fx)
    
    if abs(fx)<tol, % Corte seg�n la tolerancia
        return
    end
    a=b; %Asignaciones
    b=c;
    c=x;
end

x=c;

end