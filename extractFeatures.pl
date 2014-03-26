$file = 'data_training_sample.txt';
open(FILE, $file);
open(NEWFILE, '>data_training_sample_extracted.txt');
foreach $line(<FILE>){
	#print"$line \n";
	@features = split('\t', $line);
		#do something with the features
	@extracted = ();
	push(@extracted, @features[0]);  #label		
	push(@extracted, @features[2]);  #timestamp	
	push(@extracted, @features[3]);	 #logtype	
	push(@extracted, @features[7]);	 #region
	push(@extracted, @features[8]);  #city
	push(@extracted, @features[9]);  #ad exchange
	no warnings;
	push(@extracted, hex(@features[10])/ (10 **30));  #domain
	push(@extracted, @features[14]);  #slot width
	push(@extracted, @features[15]);  #slot height
	print  NEWFILE join(',', @extracted) . "\n";

}
foreach (@extracted){


	print("label: $_ \n");
}
close(FILE);
close(NEWFILE);
