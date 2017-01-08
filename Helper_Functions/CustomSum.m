function [ sum ] = CustomSum(x,y, order, isOneVar)
% Performs sums that require higher orders. Used for regression
% order: Order to raise x to
% isOneVar: if true, sum only x

    vecSize = size(x,1);
    sum = 0;
    if isOneVar
        for i=1:vecSize
            sum = sum + x(i,1).^order;
        end
    else
        for i=1:vecSize
            sum = sum + y(i,1) * x(i,1).^order;
        end
    end
end
