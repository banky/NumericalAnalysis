function [ x ] = GaussJacobi( a, b, x, CONVERGENCE_LIMIT )
% Uses Gauss Jacobi iteration method to solve for vector x
% Utilizes parallel computing for effiency :) 
% Here, a*x = b
n = size(a, 1);
finished = 0;

for i = 1:n
    if a(i,i) == 0
        fprintf('Matrix is not solvable\n');
        return
    end
end

while ~finished
    xUpdated = zeros(n,1);
    finished = 1;
    %TODO: Run this for loop in parallel
    parfor i = 1:n
        sum = 0;
        for j = 1:n
           if i == j
               continue
           end
           sum = sum + a(i,j)*x(j);
        end
        xUpdated(i) = (b(i)-sum)/a(i,i);
        % Check convergence
        
    end
    sum = 0;
    y = abs(x - xUpdated);
    for i=1:n
        sum = sum + y(i);
    end
    if sum > CONVERGENCE_LIMIT
       finished = 0;
    end
    x = xUpdated;
end

end

