#!/usr/bin/perl
use warnings;
use strict;
use List::Util 'sum';

my @formulas = (
   #sub {my$n=shift; $n*($n+1)/2},
   sub {my$n=shift; $n*$n},
   sub {my$n=shift; $n*(3*$n-1)/2},
   sub {my$n=shift; $n*(2*$n-1)},
   sub {my$n=shift; $n*(5*$n-3)/2},
   sub {my$n=shift; $n*(3*$n-2)},
);

my @chains;
my %chains; #indexed by prefix

for my $fn (0..$#formulas){
   my $f = $formulas[$fn];
   for my $n (1..1234){
      my $figurate = $f->($n);
      next if $figurate < 1000;
      last if $figurate > 9999;
      my $chain = [[0,0,0,0,0],[$figurate]];
      $chain->[0][$fn] = $figurate;
      push @chains, $chain;
      push @{$chains{int($figurate/100)}}, $chain;
   }
}
#die join ',', map {$_->[1][0]} @chains;
my $i = 0;
while ($i < $#chains){
   my $chain = $chains[$i];
   next if @{$chain->[1]} == 3;
   my $last_value = $chain->[1][$#{$chain->[1]}];
   my $suffix = $last_value % 100;
   for my $affix (@{$chains{$suffix}}){
      next if grep {$affix->[0][$_] and $chain->[0][$_]} (0..$#formulas);
      my $new_chain = [[map {$affix->[0][$_] or $chain->[0][$_]} (0..$#formulas)]];
      push @{$new_chain->[1]}, @{$chain->[1]};
      push @{$new_chain->[1]}, @{$affix->[1]};
      next if @{$new_chain->[1]} > 3;
      push @chains, $new_chain;
      push @{$chains{int($new_chain->[1][0]/100)}}, $chain;
      
      if (@{$new_chain->[1]} == 5){
         next unless int($new_chain->[1][0]/100) == $new_chain->[1][4] % 100;
         print join (',', @{$new_chain->[1]}), "\n";
         print sum(@{$new_chain->[1]}), "\n";
         exit;
      }
   }
   $i++
}

@chains = grep { @{$_->[1]} == 5 } @chains;
for (keys %chains){
   $chains{$_} = [ grep {@{$_->[1]} == 3 } @{$chains{$_}} ];
}







