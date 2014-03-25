$file = 'data_training_sample.txt';
open(FILE, $file);
open(NEWFILE, '>data_training_sample_extracted.txt');
foreach $line(<FILE>){
	#print"$line \n";
	@features = split('\t', $line);
		#do something with the features
	@extracted = ();
	push(@extracted, @features[0]);  #label		
	push(@extracted, hex(@features[1])); 
	push(@extracted, @features[2]);
	push(@extracted, @features[4]);		
	push(@extracted, @features[6]);
	push(@extracted, @features[7]);
	push(@extracted, @features[8]);
	print  NEWFILE join(',', @extracted) . "\n";

}
foreach (@extracted){


	print("label: $_ \n");
}
close(FILE);
close(NEWFILE);
