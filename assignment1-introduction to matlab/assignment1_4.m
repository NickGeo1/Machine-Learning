% Find numerically the minimum location of function sin() over the interval ]0.5, 1[ using the fminbnd function
sin_min = fminbnd(@sin, 0.5, 1)

% Create a function computing x^2 + 1 (elementwise) of the input array elements using the anonymous function syntax, and store the handle to variable 'f'
% Take care the your function works also on vector/matrix inputs x instead of just scalar values
f = @(x) x.^2 + 1

% Integrate numerically the function f(x) specified above over the interval [-1  1] using function integral. Store the result into variable f_int
f_int = integral(f,-1,1)


