


This is a Classroom License for instructional use only.
	Research and commercial use is prohibited.

x=[1,1.3,1.9,2.2]

x =

    1.0000    1.3000    1.9000    2.2000

y=besselj(0,x)

y =

    0.7652    0.6201    0.2818    0.1104

format long
y

y =

   0.765197686557967   0.620085989561509   0.281818559374385   0.110362266922174

d=difdiv(x,y)

d =

   0.765197686557967                   0                   0                   0
   0.620085989561509  -0.483705656654858                   0                   0
   0.281818559374385  -0.563779050311873  -0.088970437396683                   0
   0.110362266922174  -0.571520974840705  -0.008602138365368   0.066973582526096

 p=ifn(x,y)

p =

(((2412977610465539*x)/36028797018963968 - 77901552895380691/360287970189639680)*(x - 13/10) - 8713666460271279/18014398509481984)*(x - 1) + 430768002005903/562949953421312

 P=char(p)

P =

(((2412977610465539*x)/36028797018963968 - 77901552895380691/360287970189639680)*(x - 13/10) - 8713666460271279/18014398509481984)*(x - 1) + 430768002005903/562949953421312

fplot(p,[1,2.2]
 fplot(p,[1,2.2]
                ?
Error: Expression or statement is incorrect--possibly unbalanced (, {, or [.
 
Did you mean:
fplot(p,[1,2.2])

hold on
plot(x,y,'x')



%variables a datos
save ('datos.mat','x','y')
dir

.                     Mnaf clase 3 10 16.m  difdiv.m              funci.m               
..                    datos.mat             fun1.m                ifn.m                 

%datos a variables
clear x
clear y
load datos
x

x =

   1.000000000000000   1.300000000000000   1.900000000000000   2.200000000000000

y

y =

   0.765197686557967   0.620085989561509   0.281818559374385   0.110362266922174

