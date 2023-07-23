A=[25 -35 20; -35 113 -44; 20 -44 84]
Chol(A)

%L
chol(A,"lower")

%LT
chol(A,'upper')

%Sum of diagonals
sum(diag(chol(A)))
