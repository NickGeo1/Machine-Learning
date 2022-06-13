A = load('3class_data.csv');

% Form the feature matrix starting from the first row upto second last
X = A(1:end-1,:)'

% Form the class column vector from the last row in the data
y = A(end,:)'

% Number of classes
C = 3;

% Trained weights for the 3 One-versus-all classifiers
W = [ -0.0740   -0.7898    0.6134;
      -0.7304    0.9433    0.3319;
       0.4118   -0.0995   -0.9950 ];

% Predict the classes 
c = classifyMultiClass( W, X );

% Plot the result (not mandatory, but beneficial)
figure
scatter( X(:,1), X(:,2), 25, y, 'filled' )
hold on
scatter( X(:,1), X(:,2), 60, c )
axis([0 1 0 1])
xlabel('x_1')
ylabel('x_2')
legend('true class', 'predicted class')


function c = classifyMultiClass( W, X )
    % IMPLEMENT FUNCTION BODY
    % add ones at X
    X = [ones(size(X,1),1) X]
    %Caclulate the matrix that contains the distances between points and
    %classifier lines. Each row i and column j contains the distance between
    %the ith point from the jth line
    Y = X*W'
    [val,idx]= max(Y') %transpose Y to get the max of each row(we make the rows cols)
    c = (idx-1)' %return on a column with the indeces of the max values - 1(class labels)
end
