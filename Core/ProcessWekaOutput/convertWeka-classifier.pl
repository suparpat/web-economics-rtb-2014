$file = 'RandomTreeResults';
open(FILE, $file);
open(NEWFILE, '>RandomTreeSubmission.csv');
print NEWFILE "Id,Prediction\n";
$count = 0;

foreach $line(<FILE>){
	@features = split(',', $line);
	$temp = 0;
if(@features[2]=='1:0'){
$temp = 0;
}
else{

$temp = 0+@features[4];

}

	print NEWFILE "$count,$temp\n";
$count++;
}

close(FILE);
close(NEWFILE);
