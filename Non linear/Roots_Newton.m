syms x %to be able to use diff for differentiation 
f = @(x) 3/4*x^2-3/32*x-9/1024
%df = diff(f(x)) the answer is displayed in the console, copy and paste it
%in df as an unknown function
df = @(x) (3*x)/2 - 3/32
x0 = -0.0625;
nrit = @(x) x-f(x)./df(x);
format long
for i = 1:6 %number of iterations
    x0 = nrit(x0)
end
%last value at bottom is answer