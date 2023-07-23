%% Optimization
% with built-in Matlab functions
% previously: 
% fzero
% fsolve
% roots

%% NEw functions for function minimalization
% fminbnd, fminsearch, fminunc

%% One-variate function minimalization
% fminbnd(f,xmin,xmax) 

% Find the minimum of the f(x) = 13-9cos^2(x)-12sin(x) function
% in the [-4,4] interval
f=@(x) 13-9*cos(x).^2-12*sin(x);
fplot(f,[-4,4])
%%
[x,fval]=fminbnd(f,0,1)
%%
[x,fval]=fminbnd(f,2,3)

%% Multivariate functions


f = @(x1,x2) x1.^3 + x2.^3 - 3*x1 - 3*x2;
fsurf(f)
%%
fmesh(f)
%% Creating gridpoints for a plot
xx=linspace(-2,2)
yy=xx
[X,Y]=meshgrid(xx,yy)
%%
%Z=X.^3+Y.^3-3*X-3*Y;
Z = f(X,Y);
figure 
mesh(X,Y,Z)
%%
surf(X,Y,Z)
%% Contour lines - contour plot
fcontour(f,[-2,2])
%%
xx=linspace(-2,2);
yy=xx;
[X,Y]=meshgrid(xx,yy);
Z=f(X,Y);
figure
contour(X,Y,Z)
axis equal

%% draw gradient vectors 

[X,Y]=meshgrid(linspace(-2,2));
Z=f(X,Y);
[dX,dY]=gradient(Z);
hold on
quiver(X,Y,dX,dY)
%% use sparse gridpoints to calculate the gradient
[X,Y]=meshgrid(linspace(-2,2,11));
Z=f(X,Y);
[dX,dY]=gradient(Z);
hold on
quiver(X,Y,dX,dY)
% Draw the negative gradient that points to the descending slope, in the
% direction of the local minimum points.
% quiver(X,Y,-dX,-dY)
%% Multivariate function minimalization
% fminsearch
% fminunc 
% instead of a two-variate function definition:
% f = @(x1,x2) x1.^3 + x2.^3 - 3*x1 - 3*x2;
% for optimization every function should be defined as single variate function
f = @(x) x(1)^3+x(2)^3-3*x(1)-3*x(2);

[xopt,fopt]=fminsearch(f,[0.5,0.5]) 
%%
[xopt,fopt]=fminunc(f,[0.5,0.5])

%% Exercise
% Calculate the local minimum  at [-2,2]x[-2,2]
% of the following function! And draw 3D and countour plots.
% f(x1,x2) = x1^5 - 3*x1 + x2^5 - 3*x2

% Always look at the figure of the function!

f = @(x1,x2) x1.^5 - 3*x1 + x2.^5 - 3*x2;
interval = [-2,2,-2,2];
figure
subplot(1,2,1)
fsurf(f,interval)

subplot(1,2,2)
[X,Y]=meshgrid(linspace(-2,2));
Z=f(X,Y);
contour(X,Y,Z)
axis equal
[X,Y]=meshgrid(linspace(-2,2,15));
Z=f(X,Y);
[dX,dY]=gradient(Z);
hold on
quiver(X,Y,-dX,-dY)

%%
f = @(x) x(1).^5 - 3*x(1) + x(2).^5 - 3*x(2);
[xopt,fopt] = fminsearch(f,[2,2])
