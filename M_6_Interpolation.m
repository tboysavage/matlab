%% Interpolation
% We have n observations for given pairwise different points, 
% We are searching for a minimal degree polynomial. 
% 
% Proposition:
% There is exactly one polynomial of degree at most n-1 (number of data points minus 1),
% which fulfills the conditions.
% polyfit(), polyval(), built-in functions
% \ (backslash operator), plot()
% Manual calculations:
% Newton-form of Lagrange-polynomial (divided differences)
% Hermite-interpolation
% Horner- algorithm

%% 1. 
% Find the Lagrange polynomial that passes through the points:
% (-2, -5),(-1, 3),(0, 1),(2, 15)
% Plot the points and the minimal degree polynomial.

x = [-2 -1 0 2];
f = [-5 3 1 15];

% mininal degree = number of data points - 1
m = length(x)-1;

p = polyfit(x,f,m);
% p =  2.0000    1.0000   -3.0000    1.0000
% polyfit output order of coefficients: main coefficient first, constant
% last
% the Lagrange-polynomial = L_3(x) = 2*x^3+1*x^2-3*x+1

figure
plot(x,f,"b*")
hold on
xx = linspace(min(x),max(x),100);
y = polyval(p,xx);
plot(xx,y)
%Check:  The curve of the polynomial goes through all the points!
plot(x,f,"b*",xx,y,'r')

%% 2. 
% Find the Lagrange polynomial that passes through the points:
% (-3, -6), (-2, -17), (-1, -8), (1, -2), (2, 19)
% Plot the points and the minimal degree polynomial. 

x = [-3 -2 -1 1 2];
f = [-6 -17 -8 -2 19];

m = length(x)-1;

p = polyfit(x,f,m);

figure
plot(x,f,"*")
hold on
xx = linspace(min(x),max(x),100);
y = polyval(p,xx);
plot(xx,y)


%% 3. 
%  Find the Lagrange polinomial that passes through the points:
% (-3, -31), (-2, -8), (1, 1), (2, 22)
% Plot the points and the minimal degree polynomial. 

x = [-3 -2 1 2];
f = [-31 -8 1 22];

m = length(x)-1;

p = polyfit(x,f,m);

figure
plot(x,f,"*")
hold on
xx = linspace(min(x),max(x),100);
y = polyval(p,xx);
plot(xx,y)

%% Slides: Divided differences for Lagrange-polynomial
%% Slides: Horner algorithm for evaluating the polynomial at given point(s)
%% Slides: Hermite interpolation
%% Slides: Cubic Spline introduction
%%
% Cubic Spline interpolation
%  
% spline()
% plot()

% spline() function: spline(X,Y) provides the piecewise polynomial form of the 
%    cubic spline interpolant to the data values Y at the data sites X.
% Y vector has the first derivative of the first and last points at the
% first and last element of Y vector. As a third input we can give the
% points where we want the result polynomial to be evaluated. 


% 1.
% Calculate the cubic spline curve for these points:
% xi -2 -1 0 1  2 3
% S   4  1 7 4 12 9
% S' 15           8

x = -2:3;
y = [15 4 1 7 4 12 9 8]; 
xx = linspace(min(x),max(x));

% gives the coefficients
%p = spline(x,y)
% or use with the third parameter to evaluate immediately:
yy = spline(x,y,xx);

plot(x,y(2:end-1),'*') % the 2 derivatives in y are not to be plotted as points
hold on
plot(xx,yy) % plot the spline result

%% Slides: Exercise 19. Connecting two lines with a smooth curve

leftline_x = [3,8];
leftline_y = [9,4];
rightline_x = [14,19];
rightline_y = [4,9];
plot(leftline_x,leftline_y,'b-',rightline_x,rightline_y,'b-')
axis([2,20,0,12])
hold on
%
% Get the derivative of the two lines by calculating the steepness of them
leftline_p = polyfit(leftline_x,leftline_y,1)
rightline_p = polyfit(rightline_x,rightline_y,1)
%
x = [8,14];
f = [leftline_p(1),4,4,rightline_p(1)];
p = spline(x,f)

xx = linspace(8,14,50);
yy = spline(x,f,xx)
plot(xx,yy,'r-')


%% Exercise for Hermite-interpolation
% What is the value at -2 of the minimal degree polynomial H, 
% which has the following conditions:
% H(-4)=-69, H(-1)=-6, H'(-4)=33?

% Divided differences
% -4 | -69 
%          33/1!=33
% -4 | -69                          (21-33)/(-1-(-4))=-4
%          (-6-(-69))/(-1-(-4))=21
% -1 | -6

% H_2(x) = -69 + 33*(x-(-4))-4*(x+4)^2
% at -2 
x = -2;
-69 + 33*(x-(-4))-4*(x+4)^2
% -19
