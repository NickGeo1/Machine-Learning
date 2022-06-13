            %%%% DIFFERENCE BETWEEN FUNCTION OF MATRICES%%%%

% IF f = @(x,y) (x+y)^2 THEN x,y can be scalar or matrices that can be
% multiplied and added:

%f([1 2],[1,2;1,2]) --> x = [1 2], y = [1,2;1,2] and we get [12 24; 12 24]

% IF f = @(x,y) (x+y).^2 THEN x,y can be matrices with the x vals and y
% vals

%f([1 2],[1,2]) --> (x1,y1) = [1 1], (x2,y2) = [2,2] and we get [4 16]


% The function to be minimized
f = @(w) w(:,1).^2 + w(:,2).^2 + 2;

% Starting point for the descent
x0 = [3 4];

% Upper limit of iterations
MAX_ITER = 10;

% Call the coordinateSearch function
[g_min, w_min, g_history, w_history] = coordinateSearch( f, x0, MAX_ITER )

% Plot the result (not mandatory, but beneficial)
figure
plot( g_history )
title('Cost history')
xlabel('Iteration number')
ylabel('Cost (g(w))')


function [g_min, w_min, g_history, w_history] = coordinateSearch( g, w0, max_iter )

    % Dimension of the problem
    N = 2

    % Standard basis in both directions (+ and -). These are the possible step directions of coordinate search
    B = [ eye(N); -eye(N) ]; % eye is N*N identity matrix

    % Initial point and the function value at it. These are the estimates of the minimum, updated at each iteration.
    w_min = w0
    g_min = g(w0)
    
    % Initialize search history, if requested
    if nargout > 2 %number of output arguments
        w_history = [w_min];
        g_history = [g_min];
    end
    
    % Perform coordinate descent
    for i = 1:max_iter
        
        % Make (unit) steps into all search directions from w_min at once
        %w_candidates = [w_min + B(1,:); w_min + B(2,:); w_min + B(3,:); w_min + B(4,:)]
        w_candidates = w_min + B
        
        % Compute function values at all the seach points at once
        g_candidates = g(w_candidates)
        
        % Find the best direction based on the function values at the candidate points. The index of the best value corresponds to the best direction in B
        min_ind = find(g_candidates == min(g_candidates));
        
        %for random choice when we have multiple minimum ways
        %r = rand(1)*numel(min_ind) %in case we get multiple minimum value indexes, we choose a random one
        %min_ind = min_ind(ceil(r)); %for example, if we have 2 minimum value indexes we choose a random number x in [0,2] and we take the ceil(x) index\

        [best_val, best_ind] = deal(min(g_candidates), min_ind(1))
        
        g_min = best_val
        w_min = w_candidates(best_ind,:)

        if nargout > 2  % Store history if requested           
            g_history = [g_history; g_min];
            w_history = [w_history; w_min];
        end
        
    end
    
end

