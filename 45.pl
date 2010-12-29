#!/usr/bin/perl
use warnings;
use strict;

my %pents;
for (1..100000){
   my $p = $_*(3*$_-1)/2;
   $pents{$p}=1;
}

for (1..100000){
   my $h = $_*(2*$_-1);
   warn $h if $pents{$h}
}


