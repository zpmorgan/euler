#!/usr/bin/perl
use warnings;
use strict;

sub euclid {
   my( $a, $b ) = @_;
   return ($b) ? euclid( $b, $a % $b ) : $a;
}

my $count = 0;

for my $d (1..12000){
   my $l = 1+int($d/3);
   my $u = ($d/2);
   $u = $u==int($u) ? $u-1 : int($u);
   next if $l > $u;
   for ($l..$u){
      $count++ if euclid($_,$d) == 1;
   }
   #$count += $u -$l + 1;
   #print "$count\n"
}

print "$count\n";

