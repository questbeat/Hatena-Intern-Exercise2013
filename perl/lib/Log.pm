package Log;

use strict;
use warnings;

sub new {
	my ($class, %args) = @_;
	return bless \%args, $class;
}

sub protocol {
	my ($self) = @_;
	if ($self->{req} =~ /(\S+) (\S+) (\S+)/) {
		return $3;
	}
	return "";
}

sub method {
	my ($self) = @_;
	if ($self->{req} =~ /(\S+) (\S+) (\S+)/) {
		return $1;
	}
	return "";
}

sub path {
	my ($self) = @_;
	if ($self->{req} =~ /(\S+) (\S+) (\S+)/) {
		return $2;
	}
	return "";
}

sub uri {
	my ($self) = @_;
	if ($self->{req} =~ /(\S+) (\S+) (\S+)/) {
		my $path = $2;
		if ($3 =~ /(\S+)\/.*/) {
			my $protocol = lc $1;
			return $protocol . "://" . $self->{host} . $path;
		}
	}
	return "";
}

sub time {
	my ($self) = @_;
	my $epoch = int $self->{epoch};
	my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = gmtime($epoch);
	return sprintf("%04d-%02d-%02dT%02d:%02d:%02d",
		$year + 1900,
		$mon + 1,
		$mday,
		$hour,
		$min,
		$sec);
}

1;

