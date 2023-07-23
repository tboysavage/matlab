%For the given A and v0, compute v4 with power iteration.
A = [3 2 3 1; -1 0 3 0; -2 1 3 2;-3 3 -3 2];
v0 = [3 -3 -2 0]';
%compute v4 with power iteration
%change k
k = 4;

%vk+1 = (Avk)/||Avk||2, k>=0
vy=v0;
v0 = v0/norm(v0);
lambda = dot(A*v0, v0);
for i=1:k
    vy = A*v0;
    v0 = A*v0;
    v0 = v0/norm(v0,2) %the solution
    lambda_new = dot(A*v0,v0);
end
%The last option in the command window is the answer
