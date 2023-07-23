t = [9 -4]; %points
f = [5 1]; 
format rat
p = polyfit(t, f, 1);
polyval(p, -8)