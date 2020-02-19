#!/usr/bin/perl


use warnings;
use feature 'say';

# open a pipe to read from a program or
# write to a program, that will execute a command,
# return value is the pid of the subprocess

say "Give a command as argument to exectue!" and die "$!" unless @ARGV;
my $cmd = $ARGV[0];
my $pid = open my $ph, '-|', $cmd . ' 2>&1' or die "$!: $cmd";

# undef the $/ to get all output one time
local $/;
my $output = <$ph>;
close($ph);

my $EXITVAL = $? >> 8;

say "pid: $pid";
say "exit code: $EXITVAL";
say "command output:\n$output";
