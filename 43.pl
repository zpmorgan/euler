#!/usr/bin/perl
use warnings;
use strict;
use List::Util 'sum';

my @digits = 0..9;
my @primeys = (1,1,2,3,5,7,11,13,17,1);
my $sum = 0;

sub try{
   my ($num, @digits_remaining) = @_;
   my $p = $primeys[8-@digits_remaining];
   return if ($num%1000) % $p; 
   
   unless (@digits_remaining){
      $sum += $num;
   }
   for my $d (@digits_remaining){
      try ($num . $d, grep {$d != $_} @digits_remaining);
   }
}
try (0, @digits);
print "$sum\n"




