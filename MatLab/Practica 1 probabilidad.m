%Ejercicio 1.1
%Simular 2000 datos de una variable aleatoria....con funcion cuantil
A=unifrnd(0,1,2000,1); % usado para ejercicios 1,2 y 3 (igual en 4 tambien)
%for i=1:2000;
    %if ((A(i))<0.5);
        %Z(i)=A(i);
    %end
    %if (A(i)==0.5);
        %Z(i)=0.5;
    %end
    %if (0.5<A(i));
        %Z(i)=A(i)+0.5;
    %end
%end
%y='0';
%y1='x';
%y2='0.5';
%y3='x-0.5';
%fplot(y3,[1,1.5],'r');
%hold on
%pause
%fplot(y2,[0.5,1],'r');
%hold on
%pause
%fplot(y1,[0,0.5],'r')%los plot de y representan la funcion de distribucion
%que seria x en [0,0.5], 0.5 en [0.5,1], x-0.5 en [1,1.5], 1 en otro caso
%hold on
%pause
%fplot(y,[0,1.5],'r');
%hold on
%pause
%ecdf(Z);


%
%
%Ejercicio 1.2
%lo mismo pero la funcion de distribucion es
% x en [0,0.5],0.5 en [0.5,1], 1 en otro caso 

%for i=1:2000;
    %if ((A(i))<0.5);
        %W(i)=A(i);
    %end
    %if (A(i)==0.5);
        %W(i)=0.5;
    %end
    %if (0.5<A(i));
        %W(i)=1;
    %end
%end
%f='0';
%f1='x';
%f2='0.5';
%f3='1';
%fplot(f3,[1,1.5],'r');
%hold on
%pause
%fplot(f2,[0.5,1],'r');
%hold on
%pause
%fplot(f1,[0,0.5],'r');
%hold on 
%pause
%fplot(f,[0,1.5],'r');
%hold on
%pause
%ecdf(W);



%
%
%Ejercicio 1.3
%lambda=2; %parametro de la exponencial
%la funcion de distribucion es:
%syms x
%F=1-exp(-lambda*x)
%B=(-0.5)*log(1-A);
%fplot(char(F),[0,4],'r')
%hold on 
%pause
%ecdf(B)



%
%
%Ejercicio 1.4




