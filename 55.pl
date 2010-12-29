#!/usr/bin/perl
use warnings;
use strict; 
use bignum;
use List::Util 'sum';
my $max_sum=0;

sub pow{
   my ($a,$b) = @_;
   my $n = 1;
   $n *= $a for 1..$b;
   $n
}

NUM:
for my $a (10..99){
   for my $b (10..99){
      my $sum = sum(split //, pow($a,$b));
      $max_sum = $sum if $sum > $max_sum;
   }
   print "a is $a\n"
}
print "$max_sum\n"

