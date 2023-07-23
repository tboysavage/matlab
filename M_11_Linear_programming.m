%% Linear programming
% 1. exercise
% Solve the following problem with a graphical method!

% A furinture factory manufactures two different furnitures: 
% cabinets and  dressers.
% To manufacture a cabinet they need 2 units of wood, 1 unit of paint and 1
% unit of glass. For a dresser they need 1 unit of wood and 1 unit of
% paint. A cabinet can be sold for 30 000 HUF, the dresser can be sold for
% 20 000 HUF. Find the optimal strategy of manufactoring for maximal
% profit, if they only have 100 units of wood, 80 units of paint and 40
% units of glass.


% Create the model!
% Draw a figure to help check the solution!
figure
hold on
fplot(@(x) 100-2*x)
fplot(@(x) 80-x)
%xline(40) % vertical line
plot([40,40],[0,100]) % vertical line created with two points
%%
for z=0:10:100
    fplot(@(x) z-3/2*x,'r:' )
end
%%
axis([0,100,0,100])


%%
c = [-30000;-20000];
A = [2,1;1,1;1,0];
b = [100;80;40];
Aeq = [];
beq = [];
lb = [0;0];
ub = [];
x = linprog(c,A,b,Aeq,beq,lb,ub)

%%
plot(x(1),x(2),'r*')

%% Solve the following linear problem based on the model:
% P(x) = 4*x1 + 3*x2 -> max
% x1 + x2 < = 40
% 2*x1 + x2 < = 60
% x1, x2 > = 0

% What is the optimal value of x2?

x = linprog([-4;-3],[1,1;2,1],[40;60],[],[],[0;0],[])
x(2)

%%
% Solve the following problem with a graphical method!

% A sweets shop creates two different types of ice-cream:
% vanilla and stracciatella.
% For a tub of vanilla ice-cream they need 20 units of sugar and 50 units
% of cream, for a tub of stracciatella ice-cream they need 40 units of
% sugar and 20 units of cream and 2 units of chocolate. The stracciatella
% tub can be sold at a 300 HUF/ tub price, the vanilla only at 190 HUF/tub
% price, and the cost of manufactoring them is 100 HUF/tub for the
% stracciatella and 90 HUF/tub for the vanilla.
% Calculate the optimal ratio of manufactoring to maximize the profit, 
% if they only have  280 units of sugar and 300 units of cream and 12 units of chocolate!


% Create the model!
% P(x) = 100x1+200x2->max
% 20x1+40x2<=280
% 50x1+20x2<=300
% 2x2<=12

% Create a figure!
figure
hold on
fplot(@(x) (280-20*x)/40)
fplot(@(x) (300-50*x)/20)
fplot(@(x) 6) % horizontal line = constant function
%%
for z=0:1:30
    fplot(@(x) z-100/200*x,'r:' )
end
axis([0,30,0,30])


%%
c = [-100;-200];
A = [20,40;50,20;0,2];
b = [280;300;12];
Aeq = [];
beq = [];
lb = [0;0];
ub = [];
x = linprog(c,A,b,Aeq,beq,lb,ub)

%%
plot(x(1),x(2),'r*')
