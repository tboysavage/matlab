%% Least Squares Approximation

% Base data points collected from some experiment or process.
% We decide on a model to try to approximate these base points. 
% The aim is not a perfect match to the points but the best approximation,
% in order to describe the process well enough.

%% Exmaple
% A cylindrical, 0.5m height tank is being filled with water at a constant
% rate. Peter starts to observe the height of water (at t = 0) in the tank.
% The measurements are summarized in the table below.

% the base point timestamps of the samples: (fist coordinate when plotting)
t = [0,2,4,6,8,10,12];

% the sample point values, the height of the water 
f = [3,4,5,5.5,6.5,7,8];

% The model chosen for this process:
% F(t) = x_1 + x_2*t
% Two unknown variables = parameters of the model: x1,x2

% Plot the sample points!
plot(t,f);
%%
% What is the height of the water in the tank at t = 20?
% When will be the tank full?
% When was the tank empty?

% To answer these we need to know the parameters of the model, x_1 and x_2!

% Because the is a linear model = first degree polynomial,
% so we can fit a first degree polynomial to the points
p = polyfit(t,f,1)% 1 is the degree
% p is a row vector of length N+1 containing the polynomial coefficients in
 % descending powers, so starting from the coefficient of the largest going
 % to the constant.
% So the x_1+x_2*t model case: in x_2, x_1 order!
% p = 0.4018    3.1607 
% F(t) = 3.1607 + 0.4018*t

%%
% Plot the line and the points we approximated:
figure
plot(t,f,"*")

% on the same figure we want to continue to draw
hold on

% Generate enught points (~100) to evaluate the model at.

x = linspace(min(t),max(t),100);
% the polyval function evaluates the polynomial given by the coefficients
% at the x points
y = polyval(p,x);
plot(x,y)

%%
% To answer the questions try to plot the model and  point on a longer
% interval
figure
plot(t,f,"*")
hold on
x = linspace(-10,20,100);
y = polyval(p,x);
plot(x,y)
%% And calulate what the model will predict
% What is the height of the water in the tank at t = 20?
polyval(p,20)
%% When will the tank be full
% so 50 = x_1 + x_2 * t -> t = ?
(50 - p(2))/p(1)

%% In the case of polynomial models use polyfit and polyval functions
% First degree (linear), second degree,third degree etc. models

% F(t) = x_1 + x_2*t
% F(t) = x_1 + x_2*t + x_3*t^2
% F(t) = x_1 + x_2*t + x_3*t^2 + x_4*t^3
% ...
% The n-degree polynomial always has n+1 coefficients.

% Try a 3-degree polynomial approximation!
t = [-2,-1,0,3,6,8,12];
f = [-15,-9,-5,1,2,7,17];

p = polyfit(t,f,3)
x = linspace(min(t),max(t));
y = polyval(p,x);

plot(t,f,'b*',x,y,'r-')

%% What is the exact model? 
% p = 0.0311   -0.4956    3.3623   -5.4993
% F(t) = 0.0311*t^3 - 0.4956*t^2  +  3.3623*t   -  5.4993

%%
% Determine the linear LSA for the data given below!

t = [1 1.1 1.1:0.1:2];
f = [8 8.9 9 9.8 10 11 11.5 11.5 12.5 13 13.7 14];

p = polyfit(t,f,1)

% The line equation: 5.8235*t + 2.5338
%% From a large scale we shovel off grain into bags. 
% After starting the work we note the number on the scale periodically.
%These are the noted values:
% timestamps in minutes
t = [1,15,20,28];
% weight in kg
f = [980,605,470,250];

%% At what timestamp will all the grain be in the bags?
%% How much grain was on the scale originally?

%% Look at the points to determine what type of model would approximate it well!
plot(t,f)
%% Based on this a linear model would be a good choice
p = polyfit(t,f,1);
x = linspace(0,40);
y = polyval(p,x);
plot(t,f,'b*')
hold on
plot(x,y)
%%  At what timestamp will all the grain be in the bags?

endtime = (0 - p(2))/p(1)
polyval(p,endtime) % check
%% How much grain was on the scale originally?

polyval(p,0)

%% Determine the 2-nd order polynomial LSA for the given data!
t = [2.1 2.2 2.3 2.3 2.5 2.6 2.8 2.9]; 
f = [2.5 2 2.5 2.7 3 4 5.4 7];
p = polyfit(t,f,2);
x = linspace(min(t),max(t));
y = polyval(p,x);
plot(t,f,'b*')
hold on
plot(x,y)


%% General model
%% Solve with the Gaussian normal-equation!

% Determine LSA for the given points using the model:
% F(t) = x1 + x2*cos(pi*t) + x3*sin(pi*t)
% And plot the points and the approximated model in one figure!

