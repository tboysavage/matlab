function [px,pd]=solveit(t,x,d)
  fun=@(x) cos(x)/(1+exp(x)^2);
  n=length(t);
  pol=polyfit(t,arrayfun(fun,t),n-1);
  px=polyval(pol,x);
  pd=pol(end-d);
end