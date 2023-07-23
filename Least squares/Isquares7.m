% For the given locations t=(t1,...tm)
%  and values f=(f1,...,fm)
% , we are searching for the parameters a,b,c
%  of the function
% F(t)=acos(πt)+bsin(πt)+c
% 
% that fits best the data in the sense of least squares method and the values of F
%  at the given locations x=(x1,...,xn)
% .
% Write a function, that returns the vectors y=(F(x1),...,F(xn))
%  for the given data t,f,x
% 3≤m≤10
% 
% 1≤n≤5
% 
% For each case the parameters of the model are uniquely determined by the data.

function y=solve(t,f,x)

A = [cos(t*pi) sin(t*pi) ones(length(t),1)];
m = (A' * A) \ (A' * f);
a = m(1);
b = m(2);
c = m(3);
% Compute the fitted values
y = a.*cos(x'.*pi) + b.*sin(x'.*pi) + c;
% Store the parameters a and b and c in pars
end