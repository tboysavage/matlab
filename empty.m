t = [-1 7 3 9 -1 7]; 
f = [1 4 7 7 -1 6];
p = polyfit(t,f,2);
polyval(p, -9)
format long
