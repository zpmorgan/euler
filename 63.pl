#!/usr/bin/perl
use warnings;
use strict;
#use bignum;
use Math::BigInt;

my $count = 0;
I:
for my $i(1..200){
   for (1..9){
      my $derp = Math::BigInt->new($_)**$i;
      my @d = split //,$derp;
      next if @d < $i;
      next I if @d > $i;
      $count++;
   }
}

print "$count\n"

