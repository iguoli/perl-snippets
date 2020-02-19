#!/usr/bin/perl

use warnings;
use feature 'say';

my $file = '/Users/guoli/tmp/old_fqdn_nodes.txt';
open my $fh, $file or die "Can't open $file: $!";
local $/;
while (<$fh>) {
 say $1 if /(Node Name:.*$)/m;
}
