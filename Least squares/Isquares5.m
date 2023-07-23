% For the given locations t=(t1,...tm)
%  and values f=(f1,...,fm)
% , we are searching for the parameters a,b,c
%  of the function
% F(t)=at+be1t+ct1+t
% 
% that fits best the data in the sense of least squares method and the values of F
%  at the given locations x=(x1,...,xn)
% .
% Write a function, that returns the vectors pars=(a,b,c)
%  and y=(F(x1),...,F(xn))
%  for the given data t,f,x
% 3≤m≤10
% 
% 1≤n≤5
% 
% For each case the parameters of the model are uniquely determined by the data.
function [pars, y] = solve(t, f, x)
% Create the matrices A and b for the least squares problem
A = [t exp(1./t) t./(1+t)];
% Compute the least squares solution using matrix operations
m = (A' * A) \ (A' * f);
% Extract the parameters a ,b,c
a = m(1);
b = m(2);
c = m(3);
% Compute the fitted values
y = a*x' + b.*exp(1./x') + c*(x'./(1+x'));
% Store the parameters a and b and c in pars
pars = [a, b, c];
end