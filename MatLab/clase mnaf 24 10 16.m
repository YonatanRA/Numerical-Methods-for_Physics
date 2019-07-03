This is a Classroom License for instructional use only.
	Research and commercial use is prohibited.

base=char('1','x','x.^2','x.^3')

base =

1   
x   
x.^2
x.^3

 b=gs(base,[-1,1])
Error using symengine
Invalid input. 'expression' is expected.

Error in sym>convertExpression (line 1449)
s = mupadmex({x});

Error in sym>convertChar (line 1364)
    s = convertExpression(x);

Error in sym>tomupad (line 1164)
        S = convertChar(x);

Error in sym (line 163)
                S.s = tomupad(x);

Error in gs (line 30)
   b(i)=sym(a(i,:));
 
b=gs(base,[-1,1])
Error using symengine
Invalid input. 'expression' is expected.

Error in sym>convertExpression (line 1449)
s = mupadmex({x});

Error in sym>convertChar (line 1364)
    s = convertExpression(x);

Error in sym>tomupad (line 1164)
        S = convertChar(x);

Error in sym (line 163)
                S.s = tomupad(x);

Error in gs (line 30)
   b(i)=sym(a(i,:));
 
base=char('1','x','x^2','x^3')

base =

1  
x  
x^2
x^3

b=gs(base,[-1,1])
 
b =
 
[ 2^(1/2)/2, (6^(1/2)*x)/2, 10^(1/2)*((3*x^2)/4 - 1/4), (14^(1/2)*x*(5*x^2 - 3))/4]
 
nodos=solve(bo(4))
Undefined function or variable 'bo'.
 
nodos=solve(b(4))
 
nodos =
 
           0
 -15^(1/2)/5
  15^(1/2)/5
 
Ig=((x-nodos(1))*(x-nodos(2))*(x-nodos(3)))^2/factorial(6)
Undefined function or variable 'x'.
 
syms x
Ig=((x-nodos(1))*(x-nodos(2))*(x-nodos(3)))^2/factorial(6)
 
Ig =
 
(x^2*(x - 15^(1/2)/5)^2*(x + 15^(1/2)/5)^2)/720
 

k=int(Ig,-1,1)
 
k =
 
1/15750
 
f=exp(-x^2)
 
f =
 
exp(-x^2)
 
d6f=diff(f,x,6)
 
d6f =
 
720*x^2*exp(-x^2) - 120*exp(-x^2) - 480*x^4*exp(-x^2) + 64*x^6*exp(-x^2)
 
ezplot(d6f,[-1,1]) %el mayor valor absolutoi esta en cero

 M=abs(subs(d6f,'x',0))  %evaluar la derivada en un punto....hay que sustituir
 
M =
 
120


cota=double(M*k)

cota =

    0.0076
    
    
iex=int(exp(-x^2),-1,1)
 
iex =
 
pi^(1/2)*erf(1)
 
error=abs(iex-1,4987)
Error using sym/abs
Too many input arguments.
 
error=abs(iex-1.4987)
 
error =
 
14987/10000 - pi^(1/2)*erf(1)
 
error=double(error)

error =

    0.0051
    
  n=[0,1/2,1]

n =

         0    0.5000    1.0000

[c,x]=cfinw(n,0,1,'x')
Index exceeds matrix dimensions.

Error in sym/subsref (line 776)
            R_tilde = builtin('subsref',L_tilde,Idx);

Error in cfinw (line 11)
    p(i)=int(z^(i-1)*w(i),z,a,b);
 
[c,x]=cfinw(n,0,1,x)
Index exceeds matrix dimensions.

Error in sym/subsref (line 776)
            R_tilde = builtin('subsref',L_tilde,Idx);

Error in cfinw (line 11)
    p(i)=int(z^(i-1)*w(i),z,a,b);
 
[c,x]=cfinw(n,0,1)

w =

     1

Index exceeds matrix dimensions.

Error in cfinw (line 11)
    p(i)=int(z^(i-1)*w(i),z,a,b);
 

