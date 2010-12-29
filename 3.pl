#!/usr/bin/perl
use warnings;
use strict;
use bignum;

my $num = 600851475143;

my $largest = 1;

my $fac = 3;

my $sqrt = sqrt ($num) + 1;
while ($fac < $sqrt){
   if ($num % $fac == 0){
      $largest = $fac;
      $num /= $fac;
      $sqrt = sqrt($num);
      next;
   }
   $fac++;
#   warn $fac .' '.$num;
}
print $largest .','. $num;


