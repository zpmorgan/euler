#!/usr/bin/perl
use warnings;
use strict;

my $sum = 0;

my @digit = (0,3,3,5,4,4,3,5,5,4);
#starting at 10:
my @teens = (3,6,6,8,8,7,7,9,8,8);

#twenty, thirty,...
my @blorg = (0,0,6,6,6,5,5,7,6,6);

sub twodigit{
   my $n = shift;
   return $digit[$n] if $n<10;
   return $teens[$n-10] if $n<20;
   return $digit[$n%10] + $blorg[$n/10];
}

for my $n(1..99){
   $sum += twodigit($n);
}
for my $n(100..999){
   my @digits = split(//,$n);
   $sum += $digit[$digits[0]];
   $sum += 7;
   my $and = twodigit($digits[1] . $digits[2]);
   $sum += 3+$and if $and;
}


$sum += 11; #one thousand = 11


print "$sum\n"

