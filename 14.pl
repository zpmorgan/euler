#!/usr/bin/perl
use warnings;
use strict;
use Math::BigInt;

my $tri=Math::BigInt->new(0);
my $i = 0;

while(1){
   $i++;
   $tri += $i;
   my $j = $tri;
   my $numDiv = 0;
   my $sqrtj = sqrt($j);
   my $k=0;
   while ($k < $sqrtj){
      if ($j%$k == 0){
         $j /= $k;
         $sqrtj = sqrt(j);
         next;
      }
   }
   if ($numDiv > 500){
      print "$tri\n";
      last
   }
}
