#!/usr/bin/perl
use warnings;
use strict;
use List::Util 'sum';

my @facs = ( 1, 1,2,6,
   2*3*4,
   2*3*4*5,
   2*3*4*5*6,
   2*3*4*5*6*7,
   2*3*4*5*6*7*8,
   2*3*4*5*6*7*8*9,);

my $sum = 0;
for my $n (3..2540160){
   next unless $n == sum map {$facs[$_]} split //,$n;
   $sum += $n;
}
print "$sum\n"






