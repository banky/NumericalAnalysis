function [ L,U ] = LUDecomp( a )
% Decomposes a matrix using LU decomposition

n = size(a,1);
L = zeros(n);
U = diag(ones(n,1));

for iterator=1:n
    j = iterator;
    for i=iterator:n
        sum = 0;
        for k=1:j-1
            sum = sum + L(i,k)*U(k,j);
        end
        L(i,j) = a(i,j)-sum;
    end
    
    i = iterator;
    for j=iterator+1:n
        sum=0;
        for k=1:i-1
            sum = sum + L(i,k)*U(k,j);
        end
        U(i,j) = (a(i,j) - sum)/L(i,i);
    end
end

end

