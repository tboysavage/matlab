%%

0.4 - 0.5 + 0.1 == 0

0.1 - 0.5 + 0.4 == 0

0.5 - 0.4 - 0.1 == 0

0.5 - 0.1 - 0.4 == 0

% 0.1 binary form : 0.0001100110011...
% 0.4 binary form : 0.01100110011...

%%

x=1/3;
for i=1:40
    x=4*x-1
end
x

%%

2^66 + 1 == 2^66
2^66 + 10 == 2^66
2^66 + 100 == 2^66
2^66 + 1000 == 2^66
2^66 + 10000 == 2^66
%%
% What is the first values that it will not be true?

k = 1000;
while 2^66 + k == 2^66
   k = k + 1;
end
k



%%
a = 0;
for i = 1:5
    a = a + 0.2;
end
a == 1

a = 1;
for i = 1:5
    a = a - 0.2;
end
a == 0

%% Calculating with the formulas
a = 2;
t = 4;
kmin = -3;
kmax = 2;

gepi_eps = a^(1-t);
%%
% Calculate the actual machine epsilon!
k = -60;
while 1 + 2^k == 1
   k = k + 1;
end
k

%%
help eps
%% 
eps(1)
eps(1) == 2^k

%%

k = -2000;
while 0 + 2^k == 0
   k = k + 1;
end
k
eps_0 = eps(0)
eps_0 == 2^k
%% Check the distance from the previous exercise value to its rightside neighbour
eps(2^66)

%%
realmin()
realmax()
%%
x = 1/3;
for i=1:40
    x = 4*x-1
end
x
%%
a  = [0 0.1 0.2 0.3 0.4];
b  = 0:.1:.4;
as = sprintf('%20.18f\n',a)
bs = sprintf('%20.18f\n',b)

a == b 
% best practice to not check exact equality, but check distance from the
% two values to see if they are 'close enough'
tol = 1e-10
abs(a-b) < tol

all(abs(a-b) < tol)


