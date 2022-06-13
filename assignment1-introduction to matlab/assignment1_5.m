% Generate multivariate Gaussian data with mean [1,1] and covariance [1 0.5; 0.5 1] for class 1
X1 = mvnrnd([1,1] , [1 0.5; 0.5 1], 100);

% Generate multivariate Gaussian data with mean [3,1] and covariance [3 0; 0 0.1] for class 2
X2 = mvnrnd([3,1] , [3 0; 0 0.1], 100);

% Open a new figure window and store the handle to it (here for checking the result)
h_fig1 = figure(1);

% CREATE THE PLOT AS INSTRUCTED ABOVE! TYPICAL SOLUTION STEPS ARE GIVEN IN THE COMMENTS BELOW:

% First, use the function scatter to plot the data in X1. Specify correct marker sizes and colors!
scatter(X1(:,1),X1(:,2),7,"blue")
% Then, use the function scatter to plot the data in X2 without erasing the previous plot. Specify correct marker sizes and colors!
hold
scatter(X2(:,1),X2(:,2),7,"red")

% Set the axis limits
%xlim([-5,10])
%ylim([-3, 7])
axis([-5,10,-3,7])

% Set the axis labels
xlabel("Feature 1")
ylabel("Feature 2")

% Set the title
title('Two class scatter plot')

% Set the legend
legend('Class 1','Class 2')
