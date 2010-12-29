#!/usr/bin/perl
use warnings;
use strict;

#jan is 0, 1st day of month is 0. 1900 is 1900.
my ($day,$month,$year) = (5,0,1900);

my @modays = (31,28,31,30,31,30,31,31,30,31,30,31);
sub days_in_month{
   my ($month,$year) = @_;
   if ($month==1){ #feb
      return 28 if $year==1900;
      return 29 if $year%4 == 0;
      return 28;
   }
   return $modays[$month]
}

my $blargles = 0;

while($year <= 2000){
   $blargles++ if $day==0;
   $day += 7;
   if ($day >= days_in_month($month,$year)){
      $day %= days_in_month($month,$year);
      $month++;
      if ($month>=12){
         $year++; $month=0;
      }
   }
}
print "$blargles\n"


