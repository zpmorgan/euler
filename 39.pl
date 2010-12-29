#!/usr/bin/perl
use warnings;
use strict;
use List::Util 'sum';

my @PD;

OUTER:
for my $i (1..99999){
   my $num = '';
   for my $j (1..9){
      $num .= $i*$j;
      next if $num < 100000000;
      next OUTER if $num >= 1000000000;
      push @PD, $num if '123456789' eq join'',sort split //,$num;
      last;
   }
}
print [sort @PD]->[-1], "\n"


