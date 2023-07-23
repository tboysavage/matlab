%% Eigen values, eigen vectors

% A*x = lambda*x equation 
% lambda is the eigen value of matrix A, 
% x vector is the eigen vector corresponding to lambda.

% e.i.
A = [0,1,1;0.8,0,0;0,0.25,0];
% built-in function:
eig(A)
%%
u=eig(A)
% returns a vector containing the eigenvalues
%%
[V,U]=eig(A)
% returns two matrices,
% the first contains the eigenvectors as its columns,
% the second is a diagonal matrix with the eigenvalues in its diagonal
% These two correspond to each other based on their column indices.
%% Examples:

% Fill in the missing values in vector x
% to make it the eigenvector corresponding
% to the  largest eigenvalue of A! 

A=[73,32,19,10;-73,-32,-17,-11;-116,-50,-32,-16;-88,-40,-26,-9];
%x1=1 x2= ?, x3= ?, x4= ?
[U,V] = eig(A)
%%
v = U(:,4) % fourth eigen value is the largest
%%
l = 1/v(1)
v*l

% -0.5;-1;-3.5

%% Dominant eigenvalue
% Find an eigenvector v 
% for the dominant eigenvalue of

% A=( 14  0 -11  1 )
%   (  0  7   7 -2 )
%   (-11  7  21 -6 )
%   (  1 -2  -6  3 )

%    vT=[-0.43483, 1.0, -0.36878, 0.84127]
%    vT=[0.46064, -0.39511, 0.66667, 1.0]
%    There is no dominant eigenvalue for the given matrix.
%    vT=[0.43483, -1.0, 0.36878, -0.84127]
%    vT=[0.46064, -0.39511, 0.66667, 1.0]
%    vT=[0.63727, -0.30439, -1.0, 0.25285]
A = [14,0,-11,1;0,7,7,-2;-11,7,21,-6;1,-2,-6,3]
[U,V] = eig(A)
% dominant eigenvalue = largest in abs value:
v = U(:,4) 
%%
eigvalue = V(4,4)
eps = 1e-4

vT=[-0.43483, 1.0, -0.36878, 0.84127]';
all((A*vT - eigvalue*vT)< eps)
vT=[0.46064, -0.39511, 0.66667, 1.0]';
all((A*vT - eigvalue*vT)< eps)
vT=[0.43483, -1.0, 0.36878, -0.84127]';
all((A*vT - eigvalue*vT)< eps)
vT=[0.46064, -0.39511, 0.66667, 1.0]';
all((A*vT - eigvalue*vT)< eps)
vT=[0.63727, -0.30439, -1.0, 0.25285]';
all((A*vT - eigvalue*vT)< eps)

% correct ans: vT=[0.63727, −0.30439, −1.0, 0.25285]

%% Polulation exercise
% Consider a closed population of fish:
% the fish do not live past 3 years,
% in their first year they do not reproduce,
% in their second year they have on average 6 offsprings ,
% in their third year they have on average 8 offsprings.
% Both the one and two years old fish have 
% a survival rate of 50%.
% Create the corresponding Leslie-model. 
% and give a stable distribution of the ages.

%% Leslie-model = matrix describing the evolution of the population.

L = [0,6,8;0.5,0,0;0,0.5,0]
%% If the age distribution is an x vector, then (x1,x2,x3) is the
% current year's age distribution.
% And L*x will be next year's age distribution.
% A stable distribution is an x vector which does not change when multiplyed
% by L.
%%
[U,V] = eig(L)
%%
% 2 is the only positive eigen value.
% the eigenvector (normalized) corresponding to it:
x = U(:,1)
%% To get 1 as total, so it is a distribution
x = x/sum(x)
%%
x = L*x
x = x/sum(x)
%% PageRank - Look at the slides

%% Exercise
% Looking at four webpages we see the following links to each other.
% 
% The pages have equal weights at the beginning, which will be refined as
% follows: At each step the page k distributes its weight uniformly between
% pages that are linked from k 
% give a stable distribution of the weights!

%1. page:[2,3]
%2. page:[1]
%3. page:[4]
%4. page:[1,2,3]
% from this we get the following matrix:
A = [0,1,0,1/3;1/2,0,0,1/3;1/2,0,0,1/3;0,0,1,0]
%%
% We are looking for an x vector such that it satisfies: A*x = lambda*x
% with a given lambda
[U,V] = eig(A)
%% lambda = 1 is the only positive - get its eigenvetor
x = U(:,1)
%% 
% check:
A*x
%% Second type of question:
% Is the following v weight distribution stable?
v=[0.3077,0.2308,0.2308,0.2308]'

A*v


%% Power iteration - approximating the eigenvectors
% x_(k+1) = A*x_(k)/||A*x_(k)||
% Normalize to avoid overflow!



%% Cont. the fish population example
A = [0,6,8;0.5,0,0;0,0.5,0]
[U,V] = eig(A)
x = U(:,1)
%%
% starting population
x = [50,50,50]';

for i = 1:15
   x = A*x 
end
%%
% avoid overflow with normalization
x = [50,50,50]';

for i = 1:15
   x = (A*x);
   x = x/norm(x)
end
%% Power iteration to approximate the eigen value - Rayleigh-quotient
% J(lambda) = norm(A*v - lambda*v,2) 
% we search for lambda which minimizes this.
% it will be at lambda = (Av,v)/(v,v) (minimum of quadratic function).
% Power iteration:
% lambda_k = (Ax_k,x_k)/(x_k,x_k), 
% lambda_k will converge to the value.

%  x_15 vector's eigenvalue:
x
% dot product
lambda = dot(A*x,x)/dot(x,x)
% almost 2, the original eigenvalue

%% Exercise
% For the matrix A and the vector v 
% find the lambda value for which
% || A*v - lambda*v||_2 is as small as possible.
A = [3,-2,0;0,-3,2;3,-3,2];
v = [-3;-5;0];
lambda = dot(A*v,v)/dot(v,v)

%%
% For the matrix A and the vector v 
% find the lambda value for which
% || A*v - lambda*v||_2 is as small as possible.

A = [2,2,1,-2;0,-3,-2,2;1,3,-2,-1;-1,3,2,3];
v = [0;-1;1;-3];
lambda = dot(A*v,v)/dot(v,v)

%% Inverz-iteracio
% The power iteration used on the inverse of A.
% But instead of calculating this equation:
% x_(k+1) = inv(A)*x_k 
% We calculate the system of linear equations:
% A*x_(k+1) = x_k 
% The A matrix is the same in each iteration, 
% calculate the LU-decomposition beforehand.

A = [2,-2,3;1,1,1;1,3,-1];
[L,U] = lu(A);
x = [1,0,0]' % starting vector
for k = 1:50    
    x = U\(L\x);
    k
    lambda = dot(A*x,x)/dot(x,x)
end
