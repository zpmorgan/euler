#!/usr/bin/perl
use warnings;
use strict;
use bignum;

my %d_sorted_cubes;

for (1..63333){
   warn "cube $_\n" if rand()<.01;
   my $cube = $_**3;
   my $dsort = join '',sort split //,$cube;
   #$dsort += 0;
   #warn $dsort;
   
   push @{$d_sorted_cubes{$dsort}}, $cube;
#   warn join
   
   if (@{$d_sorted_cubes{$dsort}} >= 5){
      print join (',',sort @{$d_sorted_cubes{$dsort}}) . "\n";
      exit
   }
}





