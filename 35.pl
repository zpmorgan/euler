#!/usr/bin/perl
use warnings;
use strict;

my %C;
my @P = (0,0, map {1}2..999999);

for my $d (2..499999){
   next unless $P[$d];#not prime anymore
   my $foo = $d+$d;
   until($foo>=1000000){
      $P[$foo] = 0;
      $foo+= $d;
   }
}
warn join '|',@P[2..10];

BLARG:
for my $p (2..999999){
   next unless $P[$p];
   next if $C{$p};
   my @questionable = $p;
   my $foo = rotate ($p);
   until ($foo == $p){
      next BLARG unless $P[$foo];
      push @questionable, $foo;
      $foo = rotate ($foo);
   }
   for (@questionable){
      $C{$_} = 1;
   }
}

print scalar keys %C;
print "\n";


sub rotate{
   my $n = shift;
   $n =~ s/^(\d)//;
   $n .= $1;
}


