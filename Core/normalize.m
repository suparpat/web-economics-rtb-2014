function output = normalizeFeatures()


data = csvread('data_training_extracted.txt');
[rows, columns] = size(data);


%
%Precondition data using z-score normalization
%1. Compute the mean mu for each feature
%2. Compute the standard deviation sd for each feature
%3. Precondition the dataset using z-scores
%

mu = zeros(1, columns);
for(feature=1:columns)
    temp_mean = data(:,feature);
    mu(feature) = mean(temp_mean);
end

sd = zeros(1, columns);
for(feature = 1:columns)
    temp_sd = data(:,feature);
    sd(feature)=std2(temp_sd);
end

for(i=1:rows)
    for(feature=2:columns)
        if(feature~=3)
       data(i,feature) = (data(i,feature)-mu(feature))/sd(feature);
        end
    end
end
csvwrite('normalized_data_training_extracted.txt',data);
end

