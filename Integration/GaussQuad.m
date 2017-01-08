function [ I ] = GaussQuad( points,weights,coeff,a,b )
% Computes the integral of a polynomial function using Gauss Quadrature
% Params: points - Gauss points(abscissa)
%       : weights - Weights of each term
%       : coeff - Coefficients of polynomial
%       : a,b - Limits of the integral(a=lower limit)
% Return value: I - Integral

I = 0;
J = (b-a)/2;
for i=1:size(points,1)
    sum=0;
    for j=1:size(coeff,1)
        sum = sum + coeff(j,1)*(((b+a)/2)+((b-a)/2).*points(i,1)).^(j-1);
    end
    I = I+weights(i,1)*sum;
end

I = I*J;
end
