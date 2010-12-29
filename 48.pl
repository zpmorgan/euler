#!/usr/bin/perl
use warnings;
use strict;

my $sum = 0;

for my $n (1..1000){
   my $foo = 1;
   for (1..$n){
      $foo = ($foo * $n) % 10**10;
   }
   $sum = ($sum+$foo) % 10**10;
}
print "$sum\n"

