% f(t) = a*sin(pi*t)+b
t=[18 12 2 16 1 13 23/2];
f=[-9/2 1 3/2 -3/2 0 5 -5/2];
A=[sin(pi*t') ones(length(t),1)];
x = (A'*A)\(A'*f')
x(1)*sin(pi*2) + x(2)