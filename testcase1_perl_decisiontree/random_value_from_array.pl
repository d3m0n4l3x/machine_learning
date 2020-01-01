#!/usr/bin/perl -w
$|=1;

@a=('yes','no');
$item = $a[ rand @a ];
print $item."\n";

exit(0);