#!/usr/bin/perl -w
$|=1;

@a=('yes','no');

open(INPUT2,"./alert_fast2.csv");
@content2=<INPUT2>;
chomp(@content2);
close(INPUT2);

open(OUTPUT,">./alert_fast2.csv");
foreach $each_line2 (@content2){
	$item = $a[ rand @a ];
	$each_line2=$each_line2.",".$item;
	#print $each_line2."\n";		#DEBUG
	print OUTPUT "$each_line2\n";
}
close(OUTPUT);

exit(0);
