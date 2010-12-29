#!/usr/bin/perl
use warnings;
use strict;
use Math::BigInt;
my $a = Math::BigInt->new(3)/2;
die $a;

my $top_d = 0; #looking for highest d
my $top_x = 0;
my $top_y = 0;

D:
for my $D (1..1000){
   print "$D\n";
   next if sqrt($D) == int sqrt($D);
   my $y=0;
   while(1){
      $y++;
      my $x_sq = $D*($y**2)+1;
      my $x = sqrt($x_sq);
      #warn $y;
      next unless $x == int $x;
      if ($x > $top_x){
         $top_x = $x;
         $top_y = $y;
         $top_d = $D;
         next D;
      }
      #print "$y\n" if rand()<.0001;
   }
   die "foo $D"
}
print "$top_x^2 - $top_d*$top_y^2 = 1\n"
