A=[2,2,1,-2;0,-3,-2,2;1,3,-2,-1;-1,3,2,3]
v=[0 -1 1 -3]'
%find lambda for which ||Av - lambdav||2
lambda=dot(A*v,v)/dot(v,v)