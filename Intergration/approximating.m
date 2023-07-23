f = @(x) log(x)/(1+exp(1)^x);
a = 4;
b = 5;
n = 3;
format long
%DO NOT MODIFY ANYTHING BELOW
h = (b - a) / n;
compound_trapezoidal_approximation = 0; 
compound_simple_simpson_approximation = 0; 
compound_midpoint_approximation = 0;
for i = 1:n
    x0 = a + (i-1) * h;
    x1 = a + i * h;
    compound_trapezoidal_approximation = compound_trapezoidal_approximation + (x1 - x0) * (f(x0) + f(x1)) / 2;
    x_mid = (x0 + x1) / 2;
    compound_simple_simpson_approximation = compound_simple_simpson_approximation + (x1 - x0) * (f(x0) + 4*f(x_mid) + f(x1)) / 6;
    compound_midpoint_approximation = compound_midpoint_approximation + (x1 - x0) * f(x_mid); 
end
% Display the compound approximations
compound_trapezoidal_approximation 
compound_simple_simpson_approximation 
compound_midpoint_approximation
