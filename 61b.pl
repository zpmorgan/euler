#!/usr/bin/perl
use warnings;
use strict;
use List::Util 'sum';

#I thought this problem would be way more computationally expensive
#because my 1st attempt didn't work at all
#so I optimized a bunch with masks & hashes

my @formulas = (
   sub {my$n=shift; $n*($n+1)/2},
   sub {my$n=shift; $n*$n},
   sub {my$n=shift; $n*(3*$n-1)/2},
   sub {my$n=shift; $n*(2*$n-1)},
   sub {my$n=shift; $n*(5*$n-3)/2},
   sub {my$n=shift; $n*(3*$n-2)},
);

#my @singles1;
my %chains1; #indexed by {prefix}->{mask}
my %chains2;
my %chains4;
my %chains6;


for my $fn (0..$#formulas){
   my $f = $formulas[$fn];
   for my $n (1..1234){
      my $figurate = $f->($n);
      next if $figurate < 1000;
      last if $figurate > 9999;
      #warn $figurate;
      my $chain = [$figurate];
      my @mask = (0,0,0,0,0,0);
      $mask[$fn] = 1;
      my $mask = join '',@mask;
      $mask += 0;
      
      my $prefix = int($figurate/100);
      #push @chains1, $chain;
      push @{$chains1{$prefix}{$mask}}, $chain;
   }
}
my @possible_masks1 = (1,10,100,1000,10000,100000);
my @possible_masks2 = grep {sum (split(//,$_)) == 2} map {sprintf("%b",$_)}1..62;
#warn join ',',@possible_masks2;
my @possible_masks4 = grep {sum (split(//,$_)) == 4} map {sprintf("%b",$_)}1..62;
my %potent_masks11;
for my $a (@possible_masks1){
   $potent_masks11{$a} = [grep {($a+$_) !~ /2/ } @possible_masks1]
}
my %potent_masks22;
for my $a (@possible_masks2){
   $potent_masks22{$a} = [grep {($a+$_) !~ /2/ } @possible_masks2]
}
my %potent_masks24;
for my $a (@possible_masks2){
   $potent_masks24{$a} = [grep {($a+$_) !~ /2/ } @possible_masks4];
   #warn join ',', keys %potent_masks24;
}
   #warn join ',', @{$potent_masks24{11}};


sub combine_chains{
   my ($in1, $in2, $out, $potent_masks) = @_;
   for my $pre (keys %$in1){
      for my $mask (keys %{$in1->{$pre}}){
         my $masks_to_try = $potent_masks->{$mask};
         for my $chain (@{$in1->{$pre}{$mask}}){
            
            my $suf = $chain->[-1]%100;
            for my $m2 (@$masks_to_try){
            #warn join ',',@$masks_to_try;
            #die $suf;
            #die %{$in1->{10}};
            #die $m2;
            #warn join ',',keys %{$in2->{$suf}};
               for my $chain2 (@{$in2->{$suf}{$m2}}){
                  
                  my $new_mask = $mask+$m2;
                  my $new_chain = [@$chain, @$chain2];
                  #die @{$new_chain};
                  push @{$out->{$pre}{$new_mask}}, $new_chain;
                  #die @{$out->{$pre}{$new_mask}[0]}
               }
               #next unless $pre == $suf;
            }
         }
      }
   }
}
 combine_chains(\%chains1, \%chains1, \%chains2, \%potent_masks11);
 combine_chains(\%chains2, \%chains2, \%chains4, \%potent_masks22);
 combine_chains(\%chains2, \%chains4, \%chains6, \%potent_masks24);
#warn keys %chains1;
#warn keys %chains6;

for my $pre (keys %chains6){
   for my $chain_of_6 (@{$chains6{$pre}{111111}}){
      my $suf = $chain_of_6->[5]%100;
      next unless $pre == $suf;
      print join (',',@$chain_of_6) . "\n sum is: ". sum(@$chain_of_6) . "\n";
      exit;
   }
}

