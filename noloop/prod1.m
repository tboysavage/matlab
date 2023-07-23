function R=solveit(n)
k = 0:n;
R = prod(1 - sin(k)./(k + 1));
end