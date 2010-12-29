#!/usr/bin/perl
use warnings;
use strict;
use bignum;

my $sum = 0;
my $sqsum = 0;

for (1..100){
   $sum += $_;
   $sqsum += $_*$_;
}
print $sum*$sum - $sqsum;


