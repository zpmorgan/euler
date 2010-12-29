#!/usr/bin/perl
use warnings;
use strict;
#use bignum;

#my %P; #$P{$k $n} = 32424;
my @P; #$P[$k][$n] = 32424;

sub p{
   my ($k,$n) = @_;
   ($k,$n) = (1,$k) unless defined $n;
   return $P[$k][$n] if $P[$k][$n];
   # the number of partitions of n using only natural numbers at least as large as k
   
   #$k = 1 unless defined $k;
   return 0 if $k > $n;
   return 1 if $k > $n/2;
   $P[$k][$n] = (p($k+1,$n) + p($k,$n-$k)) % 1000000;
   return $P[$k][$n];
}
#die p(1,6000), ;
for (1..6000000){
   print p(1,$_) . "   $_\n";
   #"$_\n"
   last unless p(1,$_) % 1000000;
   
}





