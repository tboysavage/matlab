%% 1. 
% Create the matrix A, given the following rules:
% if i=j  then 1, if i<j then -1, 0 otherwise

n = 5;
A = 2*eye(n) - triu(ones(n))
% multiple ways to solve
A = triu(zeros(n)-1)+eye(n)*2
A = triu(ones(n)*-1+2*eye(n))

%% 2.
% A matrix, b vector
% backslash operator


A = triu(ones(100)*-1+2*eye(100));
b1 = (-98:1)';

x = A\b1
%%
% perturbed b vector, b(100) = 1.00001
b2 = b1;
b2(100) = b1(100) + 1e-6;

x = A\b2
%%
% Plot all 2D vectors which have a norm equal to 1!

figure
axis equal
hold on
for x1=-1:0.001:1
    for x2=-1:0.001:1
        if abs(norm([x1,x2],1) - 1) < 1e-10
           plot(x1,x2,'b.-'); 
        end
        if abs(norm([x1,x2],2) - 1) < 1e-5
           plot(x1,x2,'r.'); 
        end
        if abs(norm([x1,x2],inf) - 1) < 1e-10
           plot(x1,x2,'g.'); 
        end
    end
end

%%
% 3D, 1-norm
figure
hold on
for x1=-1:0.1:1
    for x2=-1:0.1:1
        for x3=-1:0.1:1
            if abs(norm([x1,x2,x3],1) - 1) < 1e-10
               scatter3(x1,x2,x3,'b.'); 
            end
        end
    end
end

%%
% 4.
% implement the norm function (p-norm and infinity norm)


p = 2;%'inf';
x = 1:0.1:5;

if(p == 'inf')
    norma = max(abs(x));
else
    norma = sum(abs(x).^p).^(1/p);
end

norma
%%
help norm
%%
norm(x,p)
%%
% Calculate the matrix norms of 1 and infinity
help sum % matrix default sum of columns
%%
A  = [-3,0,4;1,-1,2;-2,1,-2];



max(sum(abs(A),1))
max(sum(abs(A),2))
%%
norm(A,1)
norm(A,'inf')
%%
help normest
% estimating the 2-norm of the matrix

%%
% kondition number
% matrix from the first exercise
A = triu(ones(100)*-1+2*eye(100));
b = (-98:1)';
x = A\b;
c = b;
c(100) = 1.00001;
y = A\c;

condA = cond(A,'inf')

%%
% 11

A = [1,0.99; 0.99,0.98];
b = [1.99;1.97];
b_d = [1.98;1.98];
x = A\b
y = A\b_d

cond_A = cond(A,'inf')

%%
% Hilbert matrix

H = hilb(6);

cond(H)

R = rand(6);
cond(R)