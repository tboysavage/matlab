% Define the function
f = @(x) (x.^2) -8;
% Set the initial point and number of iterations
x0 = 2;
% first run n=2 for first part
n = 2;
%Do not modify below
% Compute the derivative of the function symbolically
h = 1e-6; % Step size for numerical differentiation
df = @(x) (f(x + h) - f(x - h)) / (2 * h);
% Perform Newton's method iterations
x = x0;
for i = 1:n
x = x - f(x) / df(x);
end
% Display the approximate root
approx_root = x