%% Matlab vectors, matrices, built-in functions, operators

% Vector creation by enumerating its elements
a1 = [1,2,3,0.5,-2];

a2 = [1 2 3 0.5 -2];
%%
a1 == a2

empty_vector = [];

b1 = 1:5;
b2 = 5:-1:0;
b3 = 2:0.2:3;

c1 = linspace(1,2,10);
c2 = linspace(1,100); % default number of elements 100

% Column vectors
d1 = [-3;0;7];
d2 = [-3,0,7]';
d3 = transpose([-3,0,7]);

% constructing vectors from previously created vectors by concatenation

e1 = [a1, b1];
e2 = [d1;d2];
e3 = [1, a1, 3, -1];
e4 = [2; e2; d1];
e5 = e4(2:4);
e6 = e4([2,3,4]);
e6(2) = []; % delete the 6th element
e6([3, 7]) = []; % delete the 3rd and 7th element

% Add new element to an index which has not been included previously
% ex.
a = [-1,3,2];
a(6) = 4;
% solution is padded with zeros: a = [-1,3,2,0,0,4]

% Useful built-in functions
% documentation: help functionname
% ex.: 
help min
% Let x be an arbitrary vector 
x = 1:3:100;
min(x)
max(x)
sort(x)
sort(x,'descend')
flip(x)
length(x)
sum(x)
prod(x)
mean(x)
% indexing
x(3)
x(1:2)
x(4:end)
x(:)
x([2,3,8])

% Operations with same length vectors!
a = 1:10;
b = 10:-1:1;

a+b;
a-b;
x = a+1;
% 'Dotted' version to calculate element-wise
x = a.^2;
x = a.*b;
x = a./b;
x = 1./a;
dot(a,b);

%% Exercises
% Without enumeratig the elements create the vectors given on the slides!
a = 0:30;
b = 2:2:100;
c = 2:-0.1:0;
d = [0:3:30,-100,30:-3:0];
e = 1./[2:20];
f = [1:19]./[2:20];

% Let x be a given vector with 100 elements.
% Based on x, create y vector
y1 = flip(x);
y2 = x(1:5);
y3 = x;
y3(4) = [];
y4 = x;
y4([5,72,93])  =[];
y5 = x(1:2:end);
y6 = x([2,5,17,81]);


%%
% Without using a for loop, create y vector according to the formulas: 
x = linspace(1,10)

% x(i)+2
y = x+2
% x(i)^2
y = x.^2
% 1/x(i)
y = 1./x
% sin(x(i)^3-1)
y = sin(x.^3-1);

% x(i)-i


y = x - [1:length(x)];


%% Matrix

A = [1,2,3,4;5,6,7,8;9,10,11,12];
A = [1:4;5:8;9:12];

%%
x = [-1 4 0];
y = [3 -2 5];
A = [-3 1 -4; 6 2 -5];

z = [A';x]
%%
% Construct B matrix without enumeration:

% Omit the first row of A
B = A;
B(1,:) = [];
% Omit the 2nd and 4th columns of A
B = A;
B(:,[2,4]) = [];
% omit the last row and last column of A
B = A;
B(end,:) = [];
B(:,end) = [];
B(end,end) = [];
% Write A matrix twice next to itself
B = [A,A];
% transpose of A
B = A';
% switch the 2nd and 4th columns of A
B = A;
B(:,[2,4]) = B(:,[4,2]);
% get the square of the elements of A
B = A.^2;
% add 3 to every element of A
B = A +3;
% get the square roo of every element
B = sqrt(A);
% get sin of every element
B = sin(A);
% change the element of A at the first row and second column to -2
B  = A;
B(1,2)  = -2; 
% change the second row to [-1 0 -2 3 ] vector
B = A;
B(2,:) = [-1,0,-2,3];

% Create a matrix row by row:

A = [1:8;20:-2:6;2.^[1:8]];


%% Linear algebra built-in functions

det(A)
inv(A)
dot(A)
norm(A) % ,1, inf
x = A\b

help diag
help tril
help triu

%%

% Logical relations
% <, <=, >, >=, ==, ~= 
% A&B, A|B, ~A, xor(A,B)

% Logical functions
all()
any()

help find

logical()

% if -elseif - else end 
N=input('Give an integer: ');
if mod(N,3)==0
disp('It is divisible by 3');
elseif mod(N,3)==1
disp('Gives 1 as a remainder');
else
disp('Gives 2 as a remainder');
end
%%
% Commands 


% break
% continue
pause
pause(5)
% return
error('uzenet')
%%
% Legyen 
x = [0 -1 2 0 4 4]
y = [-1 -2 3 1 0 4]
% Check the following logical values
x == y
x <= y
x > y
x > 0
y <= 3
x | y
x & y


find(x == y)

find(x <= y)

%%
% Let a=rand(1,20), Create b, where it has all elements of a that are
% larger than 0.5

a = rand(1,20)
b = a(find(a>0.5))

%%
A = diag(1:5) + diag(3:3:9,-2);


B = triu(ones(5)*2) - 4*eye(5);
[A,B] = matrixokAB(8)
%%
% Write a function that will create a B matrix from a given matrix A, where
% az the end of every row we extend A with its mean of the row.
help mean
% mean by default calculates the column means of a matrix
A = diag(1:5) + diag(3:3:9,-2)
mean_of_matrix(A)

%B = [A,mean(A,2)]
% Write this in a new file!


function B = mean_of_matrix(A)
    B = [A, mean(A,2)];
end


