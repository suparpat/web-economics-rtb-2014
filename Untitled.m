file = fopen('data_training.txt');
line = fgets(file);
locs = [1,4,8,9,10,15,16,19,21,23];
the_matrix = [];
for count=1:80000
    thecell=strsplit(line,'\t');
 v = [];
    for i=1:size(locs,2)
        
        v = [v str2double(cell2mat(thecell(locs(i))))];
    end
    the_matrix = [the_matrix;v];
    line = fgets(file);
    %display(thecell);
end
the_matrix(any(isnan(the_matrix')),:) = [];
the_matrix(any(isinf(the_matrix)),:) = [];
    y = the_matrix(:,1);
   features = the_matrix(:,3:10);
 for i = 1:size(features, 2)
        meanVal = mean(features(:,i));
       features(:,i) = features(:,i) - meanVal;   
    end
    %do PCA
    covariance = (1/7) * features' * features;
    [V,D] = eig(covariance, 'nobalance');
    phi = V(:, 1:3);
    unlabelled_features = features * phi;
    clear features;


