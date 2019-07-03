s=simp('exp(x)',0,1,4)

s =

    1.7183

s2=simp('exp(x)',0,1,8)

s2 =

    1.7183

s3=simp('exp(x)',0,1,16)

s3 =

    1.7183

s4=simp('exp(x)',0,1,32)




x=[0,-15^(1/2)/5,15^(1/2)/5]  raices laguerre con solve de lo polinomios

x =

         0   -0.7746    0.7746

[c,x]=cfin(x,-1,1)
 
c =
 
 8/9
 5/9
 5/9
 

x =

         0   -0.7746    0.7746

i=ifx('exp(-x^2),c,x)
 i=ifx('exp(-x^2),c,x)
       ?
Error: String is not terminated properly.
 
i=ifx('exp(-x^2)',c,x)
Error using inlineeval (line 14)
Error in inline expression ==> exp(-x^2)
 Inputs must be a scalar and a square matrix.
To compute elementwise POWER, use POWER (.^) instead.

Error in inline/subsref (line 23)
    INLINE_OUT_ = inlineeval(INLINE_INPUTS_, INLINE_OBJ_.inputExpr, INLINE_OBJ_.expr);

Error in ifx (line 3)
 i=f(x)*c;
 
i=ifx('exp(-x.^2)',c,x)
 
i =
 
20248358605686821/13510798882111488
 
double(i)

ans =

    1.4987

syms x
iex=int('exp(-x.^2)',-1,1)
Undefined function 'int' for input arguments of type 'char'.
 
iex=int('exp(-x^2)',-1,1)
Undefined function 'int' for input arguments of type 'char'.
 
iex=int(exp(-x^2),-1,1)
 
iex =
 
pi^(1/2)*erf(1)
 
error=double(iex-i)

error =

   -0.0050





s4 =

    1.7183

s5=simp('exp(x)',0,1,64)

s5 =

    1.7183

sex=int(exp(x),x,0,1)
 
sex =
 
exp(1) - 1
 
error=abs(sex-[s,s2,s3,s4,s5])
 
error =
 
[ 12242063506193579/4503599627370496 - exp(1), 3060513421357009/1125899906842624 - exp(1), 3060513267682795/1125899906842624 - exp(1), 12242053032298559/4503599627370496 - exp(1), 765128314368519/281474976710656 - exp(1)]
 
for i=1:4
double(error(s)/error(s+1))
end
Warning: Integer operands are required for colon operator when used as index 
> In sym/subsref (line 780) 
Warning: Integer operands are required for colon operator when used as index 
> In sym/subsref (line 780) 

ans =

   15.9944

Warning: Integer operands are required for colon operator when used as index 
> In sym/subsref (line 780) 
Warning: Integer operands are required for colon operator when used as index 
> In sym/subsref (line 780) 

ans =

   15.9944

Warning: Integer operands are required for colon operator when used as index 
> In sym/subsref (line 780) 
Warning: Integer operands are required for colon operator when used as index 
> In sym/subsref (line 780) 

ans =

   15.9944

Warning: Integer operands are required for colon operator when used as index 
> In sym/subsref (line 780) 
Warning: Integer operands are required for colon operator when used as index 
> In sym/subsref (line 780) 

ans =

   15.9944

