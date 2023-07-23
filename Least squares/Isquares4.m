% For the given locations t=(t1,...tm)
%  and values f=(f1,...,fm)
% , we are searching for a function F(t)=at+b
%  that fits best the data in the sense of least squares method.
% Write a function, that returns pars=(a,b)
%  and y=(F(x1),...,F(xn))
%  for parameters t,f,x
% Additional information:
% 
% 
% 3≤m≤10
% 
% 2≤n≤5
% 
% In each of the cases the solution is uniquely determined by the data.
function [pars, y] = solve(t, f, x)
% Create the matrices A and b for the least squares problem
A = [1 ./ t, ones(length(t), 1)];
% Compute the least squares solution using matrix operations
m = (A' * A) \ (A' * f);
% Extract the parameters a and b
a = m(1);
b = m(2);
% Compute the fitted values y = a/t + b at the specified points x
y = a ./ x' + b;
% Store the parameters a and b in pars
pars = [a, b];
end