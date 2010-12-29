#!/usr/bin/perl
use warnings;
use strict;

my @D;

for (1..999999){
   push @D, split //,$_;
}
print (( $D[1-1]*$D[10-1]*$D[100-1]*$D[1000-1]*$D[10000-1]*$D[100000-1]*$D[1000000-1] )."\n");

