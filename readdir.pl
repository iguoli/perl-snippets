#!/usr/bin/perl

use warnings;
use feature 'say';

use Term::ANSIColor;

my $dir;

if (@ARGV) {
    ($dir) = @ARGV;
} else {
    say "Usage: $0 <path>";
    exit 1;
}

list_files($dir);
say "\n--while loop version--\n";
list_files_in_while($dir);

sub list_files {
    my ($dir) = @_;
    opendir(DIR, $dir) or die "Can't open $dir, $!";

    # get the files which name starts with [A-Za-z0-9_]
    my @files = grep /^\w+/, readdir DIR;

    # remove the .bak from the endding name of the file
    s/.bak$// for (@files);

    say join("\n", @files);
}

# can be used in while loop as of v5.12
sub list_files_in_while {
    my ($dir) = @_;
    my @files;
    opendir(DIR, $dir) or die "Can't open $dir, $!";
    while (readdir DIR) {
        s/.bak$//;
        push @files, $_ if /^\w+/;
    }
    say join("\n", @files);
}

