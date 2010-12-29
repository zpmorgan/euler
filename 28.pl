#!/usr/bin/perl
use warnings;
use strict;

my $sum = 1;
my $n = 1;

for my $i (1..500){
   my $foo = 2*$i;
   for (1..4){
      $n += $foo;
      $sum += $n;
   }
}
print "$sum\n"

