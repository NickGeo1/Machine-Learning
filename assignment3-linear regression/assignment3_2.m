% Load the data set into matrix A from 'student_debt_data.csv' using the load function
A = load('student_debt_data.csv')

% Construct the design matrix X with augmented ones
X = [ones(numel(A(:,1)),1) A(:,1)]

% Construct the expected outcome vector y
y = A(:,2)

% Solve the weights using Pseudoinverse
w = pinv(X)*y

% Use the model to extrapolate year 2030 debt
y2030 = w(1) + w(2)*2030
