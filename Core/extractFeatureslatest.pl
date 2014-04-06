$file = 'data_clicked.txt';
open(FILE, $file);
open(NEWFILE, '>data_clicked_extract.txt');

$useragents = 'processed_useragents_extracted.txt';
open(USERAGENTS, $useragents);
$line_count = 0;
@useragents_line = <USERAGENTS>;

foreach $line(<FILE>){
	#print"$line \n";
	@features = split('\t', $line);
		#do something with the features
	@extracted = ();
	push(@extracted, @features[0]);  #label		
	push(@extracted, substr @features[2], 8, 4);  #timestamp	
	push(@extracted, @features[3]);	 #logtype	
	$temp = $useragents_line[$line_count];
	$temp =~ s/\r|\n//g;
	push(@extracted, $temp);		 #useragent
	$line_count++;

	push(@extracted, @features[7]);	 #region
	push(@extracted, @features[8]);  #city
	push(@extracted, @features[9]);  #ad exchange
	no warnings;
	push(@extracted, hex(@features[10])/ (10 **30));  #domain
	push(@extracted, @features[14]);  #slot width
	push(@extracted, @features[15]);  #slot height
	$slot_visibility = @features[16];
	$slot_visibility_score;
	if ($slot_visibility == 'Na') {
		$slot_visibility_score = 0;
	} 
	if ($slot_visibility == 'FirstView') {
		$slot_visibility_score = 1;
	} 
	if ($slot_visibility == 'SecondView') {
		$slot_visibility_score = 2;
	} 
	if ($slot_visibility == 'ThirdView') {
		$slot_visibility_score = 3;
	} 
	if ($slot_visibility == 'FourthView') {
		$slot_visibility_score = 4;
	} 
	if ($slot_visibility == 'FifthView') {
		$slot_visibility_score = 5;
	} 
	if ($slot_visibility == 'SixthView') {
		$slot_visibility_score = 6;
	} 
	if ($slot_visibility == 'SeventhView') {
		$slot_visibility_score = 7;
	} 
	if ($slot_visibility == 'EighthView') {
		$slot_visibility_score = 8;
	} 
	if ($slot_visibility == 'NinthView') {
		$slot_visibility_score = 9;
	} 
	if ($slot_visibility == 'TenthView') {
		$slot_visibility_score = 10;
	} 
	if ($slot_visibility == 'OtherView') {
		$slot_visibility_score = 11;
	} 
	push(@extracted, $slot_visibility_score); #ad_slot_visibility
	$slot_position = @features[17];
	$slot_position_score;
	if ($slot_position == 'Na') {
		$slot_position_score = 0;
	} 
	if ($slot_position == 'Fixed') {
		$slot_position_score = 1;
	} 
	if ($slot_position == 'Pop') {
		$slot_position_score = 2;
	} 
	if ($slot_position == 'Background') {
		$slot_position_score = 3;
	} 
	if ($slot_position == 'Float') {
		$slot_position_score = 4;
	} 
	push(@extracted, $slot_position_score); #ad_position
	push(@extracted, @features[18]);  #floor price
	push(@extracted,@features[20]);  #bidding price
	push(@extracted,@features[22]);  #advertiser id
	print  NEWFILE join(',', @extracted) . "\n";

}
foreach (@extracted){


	print("label: $_ \n");
}
close(FILE);
close(NEWFILE);
