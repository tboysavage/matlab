function R=solveit(n)
k= 0:n;
R= sum( ((k.^3)+1)./(exp(1).^k) );
end