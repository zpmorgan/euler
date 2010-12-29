#!/usr/bin/perl
use warnings;
use strict;
use List::Util 'sum';

my @P;
my %is_in_P;
my $min_D = 85000000;

for (1..100000){
   $P[$_] = $_*(3*$_-1)/2;
   $is_in_P{$P[$_]} = 1;
}
warn;
NUM:
for my $p(1..89999){
   for (1..10000){
      my $D = $P[$p+$_] - $P[$p];
      next NUM unless $D < $min_D;
      next unless $is_in_P{$D};
      next unless $is_in_P{$P[$p+$_] + $P[$p]};
#      warn;
      $min_D = $D
   }
}

print "$min_D\n"


