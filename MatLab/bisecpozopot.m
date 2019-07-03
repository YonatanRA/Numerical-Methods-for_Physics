function[]=bisecpozopot(k,alfa,vcsborde)
%vcsborde es el cuantas veces el borde es el pto en el que mirar
%para vcsborde=2, si el borde es 0.5, pues miras si es 0 en x=1
    %SHOOTING METHOD
    tol=1e-6;               %VARIAR
    a=alfa+alfa/4;          %VARIAR
    b=alfa-alfa/4;          %VARIAR
    fprintf('tolerancia = ');fprintf('%4.1e',tol);fprintf('\n');
    fprintf('  n  alfa        valor onda lejos (x='),fprintf('%4.2f',vcsborde*0.5);fprintf(')\n');
    o=0;
    fx=1;
    while ((abs(fx)>1e-6)&&((o+1)<40))
        o=o+1;
        x=(b+a)/2;
        fa=pozopot(k,a,vcsborde);
        fb=pozopot(k,b,vcsborde);
        %POZOPOT VA REPRESENTANDO, ADEMAS IMPRIMIMOS VALORES
        fx=pozopot(k,x,vcsborde,1);
        title(['alfa = ',num2str(x,'%4.8f'),'   n = ',num2str(o,'%4.1f')])
        hold off
        fprintf(' %2d % .8f % .1e \n',o,x,fx)
        pause
        %SEGUIMOS CON SHOOTING METHOD
        if (fx*fa<0)
            b=x;
        end
        if (fx*fb<0)
            a=x;
        end
    end

