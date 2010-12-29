#!/usr/bin/perl
use warnings;
use strict;
use List::Util 'sum';

my @abundant;

sub get_divisors{
   my $n = shift;
   my %divs ;#set
   for (1..sqrt($n)){
      unless ($n % $_){
         $divs{$_} = 1;
         $divs{$n/$_} = 1;
      }
   }
   delete $divs{$n};
   return keys %divs;
}

for (12..28123){
   if ($_ < sum(get_divisors($_))) {
      $abundant[$_] = 1;
      #warn $_;
   }
   #warn "$_}{" . join '|',get_divisors($_) ;
}

my $sum = 0;
FOO:
for my $n (1..28123){
   for (1..int($n/1)){
      next FOO if $abundant[$_] and $abundant[$n-$_]
   }
   $sum += $n;
}
print "$sum\n"


