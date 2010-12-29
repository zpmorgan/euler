#!/usr/bin/perl
use warnings;
use strict; 

my $i = 1;
my $pcount = 0;
my $l = 0;
my $d = 1;
while (1){
   $l += 2;
   $d += 4;
   $pcount += grep {is_prime ($_)} map {$i+$l*$_} (1..4);
   #warn join ',',grep {is_prime ($_)} map {$i+$l*$_} (1..4);
   $i += $l*4;
   last if ($pcount / $d) < .1;
   warn "$l $i,  ($pcount / $d)=".  ($pcount / $d) if rand()<.03;
}

print "$pcount, size: $l + 1 \n";


sub is_prime{
   my $p = shift;
   for (2..sqrt($p)){
      return 0 unless $p%$_;
   }
   return 1;
}

