t = [-17 11 19 -4 -8 -1 -20 6]
f = [8 -13 5 -15 18 -6 -18 9]
p = polyfit(t,f,1) %best fitting means linear n=1
xx = min(t):max(t)
yy = polyval(p,xx)
plot(t,f,'*',xx,yy) 
