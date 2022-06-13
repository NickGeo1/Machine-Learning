fib(4)
function s = fib(n)

    % COMMENTS BELOW SHOW TYPICAL STEPS YOU MIGHT TAKE IN YOUR SOLUTION
    if n<0
        s=[];
        disp('You must provide a positive integer number')
        return
    end
    % 1. Initialize correct size return variable vector for speed
    s = zeros(1,n);
    % 2. First element initialization
    if n>=1
        s(1) = 0;
    end
    % 3. Second element initialization
    if n>=2
        s(2) = 1;
    end
    % 4. Fill in the remaining elements
    for i=3:n
        s(i) = s(i-1) + s(i-2);
    end
end