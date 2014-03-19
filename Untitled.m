file = fopen('data_training.txt');
line = fgets(file);
locs = [1,4,8,9,10,15,16,19,21,23];
the_matrix = [];
for(count=1:10000)
    thecell=strsplit(line,'\t');
 v = [];
    for i=1:size(locs,2)
        v = [v str2double(cell2mat(thecell(locs(i))))];
    end
    the_matrix = [the_matrix;v];
    line = fgets(file);
    %display(thecell);
end
the_matrix(~any(isnan(the_matrix),2),:);
the_matrix(~any(isinf(the_matrix),2),:);
    y = the_matrix(:,1);
   features = the_matrix(:,2:10);
 %for i = 1:size(features, 2)
  %      meanVal = mean(features(:,i));
  %     features(:,i) = features(:,i) - meanVal;   
  %  end
    %do PCA
    covariance = (1/8) * features' * features;
    [V,D] = eig(covariance, 'nobalance');
    phi = V(:, 1:2);
    unlabelled_features = features * phi;
    clear features;


