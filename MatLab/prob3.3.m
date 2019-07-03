mu=[1,-1];
sigma=[1.5,2;2,3];
rho=sigma(1,2)/sqrt(sigma(1,1)*sigma(2,2));
x=linspace(-4,6,100);
y=linspace(-6,4,100);
[xx,yy]=meshgrid(x,y);
ll=((xx.*(-mu(1)))/sigma(1,1)).^2+((yy.*(-mu(2)))/sigma(2,2)).^2;
jj=(xx.*(-mu(1))).*(yy.(-mu(2))).*2*rho/(sigma(1,1)*sigma(2,2));
ww=e.^((-1/(2*(1-rho^2)))*(ll-jj));
zz=(1/(2*pi*sigma(1,1)*sigma(2,2)*sqrt(1-rho^2)))*ww;
mesh(xx,yy,zz)
% coeficiente de correlacion positivo