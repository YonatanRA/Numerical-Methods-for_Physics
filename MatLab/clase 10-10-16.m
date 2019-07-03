
	This is a Classroom License for instructional use only.
	Research and commercial use is prohibited.

x=[-0.25,0,0.25]

x =

   -0.2500         0    0.2500

[c,x]=cfdn(x,a)
Undefined function or variable 'a'.
 

[c,x]=cfdn(x,0)
 
c =
 
 -2
  0
  2
 

x =

   -0.2500         0    0.2500

d=dfx('sin(x)',c,x,pi)
 
d =
 
-17827334059338477/18014398509481984
 
double(d)

ans =

   -0.9896

[c,x]=cfdnb(x,0.25)
 
c =
 
  2
 -8
  6
 

x =

   -0.2500         0    0.2500

d=dfx('sin(x)',c,x,pi-0.025)
 
d =
 
-35867512891189165/36028797018963968
 
d=dfx('sin(x)',c,x,pi-0.25)
 
d =
 
-20695777216479535888287280589803/20282409603651670423947251286016
 
double(d)

ans =

   -1.0204

x=[-0.05,0,0.05]

x =

   -0.0500         0    0.0500

[c,x]=cfdnb(x,0.05)
 
c =
 
  10
 -40
  30
 

x =

   -0.0500         0    0.0500

d=dfx('exp(x)',c,x,1-0.05)
 
d =
 
3058056278404125/1125899906842624
 
double(d)

ans =

    2.7161

cuidado
Undefined function or variable 'cuidado'.
 
linspace help
Not enough input arguments.

Error in linspace (line 19)
    n = floor(double(n));
 
diff help

ans =

    -3     7     4

df=derivada('sin(x)',0,1,10)
Error: File: derivada.m Line: 7 Column: 5
"i" previously appeared to be used as a function or command, conflicting with its use here as the name of a variable.
A possible cause of this error is that you forgot to initialize the variable, or you have initialized it implicitly using load or
eval.

 
df=derivada('sin(x)',0,1,10)

f =

     Inline function:
     f(x) = sin(x)


h =

    0.1000


d =

         0   -0.4155


d =

         0   -0.4155   -0.9883


d =

         0   -0.4155   -0.9883   -0.6526


d =

         0   -0.4155   -0.9883   -0.6526    0.2832


d =

         0   -0.4155   -0.9883   -0.6526    0.2832    0.9586


d =

         0   -0.4155   -0.9883   -0.6526    0.2832    0.9586    0.7526


d =

         0   -0.4155   -0.9883   -0.6526    0.2832    0.9586    0.7526   -0.1453


d =

         0   -0.4155   -0.9883   -0.6526    0.2832    0.9586    0.7526   -0.1453   -0.9096


d =

   -0.8684   -0.4155   -0.9883   -0.6526    0.2832    0.9586    0.7526   -0.1453   -0.9096


d =

   -0.8684   -0.4155   -0.9883   -0.6526    0.2832    0.9586    0.7526   -0.1453   -0.9096   -0.9508

Output argument "df" (and maybe others) not assigned during call to "derivada".
 
df=derivada('sin(x)',0,1,10)

d =

         0   -0.4155


d =

         0   -0.4155   -0.9883


d =

         0   -0.4155   -0.9883   -0.6526


d =

         0   -0.4155   -0.9883   -0.6526    0.2832


d =

         0   -0.4155   -0.9883   -0.6526    0.2832    0.9586


d =

         0   -0.4155   -0.9883   -0.6526    0.2832    0.9586    0.7526


d =

         0   -0.4155   -0.9883   -0.6526    0.2832    0.9586    0.7526   -0.1453


d =

         0   -0.4155   -0.9883   -0.6526    0.2832    0.9586    0.7526   -0.1453   -0.9096


d =

   -0.8684   -0.4155   -0.9883   -0.6526    0.2832    0.9586    0.7526   -0.1453   -0.9096


d =

   -0.8684   -0.4155   -0.9883   -0.6526    0.2832    0.9586    0.7526   -0.1453   -0.9096   -0.9508

Output argument "df" (and maybe others) not assigned during call to "derivada".
 
df=derivada('sin(x)',0,1,10)
Output argument "df" (and maybe others) not assigned during call to "derivada".
 
df=derivada('sin(x)',0,1,10)

