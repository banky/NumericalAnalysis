function [x] = GaussSeidel(a, b, x, CONVERGENCE_LIMIT)
    % Uses Gauss seidel iteration method to solve for vector x
    % Here, a*x = b
    n = size(a, 1);
    finished = 0;
    y = zeros(n, 1);
    
    for i = 1:n
        if a(i,i) == 0
            fprintf('Matrix is not solvable\n');
            return
        end
    end
    
    while ~finished
        finished = 1;
        for i = 1:n
           y(i) = b(i)/a(i, i);
           prevX = x(i);
           for j = 1:n
               if i == j
                   continue
               end
               y(i) = y(i) - ((a(i, j)/a(i, i)) * x(j));
               x(i) = y(i);
           end
           % Check convergence
           if abs(x(i) - prevX) > CONVERGENCE_LIMIT
               finished = 0;
           end
        end
    end
end