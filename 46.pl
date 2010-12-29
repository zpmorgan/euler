#!/usr/bin/perl
use warnings;
use strict;

my %C;
my @P = (0,0, map {1}2..1000000);
my @p_facs;

for my $d (2..1000000){
   next unless $P[$d];#not prime anymore
   my $foo = $d+$d;
   until($foo>=1000000){
      my $d_power = 1;
      my $reduced = $foo/$d;
      until ($reduced % $d**$d_power){
         $reduced /= $d;
         $d_power++;
      }
      $P[$foo] = 0;
      $p_facs[$foo]{$d**$d_power} = 1;
      $foo+= $d;
   }
}
warn %{$p_facs[40]};

for (1..999910){
   next if keys %{$p_facs[$_]} < 4;
   next if keys %{$p_facs[$_+1]} < 4;
   next if keys %{$p_facs[$_+2]} < 4;
   next if keys %{$p_facs[$_+3]} < 4;
   print "$_\n";
   last;

}





