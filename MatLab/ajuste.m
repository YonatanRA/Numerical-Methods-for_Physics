function c=ajuste(f,x,y,c) %funcion por la que queremos ajustar,abs y ords y la semilla...los coef de los que partimos estimados
global grafica %representacion
plot (x,y,'r.')
hold on
grafica=plot(x,y);
pause
axis([min(x) max(x) min(y) max(y)]); %ajustar ejes
c=lsqcurvefit(f,c,x,y);
end
