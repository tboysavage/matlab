% For the given locations t=(t1,...tm)
%  and values f=(f1,...,fm)
% , we are searching for the slope and the constant term of the line that fits best the data in the sense of the least squares method.
% Write a function, that returns a,b,y
% , where a
%  is the slope, b
%  is the constant term of the needed line and y=ax+b
% .
% In each of the cases the solution is uniquely determined by the data.
% For this problem it is forbidden to use the functions polyfit, linsolve,\ .


function [a, b, y] = solve(t, f, x)
% Create the matrices A and b for the least squares problem
A= [t ones(length(t),1)];
% Compute the least squares solution using matrix operations
m = mldivide((A' * A),(A' * f)) ;
% Extract the slope (a) and constant term (b)
a = m(1);
b = m(2);
% Compute the fitted values y = ax + b at the specified points x
y = a * x' + b;
end