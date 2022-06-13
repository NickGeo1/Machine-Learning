% Load the data from the file '2d_classification_data_v1_entropy.csv' using the load function
A = load('2d_classification_data_v1_entropy.csv')

% Initialize problem variables using the matrix A
P = numel(A(1,:))            % Number of samples
x =  A(1,:)'           % Sample x-values as a column vector
y =  A(2,:)'          % Sample y-values (the class 0 or 1) as a column vector

% Define the step function, for t=0 return 1. Return value in the same data type as t or a double
step = @(t) getstep(t); % IMPLEMENT THE ANONONYMOUS FUNCTION

% We add ones at x inside function.X can be a matrix, so we add a column with as many ones as the matrice's rows
% Define the step model function using the step function
model_step = @(x,w) step([ones(numel(x(:,1)),1) x]*w')   % IMPLEMENT THE ANONONYMOUS FUNCTION

% Define the step cost function using the model_step
cost_step_LS = @(w) ((1/P)*sum((model_step(x,w)-y).^2))';     % IMPLEMENT THE ANONONYMOUS FUNCTION

% Define the sigmoid function
sigmoid = @(x) 1./(1+exp(-x));         % IMPLEMENT THE ANONONYMOUS FUNCTION

% We add ones at x inside function.X can be a matrix, so we add a column with as many ones as the matrice's rows
% Define the Logistic regression model using sigmoid function
model_logit = @(x,w) sigmoid([ones(numel(x(:,1)),1) x]*w');   % IMPLEMENT THE ANONONYMOUS FUNCTION

% Define the Logistic regression Least Squares cost function
cost_logit_LS = @(w) ((1/P)*sum((model_logit(x,w)-y).^2))';   % IMPLEMENT THE ANONONYMOUS FUNCTION

% Define the Logistic regression Cross-Entropy cost function
cost_logit_CE = @(w) (-(1/P)*sum(y.*log(model_logit(x,w)) + (1 - y).*log(1 - model_logit(x,w))))';   % IMPLEMENT THE ANONONYMOUS FUNCTION


% Plot the result (not mandatory, but beneficial)

% Initialíze a regular rectangular 2D grid of points to evaluate the cost functions on
% Create 100 equidistantly spaced samples from -20 to +20 (limits inclusive)
w_range = linspace(-20,20,100);
% Use 'w_range' to construct a 2D mesh using the meshgrid function
[XX,YY] = meshgrid( w_range );

% (Almost) optimally picked weights
w_opt = [ -10.38 10.03 ];
% (Clearly) unoptimally picked weights
w_unopt = [ -1.5 2 ];
% Range of x-values from -1 to 6; to evaluate the model outputs
x_range = linspace(-1,6,100)';

% Plot data together with both the optimal and unoptimal step and logit models 
figure
scatter( A(1,:), A(2,:) )
axis([-1 5 -1 2])
hold on
plot( x_range, model_step( x_range, w_opt ) )
plot( x_range, model_logit( x_range, w_opt ) )
plot( x_range, model_step( x_range, w_unopt ), '--' )
plot( x_range, model_logit( x_range, w_unopt ), '--' )
xlabel('x')
legend('Data', 'Step opt.', 'Logit opt.', 'Step unopt.', 'Logit unopt.' )
title('Classification regression problem')

% Plot the cost function surfaces in 3D
cost_functions = { cost_step_LS, cost_logit_LS, cost_logit_CE };
cost_function_names = { 'Step LS cost', 'Logit LS cost', 'Logit CE cost' };
M = length( cost_functions );
v = [-152 42];
figure
for i = 1:M
    subplot(M,1,i)
    surface(XX,YY, arrayfun( @(x,y) cost_functions{i}( [x y] ), XX, YY ) )
    view(v)
    xlabel('w_0')
    ylabel('w_1')
	zlabel('cost')
    title( cost_function_names{i} )
end

function gstep = getstep(t)
    t(t>=0) = 1;
    t(t<0) = 0;
    gstep = t;
end
