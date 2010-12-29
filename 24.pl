#!/usr/bin/perl
use warnings;
use strict;
use bignum;

my %steve;

for my $i (2..100){
   for my $j(2..100){
      $steve{$i**$j} = 1;
   }
}

print scalar keys %steve;
print "\n"
