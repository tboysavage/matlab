%In a rabbit population (considering only females) we have 3 age categories. We know the survival rates 𝑠 = (0.55,0.16,0.0) and the average reproduction rates: 𝑟 = (0.0,1.0,2.0). What is the stable distributoin for this population?
% Define the survival rates and average reproduction rates 
s = [0.55, 0.16, 0.0];
r = [0.0, 1.0, 2.0];
% Construct the Leslie matrix 
L = [r(1), r(2), r(3);
    s(1), 0, 0;
    0, s(2), 0];
% Do not modify code below
% Calculate the dominant eigenvalue and eigenvector 
[V, D] = eig(L);
eigenvalues = diag(D);
[~, index] = max(abs(eigenvalues)); 
dominant_eigenvalue = eigenvalues(index); 
stable_distribution = V(:, index);
% Normalize the stable distribution to sum to 1
stable_distribution = stable_distribution / sum(stable_distribution);
% Display the stable distribution 
stable_distribution
