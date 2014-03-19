function rtn = msePoly(xTraining, xTest, yTraining, yTest, k)
phi = phiVector(xTraining, k);
coefs = phi \ yTraining;
error = 0;
for i = 1:size(yTest,1)
    
    %calculate y(learned) at the point of  actual y
    yPred = 0;
    for j = 1:size(coefs,1)
        yPred = yPred + coefs(j)*xTest(i)^(j-1);
    end
    error = error + (yPred - yTest(i))^2;
    
    
end

rtn = (error/size(yTest,1))^0.5;
