x_training = the_matrix(1:40000, 2:10);
x_test = the_matrix(40001:49000, 2:10);
y_training = the_matrix(1:40000, 1);
y_test = the_matrix(40001:49000, 1);
errors = [];
for i = 2:18
    errors = [errors; msePoly(x_training, x_test, y_training, y_test, i)];
    
end