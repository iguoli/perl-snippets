#!/usr/bin/perl

use warnings;
use feature 'say';

sub args_test {
    my %args = (
        start => 0,
        end   => 10,
        step  => 1,
        @_,
    );

    say "The arguments are:";
    for my $key (keys %args) {
        say "    $key => $args{$key}";
    }

    say "\nThe sequence number:";
    for (my $i=$args{'start'}; $i<$args{'end'}; $i+=$args{'step'}) {
        say "    $i";
    }
}

args_test(step=>2);
