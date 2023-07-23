function R=solveit(n)
k=1:n;
R1= cumprod(k./((k.^2)+1));
R= sum(R1);
end