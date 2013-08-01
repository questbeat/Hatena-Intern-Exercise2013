use Data::Dumper;

my $app = sub {
	my ($env) = @_;
	my $path = $env->{PATH_INFO};

	if ($path eq "/echo") {
		my %params = map { split /=/ } (split /&/, $env->{QUERY_STRING});
		return [200, ['Content-Type' => 'text/plain'], [$params{body} . "\n"]];
	}

	return [200, ['Content-Type' => 'text/plain'], ["hello, world\n"]];
};

