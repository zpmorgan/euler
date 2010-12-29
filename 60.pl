#!/usr/bin/perl
use warnings;
use strict; 
use Tie::CArray;
use List::Util 'sum';

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

for my $ax (4..$#P_seq){
   my $a = $P_seq[$ax];
   print "a $a\n";
   for my $bx (3..$ax-1){
      my $b = $P_seq[$bx];
      next unless is_prime($a.$b);
      next unless is_prime($b.$a);
      for my $cx (2..$bx-1){
         my $c = $P_seq[$cx];
         next unless is_prime($c.$a);
         next unless is_prime($a.$c);
         next unless is_prime($c.$b);
         next unless is_prime($b.$c);
         for my $dx (1..$cx-1){
            my $d = $P_seq[$dx];
            next unless is_prime($d.$a);
            next unless is_prime($a.$d);
            next unless is_prime($d.$b);
            next unless is_prime($b.$d);
            next unless is_prime($d.$c);
            next unless is_prime($c.$d);
                #  print "my \$sum = sum($a,$b,$c,$d);\n";
            for my $ex (0..$dx-1){
               my $e = $P_seq[$ex];
               next unless is_prime($a.$e);
               next unless is_prime($e.$a);
               next unless is_prime($b.$e);
               next unless is_prime($e.$b);
               next unless is_prime($c.$e);
               next unless is_prime($e.$c);
               next unless is_prime($d.$e);
               next unless is_prime($e.$d);
                  
               my $sum = sum($a,$b,$c,$d,$e);
               print "my \$sum = sum($a,$b,$c,$d,$e);\n";
               print "$sum\n";
                  
   }}}}
}




sub is_prime{
   my $p = shift;
   return $P[$p] if $p < $sieve_size;
   for (2..sqrt($p)){
      return 0 unless $p%$_;
   }
   return 1;
}







