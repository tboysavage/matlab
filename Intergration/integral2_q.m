f = @(x,y) (sin(x)./(y.^4+1)).*(exp(1).^(-y.^2))./(1+x.^2);
xmin=0;
xmax=8;
ymin=-2;
ymax= @(x) 3*x;
integral2(f,xmin,xmax,ymin,ymax)
