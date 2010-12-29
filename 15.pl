#!/usr/bin/perl
use warnings;
use strict;

my %R_cache = ("0 0" => 1);

sub R{
   my ($a,$b) = @_;
   ($a,$b) = ($b,$a) if $a>$b;
   return 0 if $a<0;
   return $R_cache{"$a $b"} if defined $R_cache{"$a $b"};
   
   my $paths = R($a-1,$b) + R($a, $b-1);
   $R_cache{"$a $b"} = $paths;
   return $paths;
}

print R(20,20), "\n";



