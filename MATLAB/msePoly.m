function rtn = msePoly(xTraining, xTest, yTraining, yTest, k)
original_size = size(xTraining,2);
phi = phiVector(xTraining, k);
phiTest = phiVector(xTest,k);
coefs = phi \ yTraining;
error = 0;
for i = 1:size(yTest,1)
    
    %calculate y(learned) at the point of  actual y
    yPred = 0;
    for j = 1:k
        for m = 1:original_size
            address = (j-1)*original_size + m;
            yPred = yPred + coefs(address)*xTest(i, m)^(j-1);
        end
    end
    if(yTest(i) == 1)
        blabalbla = 4;
        
    end
    error = error + (yPred - yTest(i))^2;
    
    
end

rtn = (error/size(yTest,1))^0.5;
