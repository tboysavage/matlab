%% Nonlinear equations

% Previously: solving a linear equation, getting the roots of it is a
% simple exercise.
% linear function : f(x) = ax + b
% linear equation: a*x = b, reordered to zero: a*x + b = 0
% x = -b/a;
% In case of system of linear equations we solve it with Gaussian
% elimination

%% But if the equation is NOT linear:

% We search for the solutions of the 
% f(x) = 0 equation, 
% where f is a nonlinear function


%e.i. nonlinear functions
f1 = @(x) cos(x) - x; % trigonometric
f2 = @(x) x^5 - 3*x^4 + x^3 -5*x^2 + 3; % polynomial with degree larger than 1
f3 = @(x) exp(x) - 4*x^2; %exponential 
f4 = @(x) log(x) - x + 2;  % logarithm 

%% Approximate the roots of the f(x) = 0 equation with iteration

% Iteration algoriths need:
    % x0 starting point
    % the strategy to calculate the 'next point' from the 'current point'
    % stopping criteria

% The functions should have different signs at the endpoints:
% f(a)*f(b) < 0
% in this case the equation f(x) = 0 has at least one solution over [a,b],
% if f(x) is also continuous.
    
%% Bisection (or Midpoint method)



% Firstly check the function plot
f = @(x) x.^3 - 3*x -2;
fplot(f)
%%
a = 0;
b = 3;
maxit = 25;
eps = 1e-3;

% check the sign condition
if f(a)*f(b)<0
   L = a; % left point
   R = b; % right point
   
   for k = 0:maxit
        M = (L+R)/2;
        if f(M) == 0
            break % M is the root
        end
        if f(L)*f(M) < 0
            R = M;
        else
            L = M;
        end
        if abs(R - L) < eps
            break % M is a good enough approx. of the root
        end
   end
end

M

%% check with plot
fplot(f,[a,b])
hold on
plot(M,f(M),'r*')

%% Approximate root of f(x) function 
f = @(x) x.^3 - 3*x - 2;
a = 0;
b = 3;

maxit = 25;
eps = 1e-5;

% Try to plot the steps

% check the sign condition
if f(a)*f(b)<0
   L = a; % left point
   R = b; % right point
   
   fplot(f,[a,b])
   hold on 
   plot([L,R],[f(L),f(R)],'r*')
   hold off
   pause(0.3)
   
   for k = 0:maxit
        M = (L+R)/2;
        if f(M) == 0
            break % M is the root
        end
        if f(L)*f(M) < 0
            R = M;
        else
            L = M;
        end
        pause(0.3)
        fplot(f,[a,b])
        hold on 
        plot([L,R],[f(L),f(R)],'r*')
        hold off
        
        if abs(R - L) < eps
            break % M is a good enough approx. of the root
        end
   end
end

M

%% (NR) Newton-Raphson method
% Only base the calculation on one point
% Quadratic convergence
% In every step it uses the first derivative of the function

% Calculate the derivative with symbolic variables
syms x
f = x.^3 - 3*x + 2;
diff(f) % 3*x^2 - 3

% 
%%
f = @(x) x.^3 - 3*x + 2;
derivf = @(x) 3*x.^2 - 3;

x0 = 1.5;
maxit = 10;

fplot(f)
hold on

x = x0;
for k = 0:maxit
    x = x - f(x)./derivf(x) 
    plot(x,f(x),'r*')
    pause(0.3)
end


%% Approximate the root of the f function with NR method
% f(x) = x^3 - 5x
syms x
f = x.^3 - 5*x;
diff(f)
%%
f = @(x) x.^3 - 5*x;
derivf = @(x) 3*x.^2 - 5;

x0 = 1; 
maxit = 10;

fplot(f)
hold on

x = x0;
for k = 0:maxit
    x = x - f(x)./derivf(x) 
    plot(x,f(x),'r*')
    pause(0.3)
end

%% Approximate the root sqrt(5) value with NR-method
% x^2 - a = 0 --> x^2 = a --> x = sqrt(a), so x^2 - a = 0 equation
% 
% f(x) = x^2 - a
% f'(x) = 2x
a = 5;
f = @(x)x.^2-a
df = @(x)2*x;
x0 = 2
format long

maxit = 10;

fplot(f)
hold on

x = x0;
for k = 0:maxit
    x = x - f(x)./derivf(x) 
    plot(x,f(x),'r*')
    pause(0.3)
end
abs(x - sqrt(a)) % check
%% Secant method
% NR method uses the derivative, which can be unavailable or costly
% use the derivative approximation with TWO points

f = @(x) cos(x) - x;
fplot(f)
%%
x0 = 0;
x1 = 0.5;
eps = 1e-5;
maxit = 15;

fplot(f)
hold on


for k = 0:maxit
    xnew = x1 - f(x1).* (x1-x0)./(f(x1)-f(x0))
    x0 = x1;
    x1 = xnew;
    if abs(f(x1)) < eps
        break
    end
    
    plot(xnew,f(xnew),'r*')
    pause(0.2)
end
%% Matlab built-in functions 
% fzero: works only for sing-changing functions
% fsolve: Approx the roots of F(x) = 0 equation from x0. F can be multivariate.
% roots: approx roots of polynomials

% Approx. the roots of cos(x) = 3x equations from 0.

F = @(x) cos(x) - 3*x;
fplot(F)
x0 = 0;
%%
[xopt,fopt] = fzero(F,x0)
%%
[xopt,fopt] = fsolve(F,x0)

%% System of nonlinear equations 
F=@(x) [-4*x(1)+cos(2*x(1)-x(2))-3; -3*x(2)+sin(x(1))-2];
[xopt,fopt] = fsolve(F,[0;0])


%% Roots of a polynomial
% 
% ei. 3*x^5 - 4*x^4 + 2x^3 - x + 1
% order of coefficients strats from main coeff.: 
% 3, -4, 2, 0, -1, 1
p = [3, -4, 2, 0, -1, 1]; 
roots(p)




