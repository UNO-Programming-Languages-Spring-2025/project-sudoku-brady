% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...

% Defining the grid
row(1..4).
col(1..4).
num(1..4).

% Each cell must have exactly one number
1 {sudoku(R, C, N) : num(N)} 1 :- row(R), col(C).

% Each row must contain all numbers without duplicates
1 {sudoku(R, C, N) : col(C)} 1 :- row(R), num(N).

% Each column must contain all numbers without duplicates
1 {sudoku(R, C, N) : row(R)} 1 :- col(C), num(N).

% Enforce given initial values from the instance file
sudoku(R, C, N) :- initial(R, C, N).

% Prevent overriding initial values
:- initial(R, C, N), not sudoku(R, C, N).

#show sudoku/3.
