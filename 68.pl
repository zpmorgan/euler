#!/usr/bin/perl
use warnings;
use strict;
use List::Util 'sum';

my $target = 14;

my @nums = (9,8,7,6,5,4,3,2,1,10);
my @N = (undef,8,7,6,5,4,3,2,1,0,9);

my @doit = (
   undef,
   undef,
   #undef,
   [0,1],
   undef,
   [3,2],
   undef,
   [4,5],
   undef,
   [6,7],
   [8,1]
);

sub fill{
   my ($fivegon, @remaining) = @_;
   my @fivegon = @$fivegon;
   my $i = 0;
   $i++ while $fivegon[$i];#1st empty node
   return @fivegon if $i==10;
   #if ($i==3){
   #   $target = sum(@fivegon[0,1,2])
   #}
   if ($doit[$i]){#warn  @fivegon;
      my $req = $target - $fivegon[$doit[$i][0]]- $fivegon[$doit[$i][1]];
      return if $req<1 or $req > 10;
      if ($req==10){
         return if $i =~ /1|2|4|6|8/;
      }
      #warn $req;
      return unless $remaining[$N[$req]];
      $remaining[$N[$req]] = 0;
      $fivegon[$i] = $req;
      return fill([@fivegon],@remaining);
   }
   for (@nums){
      #warn $remaining[$N[$_]] if $_==8;
      next if $_ == 10 and $i =~ /1|2|4|6|8/;
      next unless $remaining[$N[$_]];
      #warn $_;
      $fivegon[$i] = $_;
      $remaining[$N[$_]] = 0;
      my @fivegon =  fill([@fivegon],@remaining);
      return @fivegon if $fivegon[0];
      $remaining[$N[$_]] = 1;
   }
   warn "not @fivegon";
   return undef;
}
my @derpnums = @nums;
$derpnums[$N[6]] = 0;
my @gon = fill([6,0,0,0,0,0,0,0,0,0],@derpnums);

print @gon[0,1,2,3,2,4,5,4,6,7,6,8,9,8,1], "\n";
__END__
my @greatests;
for (12..22){
   $target = $_;
   push @greatests, [fill([0,0,0,0,0,0,0,0,0,0],@nums)];
}

#print @$_, "\n" for @greatests;
@greatests = sort {$b <=> $a} grep {$_}map {join '',@{$_}[0,1,2,3,2,4,5,4,6,7,6,8,9,8,1]}  @greatests;
print "$greatests[0]\n";


__END__
not 9411013635752821



