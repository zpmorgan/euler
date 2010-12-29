#!/usr/bin/perl
use warnings;
use strict;

my @primes = (0,0,map{1} 2..1999999);

for my $i (2..sqrt(2000000)){
   next unless $primes[$i];
   my $j = $i+$i;
   while($j <= 2000000){
      $primes[$j] = 0;
      $j += $i;
   }
}

my $sum = 0;
for (2..2000000){
   $sum += $_ if $primes[$_];
}

print $sum;

