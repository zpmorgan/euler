#!/usr/bin/perl
use warnings;
use strict;
use List::Util 'sum';

my @facs = (1,1);

push @facs, $facs[$#facs] * @facs until $#facs==9;

my $count;

for my $n (10..1000000){  print "$n\n" if rand() < .001;
   my %in_chain;
   until ($in_chain{$n}){
      $in_chain{$n}++;
      $n = sum map {$facs[$_]} split //,$n;
      #warn $n;
   }
   $count++ if keys %in_chain == 60;
}

print "$count\n"


