#!/usr/bin/perl
use warnings;
use strict;
use Math::BigRat;

my $sieve_limit = 10**7;

# first, find all primes.
my @primes = (0,0,map{1}(1..$sieve_limit));
my @primeses;

for my $n (1..sqrt $sieve_limit){
   next unless $primes[$n]; #primes only
   my $foo = $n*2;
   while ($foo < $sieve_limit){
      $primes[$foo] = 0;
      $foo += $n;
   }
}
print "sieve done\n";
for (2..$#primes){
   push @primeses, $_ if $primes[$_];
}
#die totient(87109);
#die join ',',prime_factors(778669);
#die join ',',totient(778669);
my @perms;

for my $n (2..$sieve_limit){print "$n\n" if rand() < .0001;
   my $t = totient($n);
   next unless join ('', reverse sort split //,$t) == join ('',reverse sort split //,$n);
   push @perms, [$n,$n/$t];
}
@perms = sort {$a->[1] <=> $b->[1]} @perms;
print totient($perms[$_][0]) . " | $perms[$_][0] $perms[$_][1] \n" for (0..9);
print totient($perms[$_][0]) . " | $perms[$_][0] $perms[$_][1] \n" for reverse($#perms-9..$#perms);

my @factors; #contains nums less than 1001

sub totient{
   my $n = shift;#Math::BigRat->new(shift);
   return $n-1 if $primes[$n];
   return 1 if $n==1;
   my @facs = keys %{{ map {$_=>1} prime_factors($n) }};
   my $base = $n; #Math::BigRat->new($n);
   for (@facs){#warn $base;
      #$base *= Math::BigRat->new( ($_-1) .'/'.$_ );
      $base *= ($_-1);
      $base /= $_;
   }
   return $base;
}
sub prime_factors{
   my $n = shift;
   return @{$factors[$n]} if $factors[$n];
   my $sqrtn = sqrt($n);
   for (@primeses){
      last if $_ > $sqrtn;
      #warn "$n % $_ = " .$n%$_;
      next if $n%$_;
      my @n_facs = ($_, prime_factors($n/$_));
      #warn join ',',@n_facs;
      $factors[$n] = \@n_facs if $n<4000;
      return  @n_facs;
   }
   return $n;
}




