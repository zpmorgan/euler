#!/usr/bin/perl
use warnings;
use strict;
use List::Util 'sum';

my @digits = reverse (1..7);

sub try{
   my ($num, @digits_remaining) = @_;
   unless (@digits_remaining){
      for (2..sqrt($num)){
         next if ($_&1)==0 and $_ > 2;
         #warn "$i / $_";
         unless ($num % $_){
            print "$num / $_ = " , $num / $_ , "\n";
            return;
         }
      }
      print "$num\n";
      exit;
   }
   for my $d (@digits_remaining){
      try ($num . $d, grep {$d != $_} @digits_remaining);
   }
}
try ('', @digits);

my $i = 987654322;

NUM:
while(1){
   $i--;
   next unless $i&1 and $i%3 and $i%5 and $i%7;
   next unless '123456789' eq join ('', sort {$a cmp $b} split (//,$i));
   #warn $i; warn join ('', sort {$a cmp $b} split (//,$i));
   for (11..sqrt($i)){
      next unless $_&1;
      #warn "$i / $_";
      next NUM unless $i % $_;
   }
   print "$i\n";
   last;
}


