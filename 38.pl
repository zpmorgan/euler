#!/usr/bin/perl
use warnings;
use strict;
use List::Util 'sum';

my $max_p = 0;
my $max_sols = 0;
my @squares = map {$_*$_} (0..999);
sub sqsum{
   my ($a,$b)
}

for my $p (500..799){#warn $p;
   my $sols = 0;
   for my $a ($p/3+1..$p/2){
      for my $b (1..$p-$a-1){
         my $c = $p-$a-$b;
         $sols++ if $squares[$a] == $squares[$b]+$squares[$c]
      }
   }
   if ($sols>$max_sols){
      $max_p = $p;
      $max_sols = $sols;
   }
}
print "$max_sols $max_p \n"


