
%makes a symbolic function of the x^i polymonial basis.
%coefs - column vector of coefficients in ascending order

function symFunct = makeSymFunction(coefs)
symFunct = num2str(coefs(1));

for i = 2:size(coefs,1)
    symFunct = strcat(symFunct, ' + ',num2str(coefs(i)),'.*x^',num2str(i-1));
end
