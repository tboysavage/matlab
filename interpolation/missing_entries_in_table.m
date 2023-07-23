% Note this code tested once only
t = [-2 -3 0 -1 3];
f = [46 212 8 12 596];
value_at=1;
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