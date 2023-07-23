%L32=row3 column2
L=[1 0 0;-4 1 0;-3 1 1]
U=[-4 2 1;0 3 4;0 0 -3]
b=[-18 74 50]'
y = linsolve(L, b);
x = linsolve(U, y);
%      https://www.emathhelp.net/en/calculators/linear-algebra/lu-decomposition-calculator/