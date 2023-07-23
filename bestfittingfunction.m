%change these values
t = [4 -10 6 -5 6 2 -9];
f = [0 -3 4 -1 3 -4 6];
%if its in the for F(t)=a/t + b then
A = [1./t' ones(length(t),1)];

%if its in the for F(t)=at^2 + bt + c then
%n is the number we are looking for a value for 
polyval(polyfit(t,f,2),n)

%if its in the for F(t)=at + b then
A=[t' ones(length(t),1)]

x = (A'*A)\(A'*f');

%Type this in the command window: we are looking for values of number n
% x(1)/n+x(2)
