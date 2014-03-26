%returns a k-dimensional output vector from the polynomial basis
function phi = phiVector(x, k)
phi = zeros(size(x,1),k*(size(x,2)));

for i = 1:size(x,1)
    for m = 1:size(x,2)
        for j = 1:k
            phi(i,j*m) =  x(i,m)^(j-1);
        end
    end
end
