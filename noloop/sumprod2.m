function R=solveit(n)
m = 2:n;
R1 = cumprod(((1 + ((-1).^m)./m).^m)); %funny how power not *
R = sum(R1);
end