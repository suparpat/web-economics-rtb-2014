%returns a k-dimensional output vector from the polynomial basis
function phi = phiVector(x, k)
phi = zeros(size(x,1),k);
for i = 1:size(x,1)
    for j = 1:k
        phi(i,j) =  x(i)^(j-1);
    end
end
