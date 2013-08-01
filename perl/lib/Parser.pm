package Parser;

use strict;
use warnings;

use Log;

sub new {
    my ($class, %args) = @_;
    return bless \%args, $class;
}

sub parse {
	my ($self) = @_;
	open my $fh, '<', $self->{filename} or die $!;
	return [map {
		chomp;
		my %args = map { /(.+?):(.+)/; ($2 ne "-") ? ($1, $2) : () } (split /\t/);
		my $log = Log->new(%args);
	} (<$fh>)];
}

1;

