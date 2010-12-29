#!/usr/bin/perl
use warnings;
use strict;

my ($a,$b,$c);
FOO:
for $a (1..998){
   for $b (1..(999-$a)){
      $c = 1000-$a-$b;
      if ($a**2 + $b**2 == $c**2){
         print "($a*$b*$c)\n";
         print $a*$b*$c, "\n";
         exit;
      }
      
   }
}
print $a*$b*$c, "\n";


