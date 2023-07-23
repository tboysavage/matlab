function R=solveit(n)
k=1:n;
S = cumsum(((-1).^k)./k);
R = prod(S);
end