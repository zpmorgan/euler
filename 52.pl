#!/usr/bin/perl
use warnings;
use strict; 
use Tie::CArray;

my $sieve_size = 5*(10**6);

my @P = new Tie::CIntArray(10000);
$P[0] = $P[1] = 0;
my $i;
for ($i=2;$i<=$sieve_size;$i++){
   $P[$i] = 1
}
warn 'init done.';

my @P_seq;

for my $d (2.. sqrt $sieve_size){
   next unless $P[$d];#not prime anymore
   my $foo = $d+$d;
   until($foo>$sieve_size){
      $P[$foo] = 0;
      $foo+= $d;
   }
   warn $d
}
for (2..$#P){
   push @P_seq, $_ if $P[$_];
}
print "done with sieve\n";
my $base;
for ($base = 0;$base < $#P; $base++){
   next unless $base &1;
   my $multiplier = $base;
   $multiplier =~ tr/0-9/0000001000/;
   #next if $multiplier =~ /^1/;
   next if $multiplier==0;
   #warn "$base $multiplier";
   my @primes = grep {$P[$_]} map {$base + $_*$multiplier} -6..3;
   #warn scalar @primes;
   next if @primes < 8;
   print join ',',@primes, "\n";
   #print "$primes[0] \n";
   last;
}



