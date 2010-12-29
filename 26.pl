#!/usr/bin/perl
use warnings;
use strict;

my $maxp = 1;
my $maxd = 1;

FOO:
for my $d (2..999){
   my $n = 1;
   my %places;
   my $index = 0;
   while(1){
      $n *= 10;
      last if $places{$n};
      $places{$n} = $index;
      $n %= $d;
      next FOO if $n==0;
      $index++;
   }
   my $p = $index - $places{$n};
   if ($p > $maxp){
      $maxd = $d;
      $maxp = $p;
   }
}
print "$maxd ($maxp) \n"


