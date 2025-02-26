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

% Defining the subgrid
subgrid(X, Y, G) :- G = 1 + (((X-1)/2)*2 + ((Y-1)/2)), row(X), col(Y).

% Each cell must have exactly one number
1 {sudoku(R, C, N) : num(N)} 1 :- row(R), col(C).

% Each row must contain all numbers without duplicates
1 {sudoku(R, C, N) : col(C)} 1 :- row(R), num(N).

% Each column must contain all numbers without duplicates
1 {sudoku(R, C, N) : row(R)} 1 :- col(C), num(N).

% Each subgrid must contain each number exactly once
:- num(N), subgrid(R1, C1, G), subgrid(R2, C2, G), R1 != R2, C1 != C2, sudoku(R1, C1, N), sudoku(R2, C2, N).

% Enforce given initial values from the instance file
sudoku(R, C, N) :- initial(R, C, N).

% Prevent overriding initial values
:- initial(R, C, N), not sudoku(R, C, N).

#show sudoku/3.