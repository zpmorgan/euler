#!/usr/bin/perl
use warnings;
use strict;
use Math::BigRat;

my @pete = (Math::BigRat->new(1)); #9 4-sided dice
my @colin = (Math::BigRat->new(1)); #6 6-sided dice

sub add_die{
   my ($probs, $sides) = @_;
   my $max_roll = $#{$probs} + $sides;
   my @new_probs;
   for my $side (1..$sides){
      for my $i (0..scalar(@$probs)){
         next unless $probs->[$i];
         $new_probs[$i + $side] += $probs->[$i] / $sides;
      } 
   }
   @$probs = @new_probs;
}

add_die(\@pete, 4) for 1..9;
add_die(\@colin, 6) for 1..6;

my $pete_win = 0;
for my $pete (0..$#pete){
   next unless $pete[$pete];
   for my $colin (0..$#colin){
      next unless $colin[$colin];
      last if $colin >= $pete;
      #warn "$pete  $colin";
      $pete_win += $pete[$pete]*$colin[$colin];
   }
}
#die $pete_win;
my $n = $pete_win->numerator;
my $d = $pete_win->denominator;
print ("$n" / "$d", "\n");



