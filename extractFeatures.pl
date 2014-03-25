$file = 'data_training_sample.txt';
open(FILE, $file);
foreach $line(<FILE>){
	print"I am reading a line \n";


}
close(<FILE>);
