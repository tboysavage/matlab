% Define the function
f = @(x) ((169/16)*x(1)^2 - (13/4)*x(2) - 11)^2 + ((13/4)*x(1) + (169/16)*x(2)^2 - 7)^2;

% Define the lower and upper bounds for the variables
lb = [-1, -1];
ub = [1, 1];

% Define the constraint function (empty in this case)
nonlcon = [];

% Define the initial guess for optimization
x0 = [0, 0];

% Set the options for optimization
options = optimoptions('fmincon', 'Display', 'off');

% Perform the constrained optimization
x_min = fmincon(f, x0, [], [], [], [], lb, ub, nonlcon, options);

x_min

