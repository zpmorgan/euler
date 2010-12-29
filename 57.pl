#!/usr/bin/perl
use warnings;
use strict; 
use Math::BigRat;

my $count = 0;

my @E = new Math::BigRat('2');


for (0..999){
   my $e = 2+1/$E[$_];
   push @E, $e;
   $e = 1+1/$e;
   $count++ if $e->numerator->length > $e->denominator->length;
   print "e  $count  \n"
}
print "$count\n"

