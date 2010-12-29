#!/usr/bin/perl
use warnings;
use strict;

my $closest_n;
my $closest = 0;

for my $d (1..1000000){
   next if $d%7 == 0;
   my $n = int($d*3/7);
   my $val = $n/$d;
   next if $val == 3/7;
   if ($val > $closest){
      $closest_n = $n;
      $closest = $val;
   }
}

print "$closest_n\n";

