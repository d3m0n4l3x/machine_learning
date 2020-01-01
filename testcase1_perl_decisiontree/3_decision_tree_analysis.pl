#!/usr/bin/perl -w
use AI::DecisionTree;
$|=1;
$dtree = new AI::DecisionTree(noise_mode=>'pick_best', verbose=>'true');
#$dtree = new AI::DecisionTree();

open(INPUT3, "./alert_fast2.csv");
@content3=<INPUT3>;
chomp(@content3);
close(INPUT3);

foreach $each_line3 (@content3){
#Example:
#[1:402:7] ICMP Destination Unreachable Port Unreachable,Misc activity,ICMP,95.18.246.255,null,192.168.62.10,null,yes
	$each_line3=~/(.*),(.*),(.*),(.*),(.*),(.*),(.*),(.*)/;
	$threat=$1;
	$category=$2;
	$proto=$3;
	$src_ip=$4;
	$src_port=$5;
	$dest_ip=$6;
	$dest_port=$7;
	$result=$8;
	$dtree->add_instance(attributes => {threat => $threat,category => $category,proto => $proto,src_ip => $src_ip,src_port => $src_port,dest_ip => $dest_ip,dest_port => $dest_port}, result => $result);
}

$dtree->train;

#Example:
#[1:2015474:2] ET TROJAN ZeroAccess udp traffic detected,A Network Trojan was Detected,UDP,192.168.57.10,1053,66.85.130.234,53,yes
$analysis_result = $dtree->get_result(attributes => {threat => '[1:2015474:2] ET TROJAN ZeroAccess udp traffic detected',category => 'A Network Trojan was Detected',proto => 'UDP',src_ip => '192.168.57.10',src_port => '1053',dest_ip => '66.85.130.234',dest_port => '53'});

print $analysis_result."\n";
exit(0);
