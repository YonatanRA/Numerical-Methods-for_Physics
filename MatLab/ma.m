%Mejor aproximacion de funciones con una base ortonormal
function [p,c]=ma(f,bo,dom,w,rg); %funcion,base ortonormal, dominio [a,b],peso,representacion grafica
if nargin<4
    w=1;
end

c=int(f*bo*w,dom(1),dom(2));%....integral para los coeficientes
p=c*bo.';  %..bo.' para trasponer..bo hay k sacarlo de gs...se hace el producto ya sale la suma


if nargin==5
    fplot(f,dom,'m');
    hold on
    ezplot(p,dom);
    legend('f','p',0);
end

end





