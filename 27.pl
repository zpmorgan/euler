#!/usr/bin/perl
use warnings;
use strict;

my @P = (0,0, map {1}2..1200000);

for my $d (2..600000){
   next unless $P[$d];#not prime anymore
   my $foo = $d+$d;
   until($foo>=1000000){
      $P[$foo] = 0;
      $foo+= $d;
   }
}

my ($max, $product) = (1,1);

FOO:
for my $a (-999..999){warn $a;
   BAR:
   for my $b (-999..999){
      my $n=0;
      while (1){
         my $thingy = $n*$n + $a*$n + $b;
         last if $thingy<2 or !$P[$thingy];
         $n++;
      }
      if ($n>$max){
         $product = $a*$b;
         $max=$n;
      }
   }
}


print "$max | $product\n";






