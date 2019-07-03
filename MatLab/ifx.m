function i=ifx(f,c,x) %funcion,coeficientes, nodos....  integracion numerica para cualquier f
 f=inline(f);
 i=f(x)*c;
end