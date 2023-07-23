% Note this code tested once only

t = [-3 1 -1 2 -2];

f = [-525 -17 -11 -50 -122];

value_at=3;

% DO NOT CHANGE ANYTHING BELOW THIS %
% Number of data points
n = numel(t);

% Initialize the Lagrange interpolation table
Lagrange_table = zeros(n, n+1);

% Compute the Lagrange coefficients
for i = 1:n
    Lagrange_table(i, 1) = t(i);
    Lagrange_table(i, 2) = f(i);
end

% Compute the missing values in the table
for j = 3:n+1
    for i = 1:n-j+2
        Lagrange_table(i, j) = (Lagrange_table(i+1, j-1) - Lagrange_table(i, j-1)) / (t(i+j-2) - t(i));
    end
end

% Display the Lagrange interpolation table
Lagrange_table

value_at_answer = polyval(polyfit(t,f,(n-1)),value_at)