df =

    9.2407   -0.4155   -0.9883   -0.6526    0.2832    0.9586    0.7526   -0.1453   -0.9096    0.4553

df=derivada('sin(x)',0,1,10)
Error: File: derivada.m Line: 13 Column: 1
This statement is not inside any function.
 (It follows the END that terminates the definition of the function "derivada".)
 
df=derivada('sin(x)',0,1,10)
Error: File: derivada.m Line: 13 Column: 1
This statement is not inside any function.
 (It follows the END that terminates the definition of the function "derivada".)
 
df=derivada('sin(x)',0,1,10)
Error: File: derivada.m Line: 13 Column: 1
This statement is not inside any function.
 (It follows the END that terminates the definition of the function "derivada".)
 
df=derivada('sin(x)',0,1,10)
Error: File: derivada.m Line: 13 Column: 1
This statement is not inside any function.
 (It follows the END that terminates the definition of the function "derivada".)
 
df=derivada('sin(x)',0,1,10)

df =

    9.2407   -0.4155   -0.9883   -0.6526    0.2832    0.9586    0.7526   -0.1453   -0.9096    0.4553

df=derivada('sin(x)',0,1,10)

df =

    9.2407   -0.4155   -0.9883   -0.6526    0.2832    0.9586    0.7526   -0.1453   -0.9096    0.4553

df=derivada('sin(x)',0,1,10)
Undefined function 'diff' for input arguments of type 'inline'.

Error in derivada (line 13)
fplot(diff(f),[a,b]);
 
df=derivada('sin(x)',0,1,10)
Undefined function 'diff' for input arguments of type 'inline'.

Error in derivada (line 13)
fplot(diff(f),[a,b]);
 
df=derivada('sin(x)',0,1,10)
Undefined function 'diff' for input arguments of type 'inline'.

Error in derivada (line 13)
plot(diff(f),[a,b]);
 
df=derivada('sin(x)',0,1,10)
Undefined function or variable 'x'.

Error in derivada (line 13)
plot(diff(f,x),[a,b]);
 
df=derivada('sin(x)',0,1,10)

df =

    1.0033    0.9922    0.9738    0.9434    0.9013    0.8482    0.7846    0.7113    0.6292    0.5423

