#!/usr/bin/perl
use warnings;
use strict;

my %C;
my @P = (0,0, map {1}2..10000000);

for my $d (2..10000){
   next unless $P[$d];#not prime anymore
   my $foo = $d+$d;
   until($foo>=10000000){
      $P[$foo] = 0;
      $foo+= $d;
   }
}

warn;

COMPO:
for my $i (4..$#P){
   next unless $i&1; #odd only
   next if $P[$i];
   for my $sqrt (1..10000){
      my $sq2 = 2*($sqrt**2);
      #next COMPO if $sq > $i;
      next COMPO if $P[$i- $sq2];
      last if $sq2 >= $i;
   }
   print "$i\n";
   last;
}



