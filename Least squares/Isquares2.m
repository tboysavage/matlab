% For the given locations t=(t1,...tm)
%  and values f=(f1,...,fm)
% , we are searching for the slope and the constant term of the line that fits best the data in the sense of the least squares method.
% Write a function, that returns a,b,y
% , where a
%  is the slope, b
%  is the constant term of the needed line and y=ax+b
% 3≤m≤10
%In each of the cases the solution is uniquely determined by the data.

function [a,b,y]=solve(t,f,x)
% Fit a polynomial of degree 1 to the data points
p = polyfit(t, f, 1);
% Extract the slope (a) and constant term (b)
a = p(1);
b = p(2);
% Compute the fitted value y = ax + b at the specified point x
y = a * x + b;
end