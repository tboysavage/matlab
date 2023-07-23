f=@(x) sin(512*x^3)-cos(24*x)-4;
[x_min, ~] = fminbnd(@(x) -f(x), 0, 4);
format long
location = x_min