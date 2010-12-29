#!/usr/bin/perl
use warnings;
use strict; 
use bignum;
my $lcount=0;

NUM:
for my $n (1..9999){
   for (1..50){
      my $r = join '',reverse split //,$n;
      $r += 0; #apparently, this isn't a bignum else :\
      #warn "$n | $r";
      next NUM if $r == $n and $_>1;
      #warn "$n  $r , " . ($n + $r);
      $n += $r;
   }
   $lcount++;
}
print "$lcount\n"

