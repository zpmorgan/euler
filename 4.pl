#!/usr/bin/perl
use warnings;
use strict;

my $largest = 0;

for(700..999){
   my $i = $_;
   for(700..999){
      my $j = $_;
      my $p = $i*$j;
      if ($p == join('',reverse(split '',$p))){
         $largest = $p unless $p<$largest;
      }
   }
}


print $largest

