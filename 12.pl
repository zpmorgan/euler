#!/usr/bin/perl
use warnings;
use strict;
#6264030  32
#6267570  32
#6271111 

my $tri=0;
my $i = 0;

while(1){
   $i++;
   $tri += $i;
   next if $tri < 10000000;
   next if $tri&2;
   next if $tri%3;
   
   my $divs = 0;
   for (1..sqrt($tri)){
      if ($tri % $_ == 0){
         $divs++;
      }
   }
   $divs += $divs;
   
      print "$tri  $i  $divs\n";
   if ($divs > 500){
      print "$tri\n";
      last
   }
}
