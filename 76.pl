#!/usr/bin/perl
use warnings;
use strict;

#my $sum_of = 100;
my @S;

sub find_summations{
   my ($sum_of,$max) = @_;
   return $S[$sum_of][$max] if defined $S[$sum_of][$max];
   $max = $sum_of if (!defined $max or $max>$sum_of);
   return 1 if $sum_of < 2;
   my $s = 0;
   for (1..$max){
      $s += find_summations($sum_of-$_, ($_<$max?$_:$max));
    #  print " find_summations($sum_of-$_, ($_<$max?$_:$max)); = " . find_summations($sum_of-$_, ($_<$max?$_:$max));;
    #  print "\n";
   }
   $S[$sum_of][$max] = $s;
   return $s;
}


print find_summations(100)-1;
print "\n";
