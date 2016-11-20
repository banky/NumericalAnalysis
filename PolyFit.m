function [ ypol, coeff ] = PolyFit( x,y,order )
% Uses linear regression to fit a polynomial to a curve
% Warning: High orders may cause ill conditioned matrices
% ypol: The fitted polynomial
% coeff: A vector containing the coefficients of ypol

    if size(x,2) > size(x,1)
        x = x';
        y = y';
    end

    n = size(x,1);
    a = zeros(order+1);
    for i=1:order+1
        for j=1:order+1
            if (i == 1 && j == 1)
                a(i,j) = n;
            else
                a(i,j) = CustomSum(x,y,i+j-2,1);
            end
        end
    end

    b = zeros(order+1,1);
    for i=1:order+1
        b(i,1) = CustomSum(x,y,i-1,0);
    end

    coeff = a\b;

    ypol = 0;
    for i=1:order+1
        ypol = ypol + coeff(i)*(   x.^(i-1)   );
    end

end

