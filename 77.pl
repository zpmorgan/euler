#!/usr/bin/perl
use warnings;
use strict;
use Tie::CArray;

my $sieve_size = (10**6);
my @P = new Tie::CIntArray($sieve_size);
$P[0] = $P[1] = 0;
my $i;
for ($i=2;$i<=$sieve_size;$i++){
   $P[$i] = 1
}
for my $d (2.. sqrt $sieve_size){
   next unless $P[$d];#not prime anymore
   my $foo = $d+$d;
   until($foo>$sieve_size){
      $P[$foo] = 0;
      $foo+= $d;
   }
}
print "done with sieve\n";


#my $sum_of = 100;
my @S;

sub find_summations{
   my ($sum_of,$max) = @_;
   $max = $sum_of if (!defined $max or $max>$sum_of);
   return $S[$sum_of][$max] if defined $S[$sum_of][$max];
   return 0 if $sum_of==0;
   return 0 if $sum_of==1;
   return 0 if $sum_of==3 and $max < 3;
   return 1 if $sum_of==2 and $max > 1;
   return 1 if $sum_of==3 and $max > 2;
   my $s = 0;
   $s++ if $P[$sum_of] and $max == $sum_of;
   #warn "$sum_of $max";
   for (2..$max){
      next unless $P[$_];
      my $foo = find_summations($sum_of-$_, ($_<$max?$_:$max));
      #warn $foo if $sum_of==10;
      next unless $foo;
      $s += $foo;
    #  print " find_summations($sum_of-$_, ($_<$max?$_:$max)); = " . find_summations($sum_of-$_, ($_<$max?$_:$max));;
    #  print "\n";
   }
   $S[$sum_of][$max] = $s;
   #print "\$S[$sum_of][$max] = $s;\n";
   return $s;
}
#die find_summations(10);
for (2..500000){
   die $_ if find_summations($_)> 5000;
}
#print find_summations(100)-1;
print "\n";
