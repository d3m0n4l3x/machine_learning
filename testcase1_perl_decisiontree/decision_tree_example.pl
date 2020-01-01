#!/usr/bin/perl -w
#Refer to http://search.cpan.org/~kwilliams/AI-DecisionTree-0.11/lib/AI/DecisionTree.pm
use AI::DecisionTree;
$dtree = new AI::DecisionTree;
  
$dtree->add_instance(attributes => {outlook     => 'sunny',
                    temperature => 'hot',
                    humidity    => 'high'},
     result => 'no');
  
$dtree->add_instance(attributes => {outlook     => 'sunny',
                    temperature => 'hot',
                    humidity    => 'normal'},
     result => 'yes');

$dtree->add_instance(attributes => {outlook     => 'overcast',
                    temperature => 'cold',
                    humidity    => 'normal'},
     result => 'no');

$dtree->add_instance(attributes => {outlook     => 'sunny',
                    temperature => 'cold',
                    humidity    => 'normal'},
     result => 'yes');


$dtree->train;
  
$result = $dtree->get_result(attributes => {outlook     => 'sunny',
                    temperature => 'hot',
                    humidity    => 'normal'});

print $result."\n";
exit(1);