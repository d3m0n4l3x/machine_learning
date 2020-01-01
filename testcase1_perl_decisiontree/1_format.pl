#!/usr/bin/perl -w
$|=1;

system("head -n 200 ./alert.fast.txt > ./alert.fast2.txt");

$input_file="./alert.fast2.txt"; 		#Snort Fast Alert
open(INPUT_FILE, "$input_file");
@content=<INPUT_FILE>;
chomp(@content);
close(INPUT_FILE);

open(OUTPUT_FILE, ">./alert_fast2.csv");

for $each_line (@content){
	#print $each_line."\n";			#DEBUG Purpose
	if(($each_line=~m/\{TCP\}/) || ($each_line=~m/\{UDP\}/)){
		$each_line=~/\[\*\*\] (.*) \[\*\*\] \[Classification: (.*)\] \[Priority:.*\{(.*)\} (.*):(.*) -> (.*):(.*)/;
		$threat_name=$1;
		$class=$2;
		$proto=$3;
		$source_ip=$4;
		$source_port=$5;
		$dest_ip=$6;
		$dest_port=$7;
	}elsif($each_line=~m/\{ICMP\}/){
		$each_line=~/\[\*\*\] (.*) \[\*\*\] \[Classification: (.*)\] \[Priority:.*\{(.*)\} (.*) -> (.*)/;
		$threat_name=$1;
		$class=$2;
		$proto=$3;
		$source_ip=$4;
		$source_port="null";
		$dest_ip=$5;
		$dest_port="null";
	}else{
		next;
	}
	#print "$threat_name,$class,$proto,$source_ip,$source_port,$dest_ip,$dest_port\n";		#DEBUG
	print OUTPUT_FILE "$threat_name,$class,$proto,$source_ip,$source_port,$dest_ip,$dest_port\n";
}

close(OUTPUT_FILE);

exit(0);
