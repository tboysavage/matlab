function R=solveit(n)
k=1:n;
S = cumsum(k./((k.^2)+1));
R= prod(S);
end