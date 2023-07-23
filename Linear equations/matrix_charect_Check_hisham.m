% Define the matrix A and vector b
A = [1 0 2; 0 1 -2; 0 0 0]; % Define your matrix A here
b = [0 0 1]'; % Define your vector b here
%for invertible,linear dependent. 1= true,0 false
%for Ax=b solutions -1 means inf'

%Do not modify below
num_unknowns= size(A,2);
% Calculate the determinant of A
det_A = det(A);

% Calculate the rank of A
rank_A = rank(A);

% Check if A is invertible
is_invertible = (det_A ~= 0);

% Solve the linear system Ax = 0
null_space = null(A);
num_null_space_columns = num_unknowns - rank_A;  % Number of columns in the null space

num_solutions_0 = 2^num_null_space_columns;  % Number of solutions for Ax = 0

% Check if the columns of A form a linearly independent system
is_linearly_independent = (num_null_space_columns == 0);

% Augment A with b to form the augmented matrix [A, b]
augmented_matrix = [A, b];

% Calculate the rank of the augmented matrix [A, b]
rank_augmented = rank(augmented_matrix);

% Determine the number of solutions for Ax = b

if rank_A == rank_augmented
    if rank_A == num_unknowns
        num_solutions = 1;
    else
        num_solutions = -1;
    end
else
    num_solutions = 0;
end
% Calculate the first element of transpose(A) * b
first_element = A' * b;
first_dc = b'*A';
first_element2=b'*A
% Display the results
disp(['Determinant of A: ' num2str(det_A)]);
disp(['Rank of A: ' num2str(rank_A)]);

disp(['Is A invertible? ' num2str(is_invertible)]);
disp(['Number of solutions for Ax = 0: ' num2str(num_solutions_0)]);
disp(['Columns of A form a linearly independent system? ' num2str(is_linearly_independent)]);
disp(['Number of solutions for Ax = b: ' num2str(num_solutions)]);
disp(['First element of transpose(A) * b: ' num2str(first_element(1)) ]);
disp(['First element of transpose(b) * transpose(A): ' num2str(first_dc(1)) ]);
disp(['First element of transpose(b) * A: ' num2str(first_element2(1)) ]);

