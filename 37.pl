#!/usr/bin/perl
use warnings;
use strict;
use List::Util 'sum';

my @P = (0,0, map {1}2..999999);

for my $d (2..499999){
   next unless $P[$d];#not prime anymore
   my $foo = $d+$d;
   until($foo>=1000000){
      $P[$foo] = 0;
      $foo+= $d;
   }
}

my @T;
TTEST:
for (11..$#P){
   next unless $P[$_];
   my $x = $_;
   while($x){
      next TTEST unless $P[$x];
      $x =~ s/^.//;
   }
   $x = $_;
   while($x){
      next TTEST unless $P[$x];
      $x =~ s/.$//;
   }
   push @T, $_;
}

print scalar (@T) . "primes found: " . join(',',@T)."\n";
print "sum is ". sum(@T) ."\n";



