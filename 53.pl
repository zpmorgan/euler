#!/usr/bin/perl
use warnings;
use strict; 
use bignum;

my @pow = (1);
for (1..100){
   $pow[$_] = $pow[$_-1] * $_;
}

my $count = 0;

for my $n (23..100){
   for my $r (3..$n-3){
      $count++ if ($pow[$n] / ($pow[$r]*$pow[$n-$r])) > 1000000;
   }
}
print "$count\n"

