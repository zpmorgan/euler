#!/usr/bin/perl
use warnings;
use strict;
#use bignum;
#use Math::BigInt;

# continued fraction

my $odds = 0;
I:

for my $n(1..10000){
   my $a0 = int sqrt($n);
   next if $a0 == sqrt($n);
   my $a = $a0;
   my $m = 0;
   my $d = 1;
   my %CF;
   while(1){
      #warn "$m $d $a";
      $m = $d*$a-$m;
      $d = ($n - $m**2) / $d;
      $a = int(($a0+$m) / $d);
      last if $CF{"$a $d $m"};
      $CF{"$a $d $m"}++;
      
   }
    $odds++ if keys(%CF)&1;
   
}

print "$odds\n"

