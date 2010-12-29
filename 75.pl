#!/usr/bin/perl
use warnings;
use strict;

my $L_bound = 1500000;
my $sqrtL = sqrt $L_bound;

my @L;
my %L;
#generate primitive triples, and see if they scale to 1500000.
M:
for my $m (1..sqrt($L_bound)){#warn $m;
   last if $m > $sqrtL;
   N:
   for my $n (1 .. $m-1){
      #for (2..$m/2){
      #   next N if ($m%$_ == 0 and $n%$_ == 0)
      #}
#      my $p = 2*$m*($m+$n) ; 
      my ($a,$b,$c) = sort {$a <=> $b} ($m*$m-$n*$n, 2*$m*$n, $m*$m+$n*$n);
      my $p = $a+$b+$c ;
      
      next M if $p > $L_bound;
      my $foo = 1;
      while($p*$foo <= $L_bound){
         $L[$p*$foo]{join ' ',($foo*$a,$foo*$b,$foo*$c)} = 1;
         #if ($foo == 12000){
         #   warn "$m $n"
         #}
         $foo ++;
      }
   }
}
for (0..120){
   next unless defined $L[$_];
   print "$_: ". join (',',keys(%{$L[$_]})) . "\n";
}

#print join ',', grep {$_} @L[0..130], "\n";
print scalar grep {defined $_ and keys %$_==1} @L[0..$L_bound];
print "\n";
__END__
my @squares;
for (0..749999){
   $squares[$_] = $_*$_;
}
my %is_square = map {$_=>1} @squares;

my $count = 0;

for my $h (1..749999){warn $h if rand() < .01;
   my $hcount = 0;
   my $hsq = $squares[$h];
   for (1..$h){
      $hcount++ if $is_square{1500000 - $hsq - $squares[$_]};
      last if $hcount > 1;
   }
   $count++ if $hcount == 1;
}
print "$count\n";


