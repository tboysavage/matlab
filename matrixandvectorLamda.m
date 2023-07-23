A = [2 0 0 -3; 2 2 -3 3; 1 -1 -3 -3; -2 0 -3 -2];
v = [0;-2;-2;1];
Lambda = eig(A);
minn = norm(A*v-Lambda(1)*v);
minnLambda = Lambda(i);
for i=2:length(Lambda)
    if minn>norm(A*v-Lambda(i)*v)
        minnLambda = Lambda(i);
    end
end
minnLambda