df=derivada('5*x',0,1,10)
Error: File: derivada.m Line: 13 Column: 12
Expression or statement is incorrect--possibly unbalanced (, {, or [.
 
df=derivada('5*x',0,1,10)

df =

    5.0000    5.0000    5.0000    5.0000    5.0000    5.0000    5.0000    5.0000    5.0000    5.0000

df=derivada('5*x',0,1,10)
Undefined function 'diff' for input arguments of type 'inline'.

Error in derivada (line 13)
ezplot(diff(f));
 
df=derivada('5*x',0,1,10)
Error using sym>tomupad (line 1175)
Conversion to 'sym' from 'inline' is not possible.

Error in sym (line 163)
                S.s = tomupad(x);

Error in derivada (line 13)
ezplot(diff(sym(f)));
 
df=derivada('5*x',0,1,10)
Error using sym>tomupad (line 1175)
Conversion to 'sym' from 'inline' is not possible.

Error in sym (line 163)
                S.s = tomupad(x);

Error in derivada (line 13)
fplot(diff(sym(f)));
 
df=derivada('5*x',0,1,10)
Error using sym>tomupad (line 1175)
Conversion to 'sym' from 'inline' is not possible.

Error in sym (line 163)
                S.s = tomupad(x);

Error in derivada (line 13)
plot(diff(sym(f)));
 
df=derivada('5*x',0,1,10)
Error using sym>tomupad (line 1175)
Conversion to 'sym' from 'inline' is not possible.

Error in sym (line 163)
                S.s = tomupad(x);

Error in derivada (line 13)
plot(diff(sym(f)),[a,b]);
 
df=derivada('5*x',0,1,10)
Error using sym>tomupad (line 1175)
Conversion to 'sym' from 'inline' is not possible.

Error in sym (line 163)
                S.s = tomupad(x);

Error in derivada (line 13)
plot(diff(sym(f)),[a,b]);
 
df=derivada('5*x',0,1,10)
Error using sym>tomupad (line 1175)
Conversion to 'sym' from 'inline' is not possible.

Error in sym (line 163)
                S.s = tomupad(x);

Error in derivada (line 13)
dr=diff(sym(f));
 
df=derivada('5*x',0,1,10)
Subscript indices must either be real positive integers or logicals.

Error in derivada (line 7)
    df(i)=(f(y(i)+h)-f(y(i)-h))/(2*h);
 
df=derivada('5*x',0,1,10)
Error using sym>tomupad (line 1175)
Conversion to 'sym' from 'inline' is not possible.

Error in sym (line 163)
                S.s = tomupad(x);

Error in derivada (line 13)
dr=diff(sym(f));
 
df=derivada('5*x',0,1,10)
Error: File: derivada.m Line: 13 Column: 13
Unexpected MATLAB expression.
 
df=derivada('5*x',0,1,10)
Undefined function 'diff' for input arguments of type 'inline'.

Error in derivada (line 13)
dr=diff(f);
 
df=derivada('5*x',0,1,10)
Undefined function or variable 'x'.

Error in derivada (line 13)
dr=diff(f,x);
 
df=derivada('5*x',0,1,10)
Undefined function or variable 'x'.

Error in derivada (line 13)
dr=inline(diff(f,x));
 
df=derivada('5*x',0,1,10)
Undefined function or variable 'x'.

Error in derivada (line 13)
dr=inline(diff(f,x));
 
df=derivada('5*x',0,1,10)
Undefined function 'diff' for input arguments of type 'inline'.

Error in derivada (line 13)
dr=diff(f,y)
 
df=derivada('5*x',0,1,10)
Undefined function 'diff' for input arguments of type 'inline'.

Error in derivada (line 13)
dr=diff(f)
 
df=derivada('5*x',0,1,10)
Error: File: derivada.m Line: 13 Column: 7
Unexpected MATLAB expression.
 
df=derivada('5*x',0,1,10)
 
dr =
 
1
 

df =

    5.0000    5.0000    5.0000    5.0000    5.0000    5.0000    5.0000    5.0000    5.0000    5.0000

df=derivada('5*x',0,1,10)

df =

    5.0000    5.0000    5.0000    5.0000    5.0000    5.0000    5.0000    5.0000    5.0000    5.0000

df=derivada('5*x',0,1,10)

df =

    5.0000    5.0000    5.0000    5.0000    5.0000    5.0000    5.0000    5.0000    5.0000    5.0000

df=derivada('5*x',0,1,10)

df =

    5.0000    5.0000    5.0000    5.0000    5.0000    5.0000    5.0000    5.0000    5.0000    5.0000

df=derivada('5*x',0,1,10)
Function 'subsindex' is not defined for values of class 'inline'.

Error in derivada (line 11)
plot(df,y(f));
 
df=derivada('5*x',0,1,10)

df =

    5.0000    5.0000    5.0000    5.0000    5.0000    5.0000    5.0000    5.0000    5.0000    5.0000

df=derivada('5*x',0,1,10)

df =

    5.0000    5.0000    5.0000    5.0000    5.0000    5.0000    5.0000    5.0000    5.0000    5.0000

df=derivada('sin(x)',0,1,10)

df =

    1.0041    0.9918    0.9734    0.9430    0.9010    0.8479    0.7843    0.7110    0.6290    0.5428

df=derivada('exp(x)',0,1,10)

df =

    0.9955    1.1198    1.2514    1.3985    1.5628    1.7465    1.9517    2.1811    2.4374    2.7080

[c,x]=cfin(x,0)
 
c =
 
 0
 0
 0
 

x =

   -0.0500         0    0.0500

[c,x]=cfin(x,0,1)

c =

     0
     0
     0


x =

   -0.0500         0    0.0500

[c,x]=cfin(x,0,1)
Warning: SUBS(S,OLD,NEW,0) will not accept 0 in a future release. Use SUBS(S,OLD,NEW) instead. 
> In sym/subs (line 62)
  In cfin (line 7) 
Warning: SUBS(S,OLD,NEW,0) will not accept 0 in a future release. Use SUBS(S,OLD,NEW) instead. 
> In sym/subs (line 62)
  In cfin (line 7) 
Warning: SUBS(S,OLD,NEW,0) will not accept 0 in a future release. Use SUBS(S,OLD,NEW) instead. 
> In sym/subs (line 62)
  In cfin (line 7) 

c =

     0
     0
     0


x =

   -0.0500         0    0.0500

[c,x]=cfin(x,1,3)
Warning: SUBS(S,OLD,NEW,0) will not accept 0 in a future release. Use SUBS(S,OLD,NEW) instead. 
> In sym/subs (line 62)
  In cfin (line 7) 
Warning: SUBS(S,OLD,NEW,0) will not accept 0 in a future release. Use SUBS(S,OLD,NEW) instead. 
> In sym/subs (line 62)
  In cfin (line 7) 
Warning: SUBS(S,OLD,NEW,0) will not accept 0 in a future release. Use SUBS(S,OLD,NEW) instead. 
> In sym/subs (line 62)
  In cfin (line 7) 

c =

   61.6667
 -132.3333
   71.6667


x =

   -0.0500         0    0.0500

[c,x]=cfin(x,1,3)
Error using sym/int (line 149)
Cannot integrate with respect to '1'. The integration variable must be a symbolic variable.

Error in cfin (line 7)
    b(i)=int(z^(i-1),a,b);
 
[c,x]=cfin(x,1,3)
Undefined function 'int' for input arguments of type 'char'.

Error in cfin (line 7)
    b(i)=int('z^(i-1)',a,b);
 
[c,x]=cfin(x,1,3)
The following error occurred converting from sym to double:
DOUBLE cannot convert the input expression into a double array.
If the input expression contains a symbolic variable, use VPA.

Error in cfin (line 7)
    b(i)=int('z^(i-1)',z,a,b);
 
[c,x]=cfin(x,1,3)

c =

 -323.3333
  618.6667
 -293.3333


x =

   -0.0500         0    0.0500

[c,x]=cfin(x,1,3)

c =

   -1.5208
    3.5417
   -0.0208


x =

    -1     0     1

[c,x]=cfin(x,-1/2,1/2)

c =

   -1.0065
    2.2630
   -0.2565


x =

   -0.5000         0    0.5000

[c,x]=cfin(x,-1/2,1/2)
 
c =
 
 1/6
 2/3
 1/6
 

x =

   -0.5000         0    0.5000

i=ifx('x',c,x,0,1)
Output argument "i" (and maybe others) not assigned during call to "ifx".
 
i=ifx('x',c,x,0,1)
 
i =
 
0
 
 
i =
 
0
 
[c,x]=cfin(x,0,1)
 
c =
 
 1/6
 2/3
 1/6
 

x =

         0    0.5000    1.0000

i=ifx('x',c,x,0,1)
 
i =
 
1/2
 
 
i =
 
1/2
 
i=ifx(f,c,x)
Undefined function or variable 'f'.
 
i=ifx('x',c,x)
 
i =
 
1/2
 
i=ifx('x^2',c,x)
Error using inlineeval (line 14)
Error in inline expression ==> x^2
 Inputs must be a scalar and a square matrix.
To compute elementwise POWER, use POWER (.^) instead.

Error in inline/subsref (line 23)
    INLINE_OUT_ = inlineeval(INLINE_INPUTS_, INLINE_OBJ_.inputExpr, INLINE_OBJ_.expr);

Error in ifx (line 3)
 i=f(x)*c;
 
i=ifx('y^2',c,x)
Error using inlineeval (line 14)
Error in inline expression ==> y^2
 Inputs must be a scalar and a square matrix.
To compute elementwise POWER, use POWER (.^) instead.

Error in inline/subsref (line 23)
    INLINE_OUT_ = inlineeval(INLINE_INPUTS_, INLINE_OBJ_.inputExpr, INLINE_OBJ_.expr);

Error in ifx (line 3)
 i=f(x)*c;
 
i=ifx('y.^2',c,x)
 
i =
 
1/3
 
i=ifx('y^2',c,x)
Error using inlineeval (line 14)
Error in inline expression ==> y^2
 Inputs must be a scalar and a square matrix.
To compute elementwise POWER, use POWER (.^) instead.

Error in inline/subsref (line 23)
    INLINE_OUT_ = inlineeval(INLINE_INPUTS_, INLINE_OBJ_.inputExpr, INLINE_OBJ_.expr);

Error in ifx (line 3)
 i=f(x).*c;
 
i=ifx('x.^2',c,x)
 
i =
 
1/3
 
i=ifx('x.^5',c,x)
 
i =
 
3/16
 
i=ifx('x.^3',c,x)
 
i =
 
1/4
 
i=ifx('x.^4',c,x)
 
i =
 
5/24
 
