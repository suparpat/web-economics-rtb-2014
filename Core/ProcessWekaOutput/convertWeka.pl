$file = 'pca_result';
open(FILE, $file);
open(NEWFILE, '>pcasubmission.csv');

print NEWFILE "Id,Prediction\n";
$count = 0;
foreach $line(<FILE>){
$line =~ s/^.*\?//g;
$line =~ s/\s*//g;
#print "$line\n";
print NEWFILE "$count,$line\n";
$count++;
}
close(FILE);
close(NEWFILE);

