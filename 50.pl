#!/usr/bin/perl
use warnings;
use strict;

my @P = (0,0, map {1}2..1000000);
my @P_seq;

for my $d (2..1000000){
   next unless $P[$d];#not prime anymore
   my $foo = $d+$d;
   until($foo>=1000000){
      $P[$foo] = 0;
      $foo+= $d;
   }
}

for (2..$#P){
   push @P_seq, $_ if $P[$_];
}

my $max_sum = 2;
my $max_primes = 1;

for my $start (0..$#P_seq){
   my $sum = 0;
   my $i = $start;
   while ($i < $#P){
      last if $sum+$P_seq[$i] > 999999;
      $sum += $P_seq[$i];
      $i++;
   }
   next unless $P[$sum];
   if ($i-$start > $max_primes){
      $max_primes = $i-$start;
      $max_sum = $sum;
   }
}
print "$max_sum   $max_primes \n"

