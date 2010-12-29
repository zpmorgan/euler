#!/usr/bin/perl
use warnings;
use strict;

my @digits = 0..9;
my $perms = 2*3*4*5*6*7*8*9;
my $result = '';

my $blarg = 999999;

for my $foo (reverse 0..9){
   my $i = int ($blarg / $perms);
   $blarg = $blarg % $perms;
   $result .= $digits[$i];
   @digits = grep {$_!=$digits[$i]} @digits;
   
   $perms /= $foo unless $foo==0;
}
print "$result\n"

