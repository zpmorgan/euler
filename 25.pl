#!/usr/bin/perl
use warnings;
use strict;
use bignum;

my @fib = (0,1,1);
my $i = 2;

while(split(//,"$fib[$i]") < 1000){
   $i++;
   $fib[$i] = $fib[$i-1] + $fib[$i-2];
   #warn $fib[$i];
   warn scalar split(//,"$fib[$i]");
}
print "$i\n"

