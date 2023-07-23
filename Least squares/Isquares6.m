% For the given locations t=(t1,...tm)
%  and values f=(f1,...,fm)
% , we are searching for the parameters a,b,c
%  of the function
% F(t)=a+bt+ct2
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
y = polyval(polyfit(t',f',2),x');
end