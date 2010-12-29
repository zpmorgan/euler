#!/usr/bin/perl
use warnings;
use strict;

sub test_prime{
   my $p = shift;
   for (2..sqrt($p)+3){
      return 0 unless $p%$_;
   }
   return 1;
}

for my $a (1000..9999){
   my $sorted_a = join '', sort split //,$a;
   #next if $sorted_a eq 1478;
   next unless test_prime($a);
   for my $i (1..4000){
      my ($b,$c) = ($a+$i, $a+2*$i);
      last if $c > 9999;
      next unless test_prime($b);
      my $sorted_b = join '', sort split //,$b;
      next unless $sorted_a eq $sorted_b;
      next unless test_prime($c);
      my $sorted_c = join '', sort split //,$c;
      next unless $sorted_a eq $sorted_c;
      print "$a $b $c\n";
   }
}


