%try each option v to find lambda, and get the greatest value
A = [11 2 6;2 14 -3;6 -3 6];
v = [0.66667 -0.33333 -1.0]'; 
lambda = dot(A*v,v)/dot(v,v) %store each value for each option v and see the greatest result
%if there are no dominant eigenvalues or in other words, there are several
%equal eigen values, then you can not get eigenvector v for the dominant
%eigenvalue

%15
%15
%15
%1