% t = 0.1 0.5 1.2 1.5 2 2.1 2.4 3 3.2
% f = 3.9 2.6 -0.8 0.3 3.2 3.8 3.2 -0.7 -0.9

% To use the Gaussian normal-equation we need the vectors to be
% column-wise.
t = [0.1 0.5 1.2 1.5 2 2.1 2.4 3 3.2]';
f = [3.9 2.6 -0.8 0.3 3.2 3.8 3.2 -0.7 -0.9]';

% Because the model is not polynomial, we cannot use the polyfit-polyval
% functions.
% But for every type of model we can create the A matrix from 
% the parameter coefficients!
% the coefficient functions corresponding to the x parameters:
% fi_1(t) = 1
% fi_2(t) = cos(pi*t)
% fi_3(t) = sin(pi*t)
% We use these as column vectors,with the t values 

A=[ones(length(t),1), cos(pi*t), sin(pi*t)];

% The normal equation: A'*A*x = A'*f
% The backslash operator can be utilized to solve this!

x = (A'*A)\(A'*f) % This x is holding the parameters of the model.

% If: x = 1.4372
%        2.0310
%        1.1711
% Then:
% F(t) =  1.4372 + 2.0310 cos(pi*t) + 1.1711 sin(pi*t)

%% Plotting
figure
plot(t,f,"*")
hold on
xx = linspace(min(t),max(t),100); 
y = x(1)+x(2)*cos(pi*xx)+x(3)*sin(pi*xx);

plot(xx,y)

%% Further examples:

%% Determine the linear LSA for the given data!

% t 1 1.2 1.4 1.4 1.5 1.7 1.9 2
% f 6.2 7 8 7.9 8.4 9.2 10 10.6

t = [1 1.2 1.4 1.4 1.5 1.7 1.9 2];
f = [6.2 7 8 7.9 8.4 9.2 10 10.6];

p = polyfit(t,f,1);
figure
plot(t,f,"*")
hold on
x = linspace(min(t),max(t),100);
y = polyval(p,x);
plot(x,y)


%% Determine the 3-rd order polynomial LSA for the given data!
% t 0.5 0.8 1.1 1.3 1.5 1.7 1.9 2.1 2.3
% f 2.5 2.3 1.8 1.3 0.9 0.4 0.1 -0.05 -0.01

t = [0.5 0.8 1.1 1.3 1.5 1.7 1.9 2.1 2.3];
f = [2.5 2.3 1.8 1.3 0.9 0.4 0.1 -0.05 -0.01];

p = polyfit(t,f,3);
figure
plot(t,f,"*")
hold on
x = linspace(min(t),max(t),100);
y = polyval(p,x);
plot(x,y)


%% Determine the LSA for the given data, using the model:
% F(t) = x1 + x2/t
% t 1 1.2 1.4 1.4 1.5 1.7 1.9 2 2.1 2.2
% f 4.2 3.8 3.4 3.3 3.3 3 2.8 2.8 2.75 2.7

t = [1 1.2 1.4 1.4 1.5 1.7 1.9 2 2.1 2.2]';
f = [4.2 3.8 3.4 3.3 3.3 3 2.8 2.8 2.75 2.7]';

% the coefficient functions of the x parameters:
% fi_1(t) = 1
% fi_2(t) = 1/t

A=[ones(length(t),1), 1./t];

% A'*A*x = A'*f

x = (A'*A)\(A'*f) 

%%
figure
plot(t,f,"*")
hold on
xx = linspace(min(t),max(t),100); 
y = x(1)+x(2)./xx;
plot(xx,y)

%% Determine the LSA for the given data, using the model: 
% F(t) = x1*sin(t) + x2*sin(2t) + x3*sin(3t)
% t 0.1 0.5 1.2 1.5 2 2.1 2.4 3 3.2 3.4 3.8 4 4.2 4.6 5
% f 1 4.1 3 1 -1.5 -1.6 -1.7 -0.4 0.1 0.7 1.6 1.8 1.6 0.2 -2.5

t = [0.1 0.5 1.2 1.5 2 2.1 2.4 3 3.2 3.4 3.8 4 4.2 4.6 5]';
f = [1 4.1 3 1 -1.5 -1.6 -1.7 -0.4 0.1 0.7 1.6 1.8 1.6 0.2 -2.5]';

% fi_1(t) = sin(t)
% fi_2(t) = sin(2t)
% fi_3(t) = sin(3t)

A=[sin(t), sin(2*t), sin(3*t)];

x = (A'*A)\(A'*f)

figure
plot(t,f,"*")
hold on
xx = linspace(min(t),max(t),100); 
y = x(1)*sin(xx) + x(2)*sin(2*xx) + x(3)*sin(3*xx)
plot(xx,y)
