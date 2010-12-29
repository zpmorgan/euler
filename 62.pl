#!/usr/bin/perl
use warnings;
use strict;
use Math::BigInt;

sub perms_of_digit_counts{
   my ($base, $first_call, @counts) = @_;
   return $base unless grep {$_} @counts;
   my @perms;
   for (0..9){
      next if $first_call and $_==0;
      if ($counts[$_]){
         $counts[$_]--;
         push @perms, perms_of_digit_counts($base . $_, 0, @counts);
         $counts[$_]++;
      }
   }
   return @perms;
}

my %cubes = (1=>1);
my $largest_cube = 1;
my $largest_base = Math::BigInt->new(1);

sub is_cube{
   my $n = shift;
   #warn $n;
   until ($largest_cube > $n){
      $largest_base++;
      $largest_cube = $largest_base**3;
      $cubes{$largest_cube} = 1;
      #warn "$largest_cube = $largest_base**3";
   }
   return $cubes{$n}
}


for (1..33333){
   warn "cube $_\n" if rand()<.01;
   my $cube = Math::BigInt->new($_)**3;
   my @digit_count = map {0} 0..9;
   $digit_count[$_]++ for split(//,$cube);
   #warn join ',',@digit_count;
   
   my @cubes;
   #warn $cube;
   for (perms_of_digit_counts( '', 1, @digit_count)){
      #print "$_\n";
      if (is_cube($_)){
         push @cubes, $_;
      }
   }
   if (@cubes >= 3){
      print join (',',sort @cubes) . "\n";
      exit
   }
}





