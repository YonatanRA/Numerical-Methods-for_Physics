clc
  clear
  disp 'numerov method for finding zero of function'
  k=1;
  dk=0.5;
  tol=1e-08;
  phim=0;
  phiz=0.01;
  phipold=funcnuv(k,phiz,phim);

        for i=1:90
            phip=funcnuv(k,phiz,phim);
            phim=phiz;
            phiz=phip;
            k=k+dk;
                  if(phipold*phip<0)
                    k=k-dk;
                    dk=dk/2;
                  end
                  if (abs(dk)<tol)
                      break
                  end
        end

    disp 'phip=' ; disp(phip)
    disp 'k='; disp(k)
    disp 'i='; disp(i)