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

