#!/usr/bin/perl

use warnings;
use feature 'say';

my @keys = qw/a b c/;
my %hash;
@hash{@keys} = ();

say 'true' if %hash;
say 'undefined' unless defined $hash{'a'};
say 'exists' if exists $hash{'a'};
