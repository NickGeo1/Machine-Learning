% Load the data from 'regression_outliers.csv' using the load function
A = load('regression_outliers.csv');

% Load the weights from 'problem1.mat' using the load function
W = load('problem1.mat');
w_LS = W.w_LS;
w_LAD = W.w_LAD;

P = numel(A(1,:)); %number of input data points
% Construct the Least Squares cost function
cost_LS = @(w) (1/P)*sum(finddiffs(w,A).^2);  % Complete the anonymous function

% Construct the Least Absolute Deviations cost function
cost_LAD = @(w) (1/P)*sum(abs(finddiffs(w,A))); % Complete the anonymous function

% Compute the LS cost on weights w_LS and w_LAD
cost_LS_wLS = cost_LS(w_LS); % Evaluate cost_LS at w_LS
cost_LS_wLAD = cost_LS(w_LAD);  % Evaluate cost_LS at w_LAD

% Compute the LAD cost on weights w_LS and w_LAD
cost_LAD_wLS = cost_LAD(w_LS); % Evaluate cost_LAD at w_LS
cost_LAD_wLAD = cost_LAD(w_LAD); % Evaluate cost_LAD at w_LAD

% Create 100 evenly spaced grid of points between -2 and 2 (inclusive) for model evaluation and plotting. Create a column vector
x = (linspace(-2,2,100))'; % [-2.0000;   -1.9596;   -1.9192; ...; 2.0000]
    
% Evaluate the LS model at x, i.e. use w_LS to calculate output at the points in x. Create a column vector of results
y_LS = w_LS(1) + x*w_LS(2);

% Evaluate the LAD model at x, i.e. use w_LAD to calculate output at the points in x.  Create a column vector of results
y_LAD = w_LAD(1) + x*w_LAD(2);

% Plot the result
figure
scatter( A(1,:), A(2,:) )
hold on
plot( x, y_LS )
plot( x, y_LAD, '--' )
legend('data','Least Squares', 'Least Absolute Deviations','Location','NorthWest')
axis([-2 2 -5 12 ])
xlabel('x')
ylabel('y')

function diffs = finddiffs(w,A)
    diffs = [];
    for i = 1:numel(A(1,:))
        diffs = [diffs [1 A(1,i)]*w - A(2,i)];
    end
end
