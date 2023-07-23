%A calculator company produces a plain scientific calculator. Long term
%projections indicate an expeced demand of at least 108 scientific
%calculators and 72 graphing calculators each day. Because of limitations
%on production capacity, no more than 192 scientific and 161 graphing
%calculators can be made daily. To satisfy a shipping contract of at least
%301 calculators must be shipped each day. if each scientific calculator
%sold results in a 2 gold unit loss, but each graphing calculator produces
%3 unit gold profit, How many of each type should be made daily to maximize
%the net profit
%The optimal amount of calculators:?
%The optimal amount of graphing calculators:?
%Max net profit:?

% Define the constraint matrix Aeq and RHS vector beq
% x + y = 301
Aeq = [1 1];
beq = [308];
% Define the coefficient vector c
c = [-2; 6];
% Define the lower bounds lb and upper bounds ub
lb = [106; 76];
ub = [193; 162];
% Solve the linear programming problem
[x, fval] = linprog(-c, [], [], Aeq, beq, lb, ub);
max_x=x(1)
max_y=x(2)
maximum_profit= -fval