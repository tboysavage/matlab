%% Numerical integration

%%
% Anonymous function - inline, unnamed one line formula
% can be used later as a defined function
 @(x) x.*sin(x);
 
% function handle - e.i. store an anonymous function in a variable
f1 = @(x) x.*sin(x);
% We can use this as a function
y = f1(pi/4)

%%
% Multi-variate function
f2= @(x,y) x.^2+x.*y-y+3;
z=f2(2,-1)

%% One variable functions integration with built-in function integral()
% integral(fun,xmin,xmax), where fun is a function handle capable of
% calculating with vectors!
f= @(x) x.*sqrt(1+x);
integral(f,0,3)
% important to use element-wise operators

%% we can use the anonymous function inline
integral(@(x) x.*sqrt(1+x),0,3)

% create a function handle from built-in functions or own functions 
f =  @sin;
f = @own_function_defined_in_file;
% 
integral(@sin,0,pi)


%% Improper integral
integral(@(x) exp(-x),0,inf)
% works even if the function is not defined at the given point:
f= @(x) 1./sqrt(1-x.^2);
integral(f,-1,1)

%% Two-variate function:
f= @(x,y) x.*exp(-x.^2-y.^2);
integral2(f,-2,2,-1,1)

%% Parametrize the two bounds as functions:
f= @(x,y) sqrt(1-x.^2-y.^2);
ymin= @(x) -sqrt(1-x.^2);
ymax= @(x) sqrt(1-x.^2);
integral2(f,-1,1,ymin,ymax)

%% Implement the compund rules! (midpoint,trapesoidal, Simpson)
% Let the algorithm also plot the base points used by the applied rules! 
f = @(x) log(x);
a = 4;
b = 5.2;
m = 5;
%type = 'simpson';
%type = 'midpoint';
type = 'trapesoidal';
I = compound_rules_plot(f,a,b,m,type)

%%
% Before calculating the error of the approximation of the integral:
% Matlab derivative  with symbolic variables and expressions

syms x % define symbolic variables
f = log(x); % symbolic expression creation
diff(f) % first derivative of f
diff(diff(f)) % second derivative
diff(f,2) % also second derivative

%% Given a function, 
%% calculate the error of the compound rules:
syms x
f = log(x);
d2 = diff(f,2) % -1/x^2 in absolute values gets its maximum at 4 
M2 = abs(subs(d2,4))
d4 = diff(f,4) % -6/x^4 in absolute values gets its maximum at 4 
M4 = abs(subs(d4,4)) 

%%
M2 = double(M2);
M4 = double(M4);
%%
a = 4;
b = 5.2;
m = 6;

% Compound midpoint rule error:
error_midpoint = ((b-a)^3)/(24*m^2)*M2

% Compound trapesoidal rule error:
error_trapz = ((b-a)^3)/(12*m^2)*M2

% Compound simpson rule error:
error_simpson = ((b-a)^5)/(2880*m^4)*M4


%% If the function is unknown, only the function values are  given at some points,
% but we need to approximate the integral value:
% use the trapz() built-in function on the given points.
x=0:5:60;
f=[ 2.2 2.8 3 3 2.7 2.5 2.4 2.9 3.3 3.5 3.5 3.3 3];
trapz(x,f) % the value of the integral