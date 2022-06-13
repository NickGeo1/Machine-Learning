% Create (scalar) variable 'a' and store the value 2.3 into it. For this first problem, the correct solution is shown below
a = 2.3;

% Create a 1x4 row vector 'v' with the elements 6, 2, 9, and 11, in this order
v = [6, 2, 9, 11]

% Create a 50x1 column vector 'w' with the elements from 1 to 50 in the increasing order
w = [1:50]'

% Create a 3x4 matrix 'X' with elements i*j at the row index i=1,2,3; and column index j=1,...,4
temp = zeros(3,4);
for i = 1:3
    for j = 1:4
        temp(i,j)=i*j;
    end
end
X = temp

% Using matrix indexing, pick the element of X at the row index 2, and column index 3 into a new variable named x_2_3
x_2_3 = X(2,3)

% Using matrix indexing, take the entire first row of X, and store it as the vector called x1
x1 = X(1,:)

% Using matrix indexing, take the entire second column of X, and store it as the vector called x2
x2 = X(:,2)

% Using matrix indexing, take the submatrix consisting of the elements in the first and seconds rows and columns, and store it as the matrix Xs
Xs = X(1:2,1:2)

% Calculate the vector 'u' as the product of the matrix X and the transpose of the vector v.
u = X*v'

% Add a constant value 2 to all the elements of w and store the result as the vector called 'w2'
w2 = w + 2

% Multiply all the elements of the matrix X by 3, and store the result as the matrix called 'X3'
X3 = X*3

% Raise all the elements of X3 into power 5, and store the result as the matrix called 'Y'
Y = X3.^5

% Create a 33x1 column vector 'z' of all zeros 
z = zeros(33,1)

% Concatenate the vector w and z vertically in this order and store it as the new 83x1 vector 'wz'
wz = [w; z]

% Create a 1x10 row vector 'b' of all ones
b = ones(1,10)

% Concatenate the vector v, b, and v horizontally, in this order, to create the new vector called 'vbv'
vbv = [v b v]

% Compute the matrix product of transpose of X and Y and store it as the new matrix called 'Z'
Z = X'*Y

% Compute the sin() function for each element of the matrix X, and store the results as the new matrix 'SX'
SX = sin(X)