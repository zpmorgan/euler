#!/usr/bin/perl
use warnings;
use strict;
use List::Util 'sum';

my @nums;

for my $n(100 .. 400000){
   push @nums,$n if $n == sum(map{$_**5}split(//,$n));
}
print ((sum(@nums)),"\n");
print join '|',@nums;


