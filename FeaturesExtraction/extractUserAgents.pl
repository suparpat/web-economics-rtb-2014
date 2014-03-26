$file = 'data_training_sample.txt';
open(FILE, $file);
open(NEWFILE, '>useragents_extracted.txt');




$i = 1;
foreach $line(<FILE>){
	#print"$line \n";
	print "$i \n";
	$i++;
	@features = split('\t', $line);
		#do something with the features
	@extracted = ();
	push(@extracted, @features[5]);
	print  NEWFILE join(',', @extracted) . "\n";
}
foreach (@extracted){


	print("label: $_ \n");
}
close(FILE);
close(NEWFILE);
