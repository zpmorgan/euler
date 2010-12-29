#!/usr/bin/perl
my @primes = ();
my $i = 1;

FOO:
while (@primes < 10001){
   $i++;
   my $sqrt = int sqrt($i);
   for (2..$sqrt){
      next FOO if $i % $_ == 0;
   }
   push @primes, $i;
}
print $primes[10000], "\n";

