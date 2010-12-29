#!/usr/bin/perl
use warnings;
use strict;

my @C = (1,2,5,10,20,50,100,200);

sub ways{
   my ($amount, $tier) = @_;
   return 1 if $tier==0;
   my $tier_coin = $C[$tier];
   my $total_ways = 0;
   for(0..$amount/$tier_coin){
      $total_ways += ways($amount-($tier_coin*$_), $tier-1);
   }
   return $total_ways;
}

print ways(200,$#C), "\n"

