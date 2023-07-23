f = @(x) sin((1331./8).*x.^3)-cos((33/2).*x)
[x,fval]=fminbnd(f,0,1)