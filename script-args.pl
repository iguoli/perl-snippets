#!/usr/bin/perl

use warnings;
use feature 'say';

sub usage {
    say "Error: $_[0]" if $_[0];
    print << "USAGE";
Usage:
    $0 -h           get the help of the script.
    $0 -d [path]    show the entries under the path, use current directory if no path provided.
USAGE
    exit 1;
}

if (@ARGV) {
    # let's process the options here
    while (@ARGV) {
        local $_ = shift @ARGV;
        # show the files in specific directory
        /^-d/ and do {$dir = shift @ARGV; next;};
        # show the script usage
        /^-h/ and do {usage(); next;};
        # if we got here, then we have an invalid option
        say 'Error: not a valid option.';
        usage();
        exit 1;
    }
} else {
    usage();
    exit 1;
}

$dir = '.' unless $dir;
dir_files($dir);

sub dir_files {
    my ($dir) = @_;
    opendir(DIR, $dir) or die "Can't open $dir: $!";
    # print the file which name start with [A-Za-z0-9_]
    say for (grep /^\w+/, readdir(DIR));
}
