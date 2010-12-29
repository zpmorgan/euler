#!/usr/bin/perl
use warnings;
use strict;

my @names = eval(<>);

@names = sort {$a cmp $b} @names;
unshift @names, 'FOO';
#print $names[44]

my $sum=0;
for my $i (1..$#names){
   my $score = 0;
   map {$score += ord($_) - ord('A')+1} split(//,$names[$i]);
   $sum += $score * $i;
}
print "$sum\n"

