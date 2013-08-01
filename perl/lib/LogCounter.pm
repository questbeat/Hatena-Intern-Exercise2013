package LogCounter;

use strict;
use warnings;

use Log;

sub new {
	my ($class, $logs) = @_;
	return bless { logs => $logs }, $class;
};

sub group_by_user {
	my ($self) = @_;
	my $group = {};

	for (@{$self->{logs}}) {
		my $user = exists $_->{user} ? $_->{user} : "guest";

		if (!exists $group->{$user}) {
			$group->{$user} = [];
		}
		
		push @{$group->{$user}}, $_;
	}

	return $group;
}

sub count_error {
	my ($self) = @_;
	my $count = grep { int $_->{status} / 100 == 5 } (@{$self->{logs}});

	return $count;
}

1;

