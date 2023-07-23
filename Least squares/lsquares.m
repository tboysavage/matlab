%For the given locations t=(t1,...tm)
% and values f=(f1,...,fm)
% , we are searching for a function F(t)=at+b
%  that fits best the data in the sense of the least squares method.
% Write a function, that returns pars=(a,b)
%  and y=(F(x1),...,F(xn))
%  for parameters t,f,x
% 3≤m≤10
%2≤n≤5
%In each of the cases the solution is uniquely determined by the data.

function [pars,y]=solve(t,f,x)
% Fit a polynomial of degree 1 to the data points
p = polyfit(t, f, 1);
% Extract the parameters (a and b)
a = p(1);
b = p(2);
% Compute the fitted values F(x) using the parameters
y = polyval(p, x);
% Return the parameters and the fitted values
pars = [a, b];
end