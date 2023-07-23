f = @(x) x.*exp(1./x);
a = 1;
b = 4;
format
%DO NOT MODIFY ANYTHING BELOW
trapezoidal_approximation = (b-a) * (f(a) + f(b)) / 2;
simple_simpson_approximation = (b-a) * (f(a) + 4*f((a+b)/2) + f(b)) / 6; 
midpoint_approximation= (b-a) * f((a+b)/2);
% Display the results
trapezoidal_approximation
simple_simpson_approximation
midpoint_approximation