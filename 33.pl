#!/usr/bin/perl
use warnings;
use strict;

my @pairs = 1112..9998;

for my $pair (@pairs){
   my ($d);
   my ($d1,$d2) = $pair =~ /(..)(..)/;
   #warn "$d1 $d2";
   next unless $d1<$d2;
   if ($pair =~ /(.)..\1/){
      $d = $1;
   }
   elsif ($pair =~ /.(.)\1./){
      $d = $1;
   }
   else {next}
   #warn $d;
   my ($s1,$s2) = $pair =~ /([^$d]).*([^$d])/;
   next unless $s2;
   #warn "$s1 $s2";
   next unless $d1/$d2 == $s1/$s2;
   warn  "$d1/$d2 == $s1/$s2 == " . ($s1/$s2);
   
   
}


