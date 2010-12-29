#!/usr/bin/perl
use warnings;
use strict;
use List::Util 'sum';
use Math::Numbers;

my %amicables;
my @d;

for my $i (2..9999){
   my $d = d($i);
   next if $d==$i or $d==1;
   if (d($d) == $i){
      @amicables{$d,$i} = (1,1)
   }warn $i;
}
print sum(grep {$_<10000} keys %amicables), "\n";

sub d{
   my $n = shift;
   my $num = Math::Numbers->new($n);
   return sum($num->get_divisors) - $n
}





