% Define the function
f = @(x) sin(68921/512*x.^3) - cos(123/8.*x);

% Define the roots
roots = [-0.123141572 -0.080515643 0.123141572 -0.066307 0.094724286];

% Initialize the minimum absolute value
min_abs_value = abs(roots(1));

% Iterate over the roots to find the smallest absolute value
for i = 2:length(roots)
    abs_value = abs(roots(i));
    if abs_value < min_abs_value
        min_abs_value = abs_value;
    end
end
format long

% Display the smallest root in absolute value
min_abs_value