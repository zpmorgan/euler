#!/usr/bin/perl
use warnings;
use strict;
use List::Util 'sum';

print sum (grep {join('',reverse split //,sprintf('%b',$_)) eq sprintf('%b',$_)} grep {$_ == join'',reverse split //,$_} 1..999999);

