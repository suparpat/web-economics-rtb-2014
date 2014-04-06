$file = 'data_test.txt';
open(FILE, $file);
open(NEWFILE, '>data_test_questionmark.txt');

foreach $line(<FILE>){

$line = "?\t" . $line;
	print  NEWFILE $line;

}

close(FILE);
close(NEWFILE);
