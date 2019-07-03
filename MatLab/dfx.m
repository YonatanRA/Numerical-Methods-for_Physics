function d=dfx(f,c,x,a) %funcion,coeficientes, nodos y punto de derivacion para dar la derivada numerica
 f=inline(f);
 d=f(x+a)*c;
end
%double(d) notacion decimal
 