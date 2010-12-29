#!/usr/bin/perl
use warnings;
use strict;
use bignum;
use Math::BigRat;
use List::Util 'sum';

# continued fraction

my @a;
for my $i(1..34){
   push @a, (1,$i*2,1);
}
@a = reverse @a[0..98];
push @a,2;

my $conv = Math::BigRat->new(shift @a);
for my $a(@a){
   my $d = $conv->denominator;
   my $n = $conv->numerator;
   $conv = Math::BigRat->new("$d/$n");
   #warn $conv;
   $conv += $a;
}
print sum split (//,$conv->numerator);
print "\n";

   my $d = $conv->denominator;
   my $n = $conv->numerator;
warn $n/$d

