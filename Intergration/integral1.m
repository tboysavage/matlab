f = @(x) log(log(1+x.^2)).*(1./(1+x.^2));
integral(f,-inf,-29)