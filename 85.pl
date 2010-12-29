#!/usr/bin/perl
use warnings;
use strict;

my @R1 = (0,1);
sub R1{
   my $R = shift;
   return $R1[$R] if $R1[$R];
   $R1[$R] = R1($R-1) + $R;
   return $R1[$R];
}
my $best_area=1;
my $best_rects;

my $i=0;
I:
while(++$i){
   last if R1($i) > 2200000;
   my $j=0;
   while(++$j){
      if ($j > $i){
         last;
      }
      my $rects = R1($i) * R1($j);
      my $area = $i*$j;warn $rects;
      next if $rects < 1500000;
      next I if $rects > 2500000;
      #warn "$i $j $area" ;#if abs($area-2000000) < abs($best_area-2000000);
      if (abs($rects-2000000) < abs($best_rects-2000000)){
         $best_area = $area;
         $best_rects = $rects 
      }
      $j++;
   }
}
warn $best_area


