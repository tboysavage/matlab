%  a/t + b
t=[2 10 -10 -5 2];
f=[-3 -10 8 10 10];
A=[1./t' ones(length(t),1)];
x=(A'*A)\(A'*f')
a=x(1)
b=x(2)

%format rational for fractions