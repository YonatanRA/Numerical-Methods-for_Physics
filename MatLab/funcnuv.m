function phip=funcnuv(k,phiz,phim)
h=0.01;
const=(k*h)*(k*h)/12;
phip=(2*(1-5*const)*phiz-(1+const)*phim)/(1+const);
