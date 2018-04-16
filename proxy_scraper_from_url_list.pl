#!/usr/bin/perl
# Usage: proxyScraper.pl [proxy_file]
use strict;
use warnings;
use WWW::Mechanize;
use Try::Tiny;
my $source_file=shift;
open (INPUT_FILE, "<$source_file")  || die "Can't open $source_file: $!\n";
my @sources = ;
my $crawler = WWW::Mechanize->new();
foreach (@sources) {
	try {
		$crawler->get($_);
		# hunt for IP:PORT combination
		my @ips= $crawler->text() =~ /(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\:\d{1,5})/g;
		foreach (@ips){
			print "$_\n";
		}
	} catch { 
		warn "[!] Error, who cares\n";
	}
}