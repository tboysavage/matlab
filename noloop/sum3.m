function R=solveit(n)
k=0:n;
R=sum((k+1)./(k.^2+1));
end