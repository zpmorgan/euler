#!/usr/bin/perl
use warnings;
use strict;

#pandigital product stuff
my %pd;

my %products;

for my $i (1234..4987){
   for my $j (2..9){
      push @{$products{$i*$j}}, $i.$j.$i*$j;
   }
}
for my $i (123..987){
   for my $j (2..98){
      push @{$products{$i*$j}}, $i.$j.$i*$j;
   }
}

FOO:
for my $product (keys %products){
   
   for (@{$products{$product}}){
      
      if ('123456789' eq join'',sort  split(//,$_)){
         $pd{$product} = 1;
         next FOO;
      }
   }
}
my $final = 0;
for (keys %pd){
   $final += $_ 
}

print "$final\n"




