t = [-10 -1 -10 9 9 9];
f = [-5 -5 10 -1 6 -10];
format long
a=polyfit(t,f,2) %for first order change 2 to 1

% value at n
polyval(a,9/2)