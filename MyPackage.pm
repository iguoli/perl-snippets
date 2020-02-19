package MyPackage;

use parent qw/Exporter/;

our @EXPORT = qw/$hi VPNlist/;

$hi = 'Welcome to perl module package';

sub VPNlist {
    my ($file) = @_;
    $file = 'PulseVPN.txt' unless $file;
    
    open (my $fh, "< :encoding(UTF-8)", $file) || die "can't open $file $!";

    while (<$fh>) {
        print if /http/;
    } 
}