[c,x]=cfinw(n,0,1)
Error using sym/subsindex (line 737)
Invalid indexing or function definition. When defining a function, ensure that the arguments are symbolic variables and the body
of the function is a SYM expression. When indexing, the input must be numeric, logical, or ':'.

Error in cfinw (line 12)
    p(i)=int(z^(i-1)*w(z),z,a,b);
 
[c,x]=cfinw(n,0,1)
Not enough input arguments.

Error in cfinw (line 5)
w=char(w);
 
[c,x]=cfinw(n,0,1)
Not enough input arguments.

Error in cfinw (line 5)
w=inline(w);
 
[c,x]=cfinw(n,0,1,x)
 
c =
 
   0
 1/3
 1/6
 

x =

         0    0.5000    1.0000


[c,x]=cfinw(n,0,1,x)
Error using inline (line 50)
Input must be a string.

Error in cfinw (line 5)
w=inline(w);
 
[c,x]=cfinw(n,0,1)
Not enough input arguments.

Error in cfinw (line 5)
w=inline(w);
 
b=gs(base,[-1,1],'1/sqrt(1-x^2)')
 
b =
 
[ 1/pi^(1/2), (2^(1/2)*x)/pi^(1/2), (2*2^(1/2)*(x^2 - 1/2))/pi^(1/2), -(4*2^(1/2)*(- x^3 + (3*x)/4))/pi^(1/2)]
 
+
 +
  ?
Error: Expression or statement is incomplete or incorrect.
 
[c,x]=cfinw(n,0,1)
Not enough input arguments.

Error in cfinw (line 5)
w=inline(w);
 
[c,x]=cfinw(n,0,1)
Not enough input arguments.

Error in cfinw (line 5)
w=inline(w);
 
nodos=solve(b(4))
 
nodos =
 
          0
 -3^(1/2)/2
  3^(1/2)/2
 
[c,x]=cfinw(nodos,-1,1)
Not enough input arguments.

Error in cfinw (line 5)
w=inline(w);
 
[c,x]=cfinw(nodos,-1,1,'1/sqrt(1-x^2)')
 
c =
 
 pi/3
 pi/3
 pi/3
 
 
x =
 
          0
 -3^(1/2)/2
  3^(1/2)/2
 
[c,x]=cfinw(n,0,1)
Error using inline (line 50)
Input must be a string.

Error in cfinw (line 7)
w=inline(w);
 
[c,x]=cfinw(n,0,1)
Error using inline (line 50)
Input must be a string.

Error in cfinw (line 10)
w=inline(w);
 
[c,x]=cfinw(n,0,1)
 
c =
 
              3^(1/2)/6 + 2/9
                          5/9
 (3^(1/2)*(4*3^(1/2) - 9))/54
 

x =

    0.8660         0   -0.8660

[c,x]=cfinw(nodos,-1,1,'1/sqrt(1-x^2)')
 
c =
 
 pi/3
 pi/3
 pi/3
 
 
x =
 
          0
 -3^(1/2)/2
  3^(1/2)/2
 
c =
 
 pi/3
 pi/3
 pi/3
 
nodos
 
nodos =
 
          0
 -3^(1/2)/2
  3^(1/2)/2
 
i=ifx('exp(-x^2)*sqrt(1-x^2)',c,nodos')
Error using inlineeval (line 14)
Error in inline expression ==> exp(-x^2)*sqrt(1-x^2)
 Not a square matrix.

Error in inline/subsref (line 23)
    INLINE_OUT_ = inlineeval(INLINE_INPUTS_, INLINE_OBJ_.inputExpr, INLINE_OBJ_.expr);

Error in ifx (line 3)
 i=f(x)*c;
 
i=ifx('exp(-x.^2).*sqrt(1-x.^2)',c,nodos')
 
i =
 
pi/3 + (pi*exp(-3/4))/3
 
duoble(i)
Undefined function or variable 'duoble'.
 
Did you mean:
double(i)

ans =

    1.5419

double(iex-i)

ans =

   -0.0482

  
